#!/bin/sh
# Run a self-checking RTL testbench and report pass/fail.
#
#   scripts/run_sim.sh fra_core
#   scripts/run_sim.sh pcie_bar_regs
#   scripts/run_sim.sh all
#
# This drives xsim directly rather than through the Vivado project. The project
# flow (hardware/fra_zynq7015_pcie/scripts/run_*_sim.tcl) does the same thing,
# but has to open the .xpr and launch a full simulation set, which takes minutes;
# this takes seconds and needs nothing but the sources. It is the loop to use
# while working on the RTL.
#
# Both testbenches are self-checking. Failed assertions are "severity failure",
# so a clean run is the absence of failures plus the testbench's own completion
# message -- checked below, because xsim's exit status alone does not distinguish
# an assertion failure from a clean finish.
set -eu

VIVADO_BIN=${VIVADO_BIN:-$HOME/Xilinx/2026.1/Vivado/bin}
REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
SRC=$REPO/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.srcs

for t in xvhdl xelab xsim; do
    [ -x "$VIVADO_BIN/$t" ] || {
        echo "error: $t not found in $VIVADO_BIN (set VIVADO_BIN=<path>)" >&2
        exit 1
    }
done
PATH=$VIVADO_BIN:$PATH
export PATH

# Which sources each testbench needs, and the line that proves it got to the end.
tb_sources() {
    case $1 in
        fra_core)
            echo "$SRC/sources_1/new/sineLUT.vhd $SRC/sources_1/new/fra_core.vhd $SRC/sim_1/new/tb_fra_core.vhd" ;;
        pcie_bar_regs)
            echo "$SRC/sources_1/new/pcie_bar_regs.vhd $SRC/sim_1/new/tb_pcie_bar_regs.vhd" ;;
        *) return 1 ;;
    esac
}

# tb_pcie_bar_regs reports mismatches with to_hstring, which is VHDL-2008 only.
# The Vivado project flow sets file_type {VHDL 2008} on it for the same reason;
# without this xvhdl resolves to_hstring to the std.textio bit_vector overload
# and the testbench fails to analyse.
tb_vhdl_std() {
    case $1 in
        pcie_bar_regs) echo "-2008" ;;
        *)             echo "" ;;
    esac
}

tb_success_marker() {
    case $1 in
        fra_core)      echo "tb_fra_core completed" ;;
        pcie_bar_regs) echo "TB_PCIE_BAR_REGS_RESULT = PASS" ;;
    esac
}

# 20 ms of simulated time covers the slowest stimulus in tb_fra_core; the
# bar_regs testbench finishes in microseconds and stops itself.
tb_runtime() {
    case $1 in
        fra_core)      echo "20 ms" ;;
        pcie_bar_regs) echo "20 us" ;;
    esac
}

run_one() {
    tb=$1
    sources=$(tb_sources "$tb") || {
        echo "error: unknown testbench '$tb' (want: fra_core, pcie_bar_regs, all)" >&2
        exit 2
    }

    work=$(mktemp -d "${TMPDIR:-/tmp}/fra_sim_${tb}_XXXXXX")
    # xsim scatters xsim.dir/, .log, .jou and .pb files into the working
    # directory, so give it one of its own and take it away afterwards.
    trap 'rm -rf "$work"' EXIT

    std=$(tb_vhdl_std "$tb")

    echo "== $tb =="
    log=$work/sim.log
    (
        cd "$work"
        # shellcheck disable=SC2086  # both are deliberately split argument lists
        xvhdl $std $sources
        xelab -debug off "tb_$tb" -s tb_run
        printf 'run %s; quit\n' "$(tb_runtime "$tb")" > run.tcl
        xsim tb_run -t run.tcl
    ) > "$log" 2>&1 || {
        echo "  FAIL  simulator exited non-zero"
        sed 's/^/        /' "$log" | tail -30
        rm -rf "$work"; trap - EXIT
        return 1
    }

    marker=$(tb_success_marker "$tb")
    if grep -q 'Failure:' "$log"; then
        echo "  FAIL  assertion failure"
        grep -B2 'Failure:' "$log" | sed 's/^/        /'
        rm -rf "$work"; trap - EXIT
        return 1
    fi
    if ! grep -qF "$marker" "$log"; then
        echo "  FAIL  testbench did not reach the end (no '$marker')"
        tail -30 "$log" | sed 's/^/        /'
        rm -rf "$work"; trap - EXIT
        return 1
    fi

    echo "  PASS  $marker"
    rm -rf "$work"; trap - EXIT
    return 0
}

status=0
case ${1:-all} in
    all) run_one fra_core || status=1
         run_one pcie_bar_regs || status=1 ;;
    *)   run_one "$1" || status=1 ;;
esac

exit $status
