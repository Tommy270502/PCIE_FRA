# PCIe BAR0 Register Map

AX7015B / `xc7z015clg485-2`, PCIe x1 Gen1 endpoint.

**Status: validated on hardware.** The endpoint trains at 2.5 GT/s x1 and
enumerates as `10ee:7021` with an 8 KB BAR0. Host reads/writes to both BAR0
windows are confirmed working via `software/host/fra_bar_test`.

## Device facts established (U1–U4)

Confirmed from the Vivado 2025.1 device database (`link_design -part xc7z015clg485-2`):

| # | Question | Answer (with evidence) |
|---|----------|------------------------|
| U1 | Hard PCIe block? | **Yes.** `get_sites` returns `SITE_TYPE=PCIE_2_1, count=1` at `PCIE_X0Y0`. → **Path A.** |
| U2 | Usable PCIe IP? | `axi_pcie:2.9`, `pcie_7x:3.3`, `xdma:4.2` all `create_ip` cleanly for the part. Using **`axi_pcie`** (BAR→AXI bridge) for Stages 1–4. |
| U3 | PERST pin? | `B34_L4_N` = `IO_L4N_T0_34` = **`M6`**. IOSTANDARD **`LVCMOS33`** (see Risk R2). |
| U4 | GT lane map? | Quad **112** (not 115). Lane 0 (W4/Y4/W8/Y8)→`GTPE2_CHANNEL_X0Y1`; Lane 1 (AA3/AB3/AA7/AB7)→`GTPE2_CHANNEL_X0Y0`; refclk U9/V9→`GTPE2_COMMON_X0Y0`. |

PCIe config: Vendor `0x10EE`, Device `0x7021`, BAR0 = **8 KB** Memory (IP minimum; brief asked 4 KB but `axi_pcie` floors at 8 KB), `PCIEBAR2AXIBAR_0 = 0x0` (BAR0 offset 0 → AXI address 0).

## BAR0 window layout

The 8 KB BAR0 decodes two AXI4-Lite slaves:

| BAR0 offset | Block | Clock domain | Reset source |
|---|---|---|---|
| `0x0000`–`0x0FFF` | `pcie_bar_regs` | `axi_pcie/axi_aclk_out` (62.5 MHz) | `proc_sys_reset_pcie` |
| `0x1000`–`0x1FFF` | `fra_core` | PS `FCLK_CLK0` (50 MHz) | `proc_sys_reset_0` |

`pcie_bar_regs` sits in the PCIe clock/reset domain deliberately, so the host
can still read the identity registers when the PS is held in reset. `fra_core`
cannot: it is clocked by `FCLK_CLK0`, so host access to the `0x1000` window
requires the PS to be running. QSPI boot satisfies that long before the host
finishes enumerating.

Both the PS (`M_AXI_GP0`) and the host (BAR0) reach `fra_core` through
`axi_smc`, which arbitrates between them. Nothing serialises a *sequence* of
register writes, so drive the core from one side at a time.

### Address map (from `hardware/fra_zynq7015_pcie/scripts/add_pcie_endpoint.tcl`)

```
axi_pcie_0/M_AXI space:
  SEG_pcie_bar_regs_0_reg0   offset 0x00000000  range 4K
  SEG_fra_core_0_reg0        offset 0x00001000  range 4K

processing_system7_0/Data space:
  SEG_fra_core_0_reg0        offset 0x43C00000  range 64K   (unchanged)
```

## BAR0 + 0x0000 (`pcie_bar_regs`, AXI4-Lite)

| Offset | Register | Access | Reset value | Description |
|-------:|----------|:------:|------------:|-------------|
| `0x00` | `BOARD_ID` | RO | `0xA7015B00` | Board magic ("AX7015B"); host identity check |
| `0x04` | `VERSION`  | RO | `0x00010100` | Gateware version 1.1.0 (1.0.0 = `fra_core` not mapped over BAR0) |
| `0x08` | `SCRATCH`  | RW | `0x00000000` | Host write/read-back smoke test |
| `0x0C` | `CONTROL`  | RW | `0x00000000` | bit0 = host→PS attention (informational only in Stage 2) |
| `0x10` | `SCRATCH2` | RW | `0x00000000` | Spare RW |
| `0x14` | `RESERVED` | RO | `0x00000000` | Reads 0 |
| `0x18` | `RESERVED` | RO | `0x00000000` | Reads 0 |
| `0x1C` | `RESERVED` | RO | `0x00000000` | Reads 0 |

Writes honour `WSTRB` per byte lane. Writes to RO/reserved offsets complete with `OKAY` and are ignored.

Host test: `software/host/fra_bar_test`. Reading `VERSION` as `0x00010000`
means the gateware predates the `fra_core` BAR0 window; `0xFFFFFFFF` at
`0x1000` means the same thing.

## BAR0 + 0x1000 (`fra_core`)

Identical to the PS-side map at `0x43C0_0000` — see the register table in the
top-level `README.md`. The only addition in gateware 1.1.0 is:

| CONTROL bit | Name | Description |
|---|---|---|
| 4 | `LOOPBACK_EN` | Substitute the DAC word for the ADC pins inside `fra_core`. Lets the DDS → sample → I/Q chain be exercised with no AN108 module fitted. |

Loopback introduces exactly one sample tick of delay, so the measured phase is
`-360 * f / 25e6` degrees (≈ `-0.29°` at 20 kHz) and the magnitude is
`127 * amp/255` counts (≈ 63.7 at the default amplitude of 128). It exercises
gateware only and says nothing about the analog front end.

## Risk Register

| Risk | Symptom of failure | Recovery |
|------|--------------------|----------|
| **R1 — GT lane/channel mapping** | At x2, link trains with lanes swapped or won't reach L0 (lspci shows degraded/`LnkSta` width x1). | Stage 1 uses **x1 on lane 0** only; pinning the serial pair to W4/W8 forces `GTPE2_CHANNEL_X0Y1`, so reversal can't occur. When moving to x2, enable PCIe **lane reversal** in the IP (lane0=X0Y1 is the higher channel) or set explicit GT `LOC`s. |
| **R2 — PERST / bank-34 VCCO** | DRC bank-VCCO conflict at Stage 0 if PERST set to LVCMOS25 (brief's value), because bank-34 DAC pins are LVCMOS33. | Constrain PERST `M6` as **LVCMOS33** (done in `pcie_pins.xdc`). Matches bank-34 VCCO *and* PCIe CEM 3.3 V PERST# signaling. If the board truly runs bank 34 at 2.5 V, the existing DAC constraints would already fail DRC — they don't, so 3.3 V is correct. |
| **R3 — Refclk AC-coupling / quality** | Link never trains; `user_link_up` stays low; `LnkSta` never set. | TX & refclk are AC-coupled on the expansion board (confirmed). Verify 100 MHz present at U9/V9 on a scope; confirm `SLOT_CLOCK_CONFIG` matches (common refclk). Try `reduce_oob_freq` only if the OOB detect is marginal. |
| **R4 — Vivado IP availability/license** | `create_ip`/synth errors that the block is not licensed or not for this part. | Already disproved: all three IPs instantiate for `xc7z015`. `axi_pcie` is license-free. If synth flags a feature license, fall back to a smaller config. |
| **R5 — Host enumeration** | `lspci -d 10ee:7021` shows nothing, or device with all-FF config space. | PERST polarity (active-low) and refclk must be right first. Confirm BAR0 size/type in config space; check `dmesg` for "BAR ... failed to assign". Reseat / boot host with card already configured (7-series PCIe needs link up before host enumeration window closes — program bitstream before host POST, or use a host that re-scans). |
| **R6 — PERST polarity** | Endpoint held in reset (no link) or never resets. | Defaulted to **active-low** per PCIe spec; `PULLUP` keeps it defined. If the schematic shows an inverter, drop the inversion in the BD reset path. |
| **R7 — BD integration vs fra_core** | fra_core address/clock changes; FRA build regresses; PS and host contend for the core. | As of gateware 1.1.0 the PCIe master *does* reach fra_core, by design. `hardware/fra_zynq7015_pcie/scripts/add_pcie_endpoint.tcl` widens `axi_smc` to two slave ports so the PS and the host arbitrate onto it. The PS path keeps its address and clock (`M_AXI_GP0` → `axi_smc` → `0x43C0_0000` @ `FCLK_CLK0`), so firmware is unaffected — confirmed on hardware, where a UART `single 1000` and a host PCIe `single 1000` return identical results. AXI arbitration makes individual transactions safe but does not serialise a *sequence* of register writes, so drive the core from one side at a time. Re-run `run_pcie_impl_signoff.tcl` after any BD change. |

## What is verified

Verified on hardware (host: Linux 7.0, AMD-Vi IOMMU, Secure Boot on):

- **Link training** — 2.5 GT/s, x1, matching `max_link_speed` / `max_link_width`.
- **Enumeration** — `10ee:7021`, class `0x058000`, subsystem `10ee:0007`,
  BAR0 8 KB non-prefetchable, assigned by the host BIOS at POST.
- **BAR0 reads** — `BOARD_ID` = `0xA7015B00`.
- **BAR0 writes** — both scratch registers pass walking patterns; per-byte
  `WSTRB` verified (four single-byte writes assemble to `0x44332211`).
- **Boot ordering** — `SLCR.BOOT_MODE` (`0xF800025C`) reads `0x1` (QSPI), so
  the FPGA is configured from flash before the host POSTs. This is what makes
  R5 a non-issue: the endpoint is already up when the enumeration window opens.
- **PS-side AXI** — `fra_core` VERSION read over JTAG at `0x43C00000`.

Risks R3 (refclk), R5 (enumeration) and R6 (PERST polarity) are all closed by
the working link. R1 remains open only for a future x2 configuration.

Not yet verified:

- **Analog front end.** The AN108 AD/DA module is not fitted, so nothing
  downstream of `dac_out` / upstream of `adc_in` has been exercised. The
  gateware loopback (`CONTROL.LOOPBACK_EN`) covers the digital chain only.
