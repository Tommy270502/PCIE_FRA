# Host-side PCIe FRA tools

Userspace tools that drive the AX7015B FRA over the PCIe endpoint, with no
board-side UART involvement. Plain C99 and libm, no external dependencies.

```bash
make                    # builds fra_bar_test and fra_cli
sudo ./scripts/fra-pcie-setup.sh    # one-time, see "Access" below
./fra_bar_test          # BAR0 bring-up smoke test
./fra_cli id
./fra_cli selftest      # end-to-end check using the gateware loopback
```

## What the endpoint looks like from the host

The device enumerates as `10ee:7021`, class "Memory controller", with a single
8 KB BAR0 that decodes two AXI4-Lite slaves:

| BAR0 offset | Block | Clock domain | Notes |
| --- | --- | --- | --- |
| `0x0000`–`0x0FFF` | `pcie_bar_regs` | PCIe `axi_aclk_out` | Identity, version, scratch. Answers even if the PS is held in reset. |
| `0x1000`–`0x1FFF` | `fra_core` | PS `FCLK_CLK0` | The measurement core, shared with the PS. |

`fra_core` is reachable from the host *and* from the PS firmware at the same
time — both masters arbitrate onto it through `axi_smc`. Nothing stops the two
from fighting over the core, so drive it from one side at a time.

Because `fra_core` runs on the PS fabric clock, host access to the `0x1000`
window depends on the PS being up. The board boots FSBL and the FRA app from
QSPI, so this is satisfied well before the host finishes enumerating.

## Access: why VFIO

`mmap()` of `/sys/bus/pci/devices/*/resource0` is the obvious way to reach a
BAR, and it is what `fra_cli` falls back to. It does not work on a machine with
**Secure Boot enabled**: Secure Boot puts the kernel into lockdown `integrity`
mode, and `LOCKDOWN_PCI_ACCESS` makes that `mmap()` return `EPERM` for every
process, root included. Check with:

```bash
cat /sys/kernel/security/lockdown
```

If the active mode (in brackets) is anything other than `none`, the sysfs route
is closed. VFIO is the supported alternative — it is IOMMU-protected and is what
DPDK and QEMU use — so `fra-pcie-setup.sh` binds the endpoint to `vfio-pci` and
grants the `plugdev` group access to the VFIO nodes. `fra_cli id` reports which
route it took:

```
access via   : vfio-pci
```

The setup script needs the IOMMU enabled (it is, on this host: AMD-Vi). It is
idempotent, and `--unbind` releases the device again.

### How the binding survives a reboot

`driver_override` is runtime-only state, and binding a driver from inside a udev
`RUN` rule is unreliable — udev holds a lock on the device while `RUN` executes,
and the bind generates further uevents. So persistence comes from the module's
own parameter instead:

| File | Purpose |
| --- | --- |
| `/etc/modprobe.d/fra-pcie.conf` | `options vfio-pci ids=10ee:7021` — claim the endpoint at module load |
| `/etc/modules-load.d/fra-pcie.conf` | load `vfio-pci` at boot, after PCI enumeration |
| `/etc/udev/rules.d/99-fra-pcie.rules` | group permissions on the VFIO nodes; no binding |

`vfio-pci` only claims devices with no driver already bound, which is the case
here — nothing else wants a Xilinx "memory controller".

## Commands

```
fra_cli id                    identity, versions and PCIe link state
fra_cli status                fra_core register dump
fra_cli single <hz>           one measurement, CSV row on stdout
fra_cli sweep [--csv FILE]    full sweep, CSV
fra_cli cal                   store a baseline sweep for normalisation
fra_cli selftest              loopback self-test of the whole path
fra_cli bar                   raw BAR0 hexdump of both windows
```

Options: `--start HZ --stop HZ --points N --amp N --settle N --measure N
--loopback --cal-file PATH --csv PATH --bdf BDF`.

Sweep output matches the firmware's CSV columns exactly, so host and board
sweeps are directly comparable:

```
idx,freq_hz,mag_counts,phase_deg,norm_db,norm_phase_deg,i_acc,q_acc,samples,adc_min,adc_max,status
```

Unlike the firmware, which keeps its calibration in RAM, `fra_cli` persists the
baseline to `fra_cal.csv` so a `cal` in one invocation normalises a `sweep` in
the next.

## Loopback and the missing AD/DA module

`--loopback` sets `CONTROL.LOOPBACK_EN` in `fra_core`, which substitutes the DAC
word for the ADC pins inside the gateware. That exercises DDS, sample capture,
I/Q accumulation, the AXI register file and the whole PCIe path without an AN108
module fitted. `selftest` uses it.

The loopback signal lags the reference by exactly one sample tick, so expected
phase is `-360 * f / 25e6` degrees — about `-0.29°` at 20 kHz. Expected
magnitude is `127 * amp/255` counts, i.e. ~63.7 counts at the default amplitude
of 128.

Loopback measures the gateware only. It says nothing about the analog front end;
that still needs the module fitted and a real `cal` against a wire loopback.

## Finding the board's serial console

`ttyUSB` numbers are assignment order, not identity: plugging in another
development board renumbers everything, and the Digilent JTAG cable shows up as
a `ttyUSB` too. Resolve the console by USB VID:PID instead:

```bash
scripts/find_fra_uart.sh          # prints e.g. /dev/ttyUSB3
FRA_UART=/dev/ttyUSB3 ...         # explicit override always wins
```

| Device | VID:PID | Role |
| --- | --- | --- |
| Silicon Labs CP2102N | `10c4:ea60` | AX7015B console, 115200 8N1 |
| Digilent FT232H | `0403:6014` | JTAG cable — *not* the console |

## After reprogramming the FPGA

Reconfiguring the FPGA drops the PCIe link, and the host's view of the device
goes stale. Re-enumerate with:

```bash
sudo ./scripts/fra-pcie-rescan.sh
```

If the root port does not retrain, reboot — the board configures from QSPI
before the host POSTs, which is the normal path.
