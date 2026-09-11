# Changelog

Notable changes to the gateware, firmware and host tooling. Format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

Gateware version is reported by the `VERSION` registers and is tracked
separately from this file: `fra_core` and `pcie_bar_regs` both read `0x00010100`
(1.1.0) at the time of writing.

## [Unreleased]

### Added

- Top-level `Makefile` as the single entry point for every build, test and
  deploy step (`make help` lists them).
- `scripts/build_bsp.sh` builds the standalone BSP archives from the vendored
  sources. Previously these were untracked and unbuildable, so a fresh clone
  could not link the firmware at all.
- `scripts/run_sim.sh` runs the self-checking testbenches directly against the
  sources in seconds, rather than minutes through the Vivado project. Backends
  for both xsim and GHDL.
- `scripts/lint.sh`: shellcheck over all shell tooling, plus a
  warnings-as-errors rebuild of the host tools.
- GitHub Actions CI covering lint, both RTL testbenches under GHDL, and a check
  that no tracked file carries an absolute developer path.
- `CONTRIBUTING.md`, `.editorconfig`, `.gitattributes`.

### Fixed

- `tb_pcie_bar_regs` expected BAR `VERSION` `0x00010000`, the value from before
  `fra_core` was mapped into the second BAR0 window. The RTL, the register map
  and `fra_bar_test` all say `0x00010100`; the testbench was stale and had been
  failing unnoticed.
- `tb_pcie_bar_regs` could not be analysed outside the Vivado project: it uses
  `to_hstring`, which needs VHDL-2008.
- `scripts/build_bsp.sh` works around two traps in the BSP's own CMake project
  that each produce a silent wrong result — it resolves its sources through
  `lib/` and so builds nothing when that directory is absent, and it reads
  `proc_extra_compiler_flags` before setting it, so a single configure pass
  builds the whole BSP at `-O0` with no warning.
- `verify_system.sh` could report both PASS and FAIL for the driver-binding
  check, and pointed at the wrong path for `fra-pcie-setup.sh`.

### Changed

- The firmware ELF is now built against a BSP compiled at `-O2 -g` as the
  toolchain file specifies. The archives previously in the tree were partly
  built at `-O0`, so the resulting image differs slightly from the one flashed
  before this change. Re-run `scripts/verify_system.sh` after reflashing.

### Removed

- 481 tracked files that no build reads: a Vitis CMake/Ninja tree whose every
  path pointed at a machine that no longer exists, compile databases, `.clangd`
  files, IDE state, device-tree preprocessor output.
- 47 MB of vendor archives. `AN108.zip` duplicated the extracted folder beside
  it, and the nested `ADDA_*.zip` are 2015 Quartus demos for other Alinx boards.
  The datasheets and schematics for this board's analog front end are kept.
- `software/adc_controller`, the GPIO-based prototype superseded by the AXI
  `fra_core` design and referenced by nothing.
- `rebuild_functional_fra_bd.tcl` and `run_fra_build_validation.tcl`, the
  pre-PCIe build flow. Leaving the first beside `add_pcie_endpoint.tcl` was a
  live hazard: running it tears the block design back down to a PCIe-free
  design.
- Windows-only `.ps1` helpers and six one-off PCIe bring-up probe scripts whose
  questions are answered and encoded in `add_pcie_endpoint.tcl`.

All removals remain in git history.

## [1.1.0] — 2026-09-11

`fra_core` reachable over PCIe; system validated end to end on hardware.

### Added

- PCIe x1 Gen1 endpoint. Enumerates as `10ee:7021` with an 8 KB BAR0 split into
  `pcie_bar_regs` at `+0x0000` and `fra_core` at `+0x1000`, so a host can run a
  complete sweep without touching the UART.
- `CONTROL.LOOPBACK_EN`: gateware DAC→ADC loopback, which makes the whole
  digital chain self-testable with no AN108 AD/DA module fitted.
- Linux host tools: `fra_cli` (sweeps, calibration, self-test over PCIe) and
  `fra_bar_test`.
- VFIO setup and rescan scripts. Under Secure Boot the kernel runs in lockdown
  `integrity` mode, where `mmap()` of a BAR through sysfs fails for every
  process including root; VFIO is the supported route.
- `scripts/verify_system.sh`, an end-to-end pass/fail check of the whole chain.
- `scripts/find_fra_uart.sh`, resolving the console by USB VID:PID — `ttyUSB`
  numbering is assignment order, not identity.

### Changed

- Boot is from QSPI, and that ordering is load-bearing: the FPGA must be
  configured and the endpoint linked before the host POSTs, or it is never
  enumerated.
- Firmware and boot-image builds are plain shell and Make. Vitis 2026.1 removed
  `xsct`, so the old IDE flow no longer works.

## [1.0.0] — 2026-06-07

First working analyzer.

### Added

- `fra_core`: AXI4-Lite measurement core with DDS stimulus, 8-bit ADC capture
  and synchronous I/Q lock-in accumulation.
- Bare-metal UART CLI and sweep controller on the PS.
- Self-checking RTL testbench, timing constraints and a signoff build flow.
