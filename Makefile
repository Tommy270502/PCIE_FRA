# PCIE_FRA -- top-level entry point.
#
# Every target here is a thin wrapper over the component Makefile or script that
# actually does the work, so that "what can I build" has one answer. Run `make`
# with no target for the list.
#
# Toolchain locations are overridable and default to a 2026.1 install in $HOME:
#   make VITIS=/opt/Xilinx/2026.1/Vitis VIVADO=/opt/Xilinx/2026.1/Vivado/bin/vivado

VITIS  ?= $(HOME)/Xilinx/2026.1/Vitis
VIVADO ?= $(HOME)/Xilinx/2026.1/Vivado/bin/vivado
export VITIS
export VIVADO

HW_SCRIPTS := hardware/fra_zynq7015_pcie/scripts
FIRMWARE   := software/FRA_Controller
HOST       := software/host

.DEFAULT_GOAL := help

# --- build ----------------------------------------------------------------

.PHONY: all
all: host bsp firmware ## Build everything that does not need Vivado or a board

.PHONY: host
host: ## Build the Linux host tools (fra_cli, fra_bar_test)
	$(MAKE) -C $(HOST)

.PHONY: bsp
bsp: ## Build the standalone BSP archives the firmware links against
	scripts/build_bsp.sh

.PHONY: firmware
firmware: bsp ## Build the bare-metal application (FRA_Controller.elf)
	$(MAKE) -C $(FIRMWARE)

.PHONY: gateware
gateware: ## Rewire the block design, then run the signoff build (slow, needs Vivado)
	$(VIVADO) -mode batch -source $(HW_SCRIPTS)/add_pcie_endpoint.tcl
	$(VIVADO) -mode batch -source $(HW_SCRIPTS)/run_pcie_impl_signoff.tcl

.PHONY: drc
drc: ## Synthesis + DRC only: a fast pre-check before committing to a full build
	$(VIVADO) -mode batch -source $(HW_SCRIPTS)/run_pcie_stage0_drc.tcl

.PHONY: boot
boot: ## Pack FSBL + bitstream + application into software/BOOT.BIN
	scripts/build_boot_image.sh

# --- test -----------------------------------------------------------------

.PHONY: sim
sim: sim-fra-core sim-bar-regs ## Run both RTL testbenches

.PHONY: sim-fra-core
sim-fra-core: ## Run the self-checking fra_core testbench
	scripts/run_sim.sh fra_core

.PHONY: sim-bar-regs
sim-bar-regs: ## Run the self-checking pcie_bar_regs testbench
	scripts/run_sim.sh pcie_bar_regs

.PHONY: verify
verify: ## End-to-end pass/fail check against the board (needs hardware)
	scripts/verify_system.sh

.PHONY: lint
lint: ## Shell and C static checks
	scripts/lint.sh

.PHONY: check
check: lint sim ## Everything that runs without a board attached

# --- deploy ---------------------------------------------------------------
# These two touch the board. flash rewrites QSPI; jtag drops the live PCIe link.

.PHONY: flash
flash: ## Write software/BOOT.BIN to QSPI over JTAG (rewrites boot flash)
	scripts/flash_qspi.sh

.PHONY: jtag
jtag: ## Load bitstream + application over JTAG, volatile (drops the PCIe link)
	scripts/program_fpga_jtag.sh --app

# --- housekeeping ---------------------------------------------------------

.PHONY: clean
clean: ## Remove host, firmware and BSP build output
	$(MAKE) -C $(HOST) clean
	$(MAKE) -C $(FIRMWARE) clean
	rm -rf software/PCIE_FRA/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/build
	rm -rf software/PCIE_FRA/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp/lib
	rm -f software/BOOT.BIN software/boot.bif

.PHONY: distclean
distclean: clean ## Also remove Vivado run directories and exported artifacts
	rm -rf hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.cache
	rm -rf hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.gen
	rm -rf hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.hw
	rm -rf hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.ip_user_files
	rm -rf hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.runs
	rm -rf hardware/fra_zynq7015_pcie/export
	rm -rf .Xil hardware/fra_zynq7015_pcie/.Xil

.PHONY: help
help: ## Show this help
	@echo 'PCIE_FRA -- Frequency Response Analyzer, Alinx AX7015B (Zynq-7015)'
	@echo
	@awk 'BEGIN {FS = ":.*## "} \
	     /^# --- / { sub(/^# --- /, ""); sub(/ *-*$$/, ""); printf "\n\033[1m%s\033[0m\n", $$0 } \
	     /^[a-zA-Z_-]+:.*## / { printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo
	@echo 'Start with:  make check     (no board needed)'
	@echo '             make verify    (board attached and booted)'
