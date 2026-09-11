# Vivado scripts

Run from the repository root. Most are reachable through the top-level
`Makefile`, which is the preferred entry point — `make help`.

## Build

| Script | | `make` |
| --- | --- | --- |
| `add_pcie_endpoint.tcl` | Builds the PL side of `system_bd`: the PCIe endpoint, `pcie_bar_regs`, both interconnects and the BAR0 address map. **This is the definition of the block design** — edit it, not the `.bd`. Idempotent: re-running deletes the cells it owns first. | `make gateware` |
| `run_pcie_impl_signoff.tcl` | Implementation → bitstream → XSA on the current project state. Does not touch the block design. Writes the BIT and XSA only on a clean pass: timing met, ADC/DAC/PCIe clocks constrained, no DRC or methodology errors or critical warnings. | `make gateware` |
| `run_pcie_stage0_drc.tcl` | Synthesis and DRC only — pin LOCs, GT placement, bank voltages. Minutes rather than the better part of an hour, so run it before committing to a full build. | `make drc` |

Both `.bd` and `.xpr` are tracked, so a bad block-design run is recoverable:

```bash
git checkout -- hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.srcs/sources_1/bd
```

## Simulation

| Script | |
| --- | --- |
| `run_fra_core_sim.tcl` | `tb_fra_core` through the Vivado project. |
| `run_pcie_bar_regs_sim.tcl` | `tb_pcie_bar_regs` through the Vivado project. Adds the testbench to `sim_1` and marks it VHDL-2008 (it uses `to_hstring`). |

For day-to-day RTL work use `scripts/run_sim.sh` from the repository root
instead. It runs the same self-checking testbenches directly against the sources
in seconds rather than minutes, and works with either xsim or GHDL. These two
scripts exist because a pass through the project is the closer match to what the
signoff build compiles.

## Board diagnostics

Fallbacks for when the endpoint does not enumerate or the console is silent.
When the system is up, `fra_cli status` over PCIe or `status` on the board
console answer the same questions far faster.

| Script | |
| --- | --- |
| `fra_core_jtag_read.tcl` | Drives a complete measurement over JTAG against `fra_core` at `0x43C0_0000`, independent of both the UART and PCIe. Needs the XSA for the PL address map; set `FRA_XSA` to override where it looks. |
| `probe_hw_jtag.tcl` | Confirms the board appears in the JTAG chain at all. |
| `uart_probe_jtag.tcl` | Reads the PS UART registers over JTAG — distinguishes "firmware is dead" from "the serial path is wrong". |
| `enable_dual_uart_console.tcl` | Brings up both AX7015B USB-UART paths. |

Run these with `xsdb`, not `xsct` — Vitis 2026.1 removed `xsct`.
