#!/bin/sh
# Run a self-checking RTL testbench and report pass/fail.
#
#   scripts/run_sim.sh [fra_core | pcie_bar_regs | all]
#   FRA_SIM=ghdl scripts/run_sim.sh all      # force a backend
#
# Two backends, same testbenches and same pass criteria:
#
#   xsim  the simulator shipped with Vivado. Used when it is installed, because
#         it is the one that also runs in the project flow, so a pass here means
#         the same thing a pass there does.
#   ghdl  open source, no Xilinx install needed. The RTL and both testbenches
#         are plain IEEE VHDL with no UNISIM primitives, so they run unmodified.
#         This is what CI uses.
#
# This drives the simulator directly rather than through the Vivado project. The
# project flow (hardware/fra_zynq7015_pcie/scripts/run_*_sim.tcl) does the same
# thing, but has to open the .xpr and launch a full simulation set, which takes
# minutes; this takes seconds. It is the loop to use while working on the RTL.
#
# Both testbenches are self-checking, and a failed assertion is severity failure.
# A pass is therefore the absence of a failure *and* the testbench's own
# completion message -- both are required, because neither simulator's exit
# status reliably distinguishes an assertion failure from a clean finish.
set -eu

VIVADO_BIN=${VIVADO_BIN:-$HOME/Xilinx/2026.1/Vivado/bin}
REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
SRC=$REPO/hardware/fra_zynq7015_pcie/fra_zynq7015_pcie.srcs

# --- backend selection ----------------------------------------------------

BACKEND=${FRA_SIM:-}
if [ -z "$BACKEND" ]; then
    if [ -x "$VIVADO_BIN/xsim" ]; then
        BACKEND=xsim
    elif command -v ghdl >/dev/null 2>&1; then
        BACKEND=ghdl
    else
        echo "error: no simulator found." >&2
        echo "       install ghdl, or set VIVADO_BIN to a Vivado bin directory" >&2
        echo "       (looked for xsim in $VIVADO_BIN)" >&2
        exit 1
    fi
fi

case $BACKEND in
    xsim)
        for t in xvhdl xelab xsim; do
            [ -x "$VIVADO_BIN/$t" ] || {
                echo "error: $t not found in $VIVADO_BIN (set VIVADO_BIN=<path>)" >&2
                exit 1
            }
        done
        PATH=$VIVADO_BIN:$PATH
        export PATH
        ;;
    ghdl)
        command -v ghdl >/dev/null 2>&1 || {
            echo "error: ghdl not found on PATH" >&2
            exit 1
        }
        ;;
    *)
        echo "error: unknown backend '$BACKEND' (want: xsim, ghdl)" >&2
        exit 2
        ;;
esac

# --- per-testbench facts --------------------------------------------------

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
# without this the analyser resolves to_hstring to the std.textio bit_vector
# overload and the testbench does not compile.
tb_needs_2008() {
    case $1 in
        pcie_bar_regs) return 0 ;;
        *)             return 1 ;;
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
tb_runtime_xsim() {
    case $1 in
        fra_core)      echo "20 ms" ;;
        pcie_bar_regs) echo "20 us" ;;
    esac
}
tb_runtime_ghdl() {
    case $1 in
        fra_core)      echo "20ms" ;;
        pcie_bar_regs) echo "20us" ;;
    esac
}

# --- backends -------------------------------------------------------------

simulate_xsim() {
    tb=$1; sources=$2; std=
    tb_needs_2008 "$tb" && std=-2008
    # shellcheck disable=SC2086  # both are deliberately split argument lists
    xvhdl $std $sources
    xelab -debug off "tb_$tb" -s tb_run
    printf 'run %s; quit\n' "$(tb_runtime_xsim "$tb")" > run.tcl
    xsim tb_run -t run.tcl
}

simulate_ghdl() {
    tb=$1; sources=$2; std=--std=93
    tb_needs_2008 "$tb" && std=--std=08
    # shellcheck disable=SC2086
    ghdl -a $std --workdir=. $sources
    # shellcheck disable=SC2086
    ghdl -e $std --workdir=. "tb_$tb"
    # An assertion at severity failure stops the run and exits non-zero, which
    # the caller already treats as a failure; --assert-level keeps notes and
    # warnings from doing the same.
    # shellcheck disable=SC2086
    ghdl -r $std --workdir=. "tb_$tb" \
         --stop-time="$(tb_runtime_ghdl "$tb")" --assert-level=failure
}

run_backend() {
    case $BACKEND in
        xsim) simulate_xsim "$1" "$2" ;;
        ghdl) simulate_ghdl "$1" "$2" ;;
    esac
}

# --- driver ---------------------------------------------------------------

run_one() {
    tb=$1
    sources=$(tb_sources "$tb") || {
        echo "error: unknown testbench '$tb' (want: fra_core, pcie_bar_regs, all)" >&2
        exit 2
    }

    # Both simulators scatter working files (xsim.dir/, *.cf, *.o, logs) into the
    # current directory, so give them one of their own and take it away after.
    work=$(mktemp -d "${TMPDIR:-/tmp}/fra_sim_${tb}_XXXXXX")
    log=$work/sim.log
    rc=0

    echo "== $tb ($BACKEND) =="
    ( cd "$work" && run_backend "$tb" "$sources" ) > "$log" 2>&1 || rc=$?

    if [ "$rc" -ne 0 ]; then
        echo "  FAIL  simulator exited $rc"
        tail -30 "$log" | sed 's/^/        /'
    elif grep -qE '^(.*:)?[0-9]+ ?[munpf]?s.*:\(assertion failure\)|Failure:' "$log"; then
        echo "  FAIL  assertion failure"
        grep -B2 -E ':\(assertion failure\)|Failure:' "$log" | sed 's/^/        /'
        rc=1
    elif ! grep -qF "$(tb_success_marker "$tb")" "$log"; then
        echo "  FAIL  testbench did not reach the end (no '$(tb_success_marker "$tb")')"
        tail -30 "$log" | sed 's/^/        /'
        rc=1
    else
        echo "  PASS  $(tb_success_marker "$tb")"
    fi

    rm -rf "$work"
    return "$rc"
}

status=0
case ${1:-all} in
    all) run_one fra_core      || status=1
         run_one pcie_bar_regs || status=1 ;;
    *)   run_one "$1"          || status=1 ;;
esac

exit $status
