# PCIe Host Validation

On-hardware validation of the PCIe path and the gateware loopback, with the
AN108 AD/DA module **not fitted**. Everything here exercises the digital chain
only; the analog front end is untested and remains the one open item.

## Bench configuration

| Item | Value |
| --- | --- |
| Board | Alinx AX7015B, `xc7z015clg485-2` (`PSS_IDCODE` = `0x0373B093`) |
| Boot mode | QSPI — `SLCR.BOOT_MODE` @ `0xF800025C` = `0x00000001` |
| Gateware | `fra_core` 1.1.0, `pcie_bar_regs` 1.1.0 |
| Host | Linux 7.0, AMD-Vi IOMMU, Secure Boot **on** (lockdown = `integrity`) |
| PCIe | `10ee:7021` @ `0000:08:00.0`, 2.5 GT/s x1, 8 KB BAR0 |
| Host access | `vfio-pci` (sysfs BAR `mmap` is blocked by lockdown) |
| JTAG | Digilent FT232H `210512180081` |
| UART | CP2102N, 115200 8N1 |

## Link and enumeration

```
08:00.0 Memory controller [0580]: Xilinx Corporation Device [10ee:7021]
        Subsystem: Xilinx Corporation Device [10ee:0007]
        Region 0: Memory at f6d00000 (32-bit, non-prefetchable) [size=8K]
current_link_speed  2.5 GT/s PCIe     max_link_speed  2.5 GT/s PCIe
current_link_width  1                 max_link_width  1
```

Boot order is what makes this work: the FPGA configures from QSPI before the
host POSTs, so the endpoint is already linked when the BIOS enumerates and
assigns BAR0.

## BAR0 access (`fra_bar_test`)

```
PCIe FRA endpoint at 0000:08:00.0, BAR0 mapped (8192 bytes) via vfio-pci

pcie_bar_regs window (BAR0+0x0000):
  BOARD_ID     = 0xA7015B00 (expect 0xA7015B00) OK
  VERSION      = 0x00010100
  SCRATCH      7 patterns write/read-back OK
  SCRATCH2     7 patterns write/read-back OK
  byte-strobe  per-lane writes assemble to 0x44332211 OK

fra_core window (BAR0+0x1000):
  VERSION      = 0x00010100
  STATUS       = 0x00000002
  PHASE_INC    write/read-back OK
```

## Loopback distinguishes gateware from the missing module

Driven over JTAG at 1 kHz, amplitude 128, 2 settle / 4 measure cycles, with the
only difference being `CONTROL.LOOPBACK_EN`:

| | `LOOPBACK_EN = 0` | `LOOPBACK_EN = 1` |
| --- | --- | --- |
| `STATUS` | `0x1A` = DONE \| ADC_CLIP \| LOW_SIGNAL | `0x02` = DONE |
| `SAMPLE_COUNT` | 100000 | 100000 |
| ADC min / max | 255 / 255 | 64 / 191 |
| `I_ACC` | -258343 | 404401490 |
| `Q_ACC` | -254787 | -90971 |

With loopback off the ADC pins float high, so the core correctly reports
clipping and low signal. With it on, the DAC word is measured instead: min/max
straddle midscale by ±63.5 counts, exactly the ±`127*128/255` the amplitude
setting predicts.

## Host-driven self-test over PCIe

`fra_cli selftest`, amplitude 128 (expected magnitude `127*128/255` = 63.7490
counts, expected phase `-360*f/25e6`):

| freq_hz | mag_counts | expected | phase_deg | predicted | samples |
| ---: | ---: | ---: | ---: | ---: | ---: |
| 100 | 63.6855 | 63.7490 | 0.0001 | -0.0014 | 999992 |
| 1000 | 63.6853 | 63.7490 | -0.0129 | -0.0144 | 100000 |
| 10000 | 63.6827 | 63.7490 | -0.1427 | -0.1440 | 10000 |
| 20000 | 63.6774 | 63.7490 | -0.2839 | -0.2880 | 5000 |

Magnitude is consistently 0.1% low. That is the rounding in `scale_lut`'s
exact-divide-by-255, not a measurement error — it is deterministic and
calibrates out.

Phase tracks the predicted one-sample-tick delay across three decades. Sample
counts match `measure_cycles * 25e6 / f` exactly (the 100 Hz row is 8 samples
short of 1e6 because the DDS phase increment quantises).

## Cross-check: UART firmware vs host over PCIe

The same measurement, taken two different ways from the same core:

```
board UART   single 1000 -> 63.685, -0.013, 100000 samples
host  PCIe   single 1000 -> 63.6853, -0.0129, 100000 samples
```

Both masters reach `fra_core` through `axi_smc` and agree to the printed
precision.

## Calibrate then sweep

`fra_cli --loopback cal` followed by `fra_cli --loopback sweep`, 20 log-spaced
points from 10 Hz to 20 kHz: all 20 points valid, every point normalising to
`0.000000` dB and `0.000` degrees. Raw CSVs are in
`docs/assets/pcie_loopback_validation/`.

That figure measures repeatability of the digital chain, not analog accuracy.
For the analog result with the module fitted, see
`docs/loopback_accuracy_report.md` (~0.002 dB / ~0.01 degrees post-calibration).

## Recovering the board after flashing

`program_flash` leaves the FPGA holding its flash-writer design and devcfg in a
dirty state. Validate the flashed image with a **real power cycle**, not a soft
reset.

Writing `SLCR.PSS_RST_CTRL` to reboot the PS in place does not work here: the PS
resets but the BootROM does not reconfigure the PL (`DEVCFG_STATUS` bit 12
`PCFG_INIT` goes from 1 to 0, and reads of `0x43C0_0000` time out), and the
debug port is left wedged reporting `APB AP transaction error, DAP status
0x30000021`.

What was tried, and did not clear it:

| Attempt | Result |
| --- | --- |
| `rst -srst` | `srst not supported for target` — this chain has no SRST pin |
| `rst -system`, `rst -cores` | `Invalid target` — no core target to select once the DAP is down |
| Reprogramming the PL over JTAG | Succeeds (`DONE_status = 1`), but does not touch the PS |
| Killing `hw_server`/`cs_server` and reconnecting fresh | DAP still reports the same error, so it is not stale tooling state |

The scan chain itself stays healthy throughout — a fresh `jtag targets` reads
both IDCODEs correctly:

```
1  Digilent JTAG-HS1 210512180081
   2  arm_dap  (idcode 4ba00477 irlen 4)
   3  xc7z015  (idcode 0373b093 irlen 6 fpga)
```

So the cable, TAP and FPGA are fine; it is specifically the APB access port to
the PS debug bus that is wedged. That is on-chip state, and only a power-on
reset clears it.

Note that the PCIe link stays up through all of this, because `axi_pcie` and
`pcie_bar_regs` live in the PCIe reference-clock domain rather than the PS
fabric clock — which is the reason `pcie_bar_regs` was deliberately kept out of
the PS clock/reset domain. `fra_core` at `BAR0+0x1000` does depend on the PS, so
do not read that window while the PS is in an unknown state: with `FCLK_CLK0`
stopped the AXI read never completes and the host sees a completion timeout.

The board is slot-powered, so a full host shutdown (S5) is what power-cycles it.
A warm reboot does not.

## Still open

1. **Observing a clean QSPI boot** (`README.md` Validation check 8). The image was written and verified
   byte-for-byte, and its three components were each exercised over JTAG before
   flashing (bitstream: `DONE_status = 1` plus a working PCIe endpoint and
   `fra_core`; application: the CLI responding on UART with the correct core
   version; FSBL: unchanged, and its `ps7_init.c`/`.h` are byte-identical to the
   XSA exported from this build). What has not been observed is the
   BootROM -> FSBL -> bitstream -> application sequence running for real, which
   needs a power-on reset.

2. **The analog front end** (`README.md` Validation check 9). Measuring an RC low-pass against its expected
   response, to the +/-2 dB and +/-15 degrees acceptance target, needs the AN108
   module connected. Nothing in the software or gateware blocks it — the
   loopback exists precisely so the rest of the chain could be proven without
   it.
