#!/bin/sh
# Static checks that need no board and no Xilinx tools.
#
#   scripts/lint.sh
#
# Two things: shellcheck over every shell script, and a warnings-as-errors
# rebuild of the host tools. The host Makefile already builds with
# -Wall -Wextra -Wpedantic; this promotes those to errors so a warning fails a
# run instead of scrolling past.
set -eu

REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
cd "$REPO"

status=0
note() { printf '%s\n' "$1"; }

note "== shellcheck =="
if command -v shellcheck >/dev/null 2>&1; then
    # Scripts under software/host/scripts are installed and run as root, so they
    # are checked alongside the developer-facing ones.
    if shellcheck scripts/*.sh software/host/scripts/*.sh; then
        note "  PASS  no findings"
    else
        note "  FAIL  see findings above"
        status=1
    fi
else
    note "  SKIP  shellcheck not installed"
fi

note "== host tools (warnings as errors) =="
if make -C software/host clean >/dev/null 2>&1 &&
   make -C software/host CFLAGS='-O2 -std=c99 -Wall -Wextra -Wpedantic -Werror' >/dev/null; then
    note "  PASS  clean build"
else
    note "  FAIL  see output above"
    status=1
fi

exit $status
