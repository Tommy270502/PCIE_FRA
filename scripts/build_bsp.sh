#!/bin/sh
# Build the standalone BSP libraries the firmware links against.
#
#   scripts/build_bsp.sh [--clean]
#
# Produces libxil.a, libxilstandalone.a and libxiltimer.a in the BSP's lib/
# directory, which is what software/FRA_Controller/Makefile links with.
#
# Why this exists: the BSP *sources* are checked in, but the libraries built
# from them are generated output and are not. Without this step a fresh clone
# has BSP headers and no archives, so the firmware compiles and then fails at
# link. The Vitis IDE used to run this; Vitis 2026.1 removed xsct, so the BSP's
# own CMake project is driven directly here.
#
# The BSP is a stock AMD embeddedsw CMake project. The three arguments that are
# not obvious:
#   SUBDIR_LIST=ALL              its CMakeLists adds no library subdirectory
#                                unless this is set, so an unset build silently
#                                produces nothing.
#   CMAKE_SPECS_FILE             cortexa9_toolchain.cmake defaults this to
#                                $ESW_REPO/scripts/specs/arm/Xilinx.spec, which
#                                only resolves inside a Vitis IDE session. The
#                                BSP ships its own copy.
#   CMAKE_POLICY_VERSION_MINIMUM the 2025-era CMakeLists declare compatibility
#                                with CMake < 3.5, which CMake 4 refuses.
set -eu

VITIS=${VITIS:-$HOME/Xilinx/2026.1/Vitis}
TOOLCHAIN_BIN=$VITIS/gnu/aarch32/lin/gcc-arm-none-eabi/bin

REPO=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
BSP=${BSP:-$REPO/software/PCIE_FRA/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp}
BUILD=$BSP/build

CLEAN=0
while [ $# -gt 0 ]; do
    case $1 in
        --clean) CLEAN=1; shift ;;
        *) echo "unknown argument: $1" >&2; exit 2 ;;
    esac
done

[ -f "$BSP/CMakeLists.txt" ] || {
    echo "error: no BSP CMake project at $BSP" >&2
    exit 1
}
[ -x "$TOOLCHAIN_BIN/arm-none-eabi-gcc" ] || {
    echo "error: arm-none-eabi-gcc not found under $TOOLCHAIN_BIN" >&2
    echo "       pass VITIS=<path to Vitis install>" >&2
    exit 1
}
for t in cmake ninja; do
    command -v "$t" >/dev/null 2>&1 || {
        echo "error: $t not found on PATH" >&2
        exit 1
    }
done

[ "$CLEAN" -eq 0 ] || rm -rf "$BUILD"

# The BSP's CMakeLists locates its own sources as "${CMAKE_LIBRARY_PATH}/../libsrc"
# and guards that with if(EXISTS). On a fresh clone lib/ does not exist yet, the
# guard resolves false, no library subdirectory is added, and the build "succeeds"
# with ninja reporting no work to do and no archives written. Create it first.
mkdir -p "$BSP/lib"

PATH=$TOOLCHAIN_BIN:$PATH
export PATH

# Run cmake from inside the build tree. The BSP's CFLAGS carry -MMD, so cmake's
# compiler probe -- which compiles from stdin -- drops a stray "-.d" dependency
# file into the working directory. In the build tree that is just more build
# output; in the repository root it is litter.
mkdir -p "$BUILD"
cd "$BUILD"

cmake -G Ninja -S "$BSP" -B "$BUILD" \
      -DCMAKE_TOOLCHAIN_FILE="$BSP/cortexa9_toolchain.cmake" \
      -DCMAKE_MODULE_PATH="$BSP" \
      -DCMAKE_INCLUDE_PATH="$BSP/include" \
      -DCMAKE_LIBRARY_PATH="$BSP/lib" \
      -DCMAKE_SPECS_FILE="$BSP/Xilinx.spec" \
      -DSUBDIR_LIST=ALL \
      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
      -Wno-dev

# Second configure pass, and it is not optional. bsp/CMakeLists.txt applies the
# optimisation and warning flags with
#     ADD_DEFINITIONS(-c ${proc_extra_compiler_flags})
# near the top of the file, but proc_extra_compiler_flags is only *set* down in
# libsrc/standalone/src/xilstandalone.cmake, which is not read until the
# add_subdirectory() calls further down. On the first configure the variable is
# therefore still empty and the BSP is built at -O0 with no debug info -- with
# no warning, because an empty expansion is legal. The value lands in the cache
# during that pass, so configuring again picks it up. This is what the Vitis IDE
# was doing implicitly; the check below makes sure it actually took.
cmake -S "$BSP" -B "$BUILD" -Wno-dev >/dev/null

if ! grep -q '\-O2' "$BUILD/compile_commands.json"; then
    echo "error: BSP would build unoptimised -- proc_extra_compiler_flags did not" >&2
    echo "       reach the compiler. Check TOOLCHAIN_EXTRA_C_FLAGS in" >&2
    echo "       $BSP/cortexa9_toolchain.cmake" >&2
    exit 1
fi

ninja -C "$BUILD"

# Only libxil.a is copied into lib/ as part of the build; the per-library
# archives get there via the install rules, which use absolute DESTINATIONs
# inside the BSP and so ignore CMAKE_INSTALL_PREFIX.
ninja -C "$BUILD" install >/dev/null

echo
echo "BSP libraries in $BSP/lib:"
for lib in "$BSP"/lib/*.a; do
    [ -f "$lib" ] || { echo "  error: no archives were produced" >&2; exit 1; }
    printf '  %-24s %s bytes\n' "$(basename "$lib")" "$(stat -c %s "$lib")"
done
