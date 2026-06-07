# PCIe BAR0 Register Map & Bring-Up Risk Register

AX7015B / `xc7z015clg485-2`, PCIe x1 Gen1 endpoint. Companion to `PCIE_BRINGUP_PROMPT.md`.

## Device facts established (U1–U4)

Confirmed from the Vivado 2025.1 device database (`link_design -part xc7z015clg485-2`):

| # | Question | Answer (with evidence) |
|---|----------|------------------------|
| U1 | Hard PCIe block? | **Yes.** `get_sites` returns `SITE_TYPE=PCIE_2_1, count=1` at `PCIE_X0Y0`. → **Path A.** |
| U2 | Usable PCIe IP? | `axi_pcie:2.9`, `pcie_7x:3.3`, `xdma:4.2` all `create_ip` cleanly for the part. Using **`axi_pcie`** (BAR→AXI bridge) for Stages 1–4. |
| U3 | PERST pin? | `B34_L4_N` = `IO_L4N_T0_34` = **`M6`**. IOSTANDARD **`LVCMOS33`** (see Risk R2). |
| U4 | GT lane map? | Quad **112** (not 115). Lane 0 (W4/Y4/W8/Y8)→`GTPE2_CHANNEL_X0Y1`; Lane 1 (AA3/AB3/AA7/AB7)→`GTPE2_CHANNEL_X0Y0`; refclk U9/V9→`GTPE2_COMMON_X0Y0`. |

PCIe config: Vendor `0x10EE`, Device `0x7021`, BAR0 = **8 KB** Memory (IP minimum; brief asked 4 KB but `axi_pcie` floors at 8 KB), `PCIEBAR2AXIBAR_0 = 0x0` (BAR0 offset 0 → AXI address 0).

## BAR0 register map (`pcie_bar_regs`, AXI4-Lite behind BAR0)

| Offset | Register | Access | Reset value | Description |
|-------:|----------|:------:|------------:|-------------|
| `0x00` | `BOARD_ID` | RO | `0xA7015B00` | Board magic ("AX7015B"); host identity check |
| `0x04` | `VERSION`  | RO | `0x00010000` | Gateware version 1.0.0 |
| `0x08` | `SCRATCH`  | RW | `0x00000000` | Host write/read-back smoke test |
| `0x0C` | `CONTROL`  | RW | `0x00000000` | bit0 = host→PS attention (informational only in Stage 2) |
| `0x10` | `SCRATCH2` | RW | `0x00000000` | Spare RW |
| `0x14` | `RESERVED` | RO | `0x00000000` | Reads 0 |
| `0x18` | `RESERVED` | RO | `0x00000000` | Reads 0 |
| `0x1C` | `RESERVED` | RO | `0x00000000` | Reads 0 |

Writes honour `WSTRB` per byte lane. Writes to RO/reserved offsets complete with `OKAY` and are ignored.
Host test: `software/pcie_host_test/pcie_bar_test.c`.

## Risk Register

| Risk | Symptom of failure | Recovery |
|------|--------------------|----------|
| **R1 — GT lane/channel mapping** | At x2, link trains with lanes swapped or won't reach L0 (lspci shows degraded/`LnkSta` width x1). | Stage 1 uses **x1 on lane 0** only; pinning the serial pair to W4/W8 forces `GTPE2_CHANNEL_X0Y1`, so reversal can't occur. When moving to x2, enable PCIe **lane reversal** in the IP (lane0=X0Y1 is the higher channel) or set explicit GT `LOC`s. |
| **R2 — PERST / bank-34 VCCO** | DRC bank-VCCO conflict at Stage 0 if PERST set to LVCMOS25 (brief's value), because bank-34 DAC pins are LVCMOS33. | Constrain PERST `M6` as **LVCMOS33** (done in `pcie_pins.xdc`). Matches bank-34 VCCO *and* PCIe CEM 3.3 V PERST# signaling. If the board truly runs bank 34 at 2.5 V, the existing DAC constraints would already fail DRC — they don't, so 3.3 V is correct. |
| **R3 — Refclk AC-coupling / quality** | Link never trains; `user_link_up` stays low; `LnkSta` never set. | TX & refclk are AC-coupled on the expansion board (confirmed). Verify 100 MHz present at U9/V9 on a scope; confirm `SLOT_CLOCK_CONFIG` matches (common refclk). Try `reduce_oob_freq` only if the OOB detect is marginal. |
| **R4 — Vivado IP availability/license** | `create_ip`/synth errors that the block is not licensed or not for this part. | Already disproved: all three IPs instantiate for `xc7z015`. `axi_pcie` is license-free. If synth flags a feature license, fall back to a smaller config. |
| **R5 — Host enumeration** | `lspci -d 10ee:7021` shows nothing, or device with all-FF config space. | PERST polarity (active-low) and refclk must be right first. Confirm BAR0 size/type in config space; check `dmesg` for "BAR ... failed to assign". Reseat / boot host with card already configured (7-series PCIe needs link up before host enumeration window closes — program bitstream before host POST, or use a host that re-scans). |
| **R6 — PERST polarity** | Endpoint held in reset (no link) or never resets. | Defaulted to **active-low** per PCIe spec; `PULLUP` keeps it defined. If the schematic shows an inverter, drop the inversion in the BD reset path. |
| **R7 — BD integration vs fra_core** | fra_core address/clock changes; FRA build regresses. | PCIe added by `scripts/add_pcie_endpoint.tcl` as a separate clock domain (axi_pcie `axi_aclk_out`); fra_core's PS `M_AXI_GP0`→SmartConnect→`0x43C0_0000` path is untouched. Re-run `run_fra_build_validation.tcl` signoff after integration. |

## What is verified vs not (as of this checkpoint)

- **Verified:** U1–U4 device facts (Vivado output); `axi_pcie` config keys & ports; `pcie_bar_regs.vhd` compiles clean (`xvhdl`).
- **Not yet verified:** full BD wiring through `validate_bd_design`; synthesis + `report_drc`; timing; and (blocked) on-hardware enumeration — board JTAG/UART not connected.
