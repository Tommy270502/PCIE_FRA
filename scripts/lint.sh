#!/bin/sh
# Static checks that need no board and no Xilinx tools.
#
#   scripts/lint.sh          both of the below -- this is what `make lint` runs
#   scripts/lint.sh shell    shellcheck over every shell script
#   scripts/lint.sh c        warnings-as-errors rebuild of the host tools
#
# The host Makefile already builds with -Wall -Wextra -Wpedantic; this promotes
# those to errors so a warning fails the run instead of scrolling past.
#
# CI runs the two halves as separate steps so a failure is identifiable from the
# job list alone. Run without arguments locally.
#
# One caveat on shellcheck: the version on a CI runner is usually older than a
# current desktop one, and they do not report the same findings -- 0.9 flags
# SC2015 cases that 0.11 has since refined away, and 0.10 replaced SC2317 with
# SC2329. Prefer restructuring code over adding a disable directive, since a
# directive only silences the version you happened to test against. The version
# in use is printed below.
set -eu

REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
cd "$REPO"

status=0

lint_shell() {
    echo "== shellcheck =="
    if ! command -v shellcheck >/dev/null 2>&1; then
        echo "  SKIP  shellcheck not installed"
        return 0
    fi
    echo "  $(shellcheck --version | sed -n 's/^version: /version /p')"
    # Scripts under software/host/scripts are installed and run as root, so they
    # are checked alongside the developer-facing ones.
    if shellcheck scripts/*.sh software/host/scripts/*.sh; then
        echo "  PASS  no findings"
    else
        echo "  FAIL  see findings above"
        return 1
    fi
}

lint_c() {
    echo "== host tools (warnings as errors) =="
    if make -C software/host clean >/dev/null 2>&1 &&
       make -C software/host CFLAGS='-O2 -std=c99 -Wall -Wextra -Wpedantic -Werror' >/dev/null; then
        echo "  PASS  clean build"
    else
        echo "  FAIL  see output above"
        return 1
    fi
}

case ${1:-all} in
    shell) lint_shell || status=1 ;;
    c)     lint_c     || status=1 ;;
    all)   lint_shell || status=1
           lint_c     || status=1 ;;
    *)     echo "usage: $0 [shell|c|all]" >&2; exit 2 ;;
esac

exit $status
