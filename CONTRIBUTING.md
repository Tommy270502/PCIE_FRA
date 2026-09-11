# Contributing

This is a mixed hardware/firmware/host-software project, so "does it build" is
not one question. What follows is the short version of how to work on it without
breaking the parts you are not touching.

## Before you push

```bash
make check
```

That is lint plus both RTL testbenches, and it needs no board and no Xilinx
install beyond a simulator. CI runs the same thing. Everything past this point
needs hardware.

## What is source and what is not

The single rule that keeps this repository readable: **if a tool wrote it, it
does not get committed.**

Vivado and Vitis both generate large trees that look like source — CMake caches,
compile databases, `.clangd` files, IDE state, device-tree preprocessor output,
run directories. All of it carries absolute paths from whichever machine
generated it, and none of it is reproducible anywhere else. This repository
tracked 481 such files once; they were removed, and CI now fails if a tracked
file contains an absolute home-directory path.

The exceptions, and why:

| Tracked | Why |
| --- | --- |
| `software/PCIE_FRA/**/libsrc/`, `include/` | Vendored AMD embeddedsw sources (MIT). The BSP is built *from* these by `scripts/build_bsp.sh`; the archives it produces are not tracked. |
| `software/PCIE_FRA/**/bsp.yaml` | Records which driver versions the BSP was generated from. Provenance, not config — the paths in it are historical. |
| `hardware/**/*.xpr`, `*.bd`, `*.xci` | The Vivado project. Absolute paths are inherent to the format. |

## Building

`make help` lists every target. The ones that matter:

| | |
| --- | --- |
| `make all` | Host tools, BSP and firmware. No Vivado, no board. |
| `make check` | Lint and both testbenches. Run this before pushing. |
| `make gateware` | Block design rewire, then the signoff build. Slow, needs Vivado. |
| `make verify` | End-to-end pass/fail against the board. |

## Changing the RTL

`scripts/run_sim.sh` is the fast loop — seconds, against the sources directly,
rather than minutes through the Vivado project. It uses xsim when Vivado is
installed and GHDL otherwise; both run the same self-checking testbenches.

Two things to know:

- A testbench "passing" means it printed its completion marker *and* tripped no
  assertion. Neither simulator's exit status alone distinguishes those, which is
  why `run_sim.sh` checks both.
- `tb_pcie_bar_regs` needs VHDL-2008 (it uses `to_hstring`). The harness and the
  project flow both set that per-file; a bare `xvhdl` will not.

A bitstream only gets written on a clean signoff pass: zero setup/hold
violations, ADC/DAC/PCIe clocks constrained, no DRC or methodology errors or
critical warnings. Do not relax those gates to get a build out.

## Changing the measurement maths

The sweep maths exists twice on purpose — once in `software/FRA_Controller/src/main.c`
(firmware) and once in `software/host/fra_cli.c` (host) — so that a sweep driven
over the UART and the same sweep driven over PCIe produce identical numbers.
**Changing one means changing the other.** The cross-check is `single 1000` run
from both sides; they must agree to the printed precision.

Register definitions exist three times: `fra_core.vhd`, `fra_pcie.h`, and the
firmware's `REG_*` defines. `docs/PCIE_BAR0_REGISTER_MAP.md` is the reference.

## Hardware, and what it costs to get wrong

The board lives in a developer's daily machine and is slot-powered, so recovery
from a bad state usually means a full host shutdown. Three things are worth
knowing before running anything that touches it:

- **Never soft-reset the PS after `program_flash`.** Writing `SLCR.PSS_RST_CTRL`
  leaves the PL unconfigured and wedges the debug port. No JTAG reset clears it
  and the chain has no SRST pin; only a power-on reset recovers.
- **Reprogramming the FPGA drops the live PCIe link.** Usually the root port
  retrains; otherwise `sudo software/host/scripts/fra-pcie-rescan.sh`, and
  failing that a reboot.
- **Validate a flash with a real power cycle**, not a warm reboot. Only a full
  power-off reconfigures the FPGA from QSPI — which has to happen before the
  host POSTs, or the endpoint is never enumerated.

## Style

`.editorconfig` covers the mechanics. Beyond that: comments explain *why*, since
most of what is non-obvious here is a hardware or toolchain constraint rather
than logic. Several of the scripts carry a paragraph explaining a trap that cost
real time — that is deliberate, keep it up.
