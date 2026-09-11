# Documentation

## Reference

| | |
| --- | --- |
| [register-map.md](register-map.md) | BAR0 window layout, the address map seen from the PS and from the host, and the full register tables for `fra_core` and `pcie_bar_regs`. The authority when the RTL, `fra_pcie.h` and the firmware's defines disagree. |
| [system_architecture.drawio](system_architecture.drawio) | Block diagram source, editable at [diagrams.net](https://app.diagrams.net/). |

The architecture narrative — clock domains, the two-master topology, why
`pcie_bar_regs` stays in the PCIe clock domain and `fra_core` cannot — is in the
top-level [README](../README.md#architecture).

## Validation

| | |
| --- | --- |
| [validation/pcie-host.md](validation/pcie-host.md) | On-hardware PCIe bring-up: link training, enumeration, BAR0 access from the host, and the host-driven loopback sweep. |
| [validation/loopback-accuracy.md](validation/loopback-accuracy.md) | Accuracy of the gateware loopback measurement path, before and after calibration. Residuals ~0.002 dB and ~0.01°. |

`validation/data/` holds the measured evidence behind both — sweep CSVs, plots
and captured console output. It is raw record, not narrative; the two documents
above cite what matters from it.

## Board and component reference

`board_files/` is redistributed manufacturer material, not part of this project:

| | |
| --- | --- |
| `AX7015B_User_Manual.pdf`, `AX7015B.pdf`, `AC7015B.pdf` | Alinx AX7015B carrier board. |
| `ax7015b_constraints.xdc` | Vendor pin constraints for the board, as a cross-check against `constrs_1/new/`. |
| `AN108/Schematic.pdf`, `AN108/Documentation.pdf` | AN108 AD/DA module — the analog front end. |
| `AN108/an108-connection-diagram.jpg` | How the module wires to the board. |
| `AN108/components/` | Datasheets for the parts that set the analog limits: AD9280 (8-bit ADC), AD9708 (8-bit DAC), AD8065/8066 and TL072 (op-amps). |
| `lm75adp.pdf` | On-board temperature sensor. |

## Where else to look

- [CONTRIBUTING.md](../CONTRIBUTING.md) — how to build and test, and what counts
  as source in a repository that two Xilinx tools generate into.
- [CHANGELOG.md](../CHANGELOG.md) — what changed between gateware revisions.
- [software/host/README.md](../software/host/README.md) — host tool usage, and
  the VFIO/kernel-lockdown situation in detail.
