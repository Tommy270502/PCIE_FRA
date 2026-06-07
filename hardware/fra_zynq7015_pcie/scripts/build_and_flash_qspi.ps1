# Build everything needed for a persistent (QSPI flash) boot of the AX7015B
# and write it to the onboard flash over the existing JTAG link.
#
# Stages (each is rebuilt only when its output is missing or older than its
# inputs -- a clean tree just runs bootgen + program_flash):
#   1. Bitstream    -- run_pcie_impl_signoff.tcl (Vivado batch; can take 30-90 minutes)
#   2. FSBL         -- refreshes ps7_init.{c,h} from the latest hw export, then ninja
#   3. Application  -- ninja rebuild of FRA_Controller from software/FRA_Controller/src
#   4. Boot image   -- bootgen packs [fsbl, bitstream, app] per software/boot.bif
#   5. QSPI flash   -- program_flash writes BOOT.BIN over JTAG (board stays connected)
#
# After FRA_QSPI_RESULT = PASS, flip DIP switch SW1 on the AC7015B SoM to QSPI
# FLASH mode (position 1 = OFF, position 2 = ON -- AX7015B_User_Manual.pdf
# section 2.11) and power-cycle. The board then boots standalone from flash;
# JTAG/UART remain connected for debugging as before.
#
# Usage (from repo root or anywhere):
#   powershell -File hardware/fra_zynq7015_pcie/scripts/build_and_flash_qspi.ps1

$ErrorActionPreference = "Stop"

$repo      = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path
$hwDir     = Join-Path $repo "hardware\fra_zynq7015_pcie"
$vivado    = "C:\Xilinx\2025.1\Vivado\bin\vivado.bat"
$ninja     = "C:\Xilinx\2025.1\Vitis\bin\ninja.exe"
$bootgen   = "C:\Xilinx\2025.1\Vitis\bin\bootgen.bat"
$progFlash = "C:\Xilinx\2025.1\Vitis\bin\program_flash.bat"
$gccBin    = "C:\Xilinx\2025.1\Vitis\gnu\aarch32\nt\gcc-arm-none-eabi\bin"

# ninja's post-link step shells out to arm-none-eabi-size for the .elf.size
# report; it isn't on PATH by default, which makes ninja report a spurious
# build failure even though the .elf itself linked fine.
if ($env:Path -notlike "*$gccBin*") { $env:Path = "$gccBin;$env:Path" }

$bitstream = Join-Path $hwDir "export\system_bd_wrapper_pcie.bit"
$fsblWsDir = Join-Path $repo "software\PCIE_FRA\zynq_fsbl"
$fsblBuild = Join-Path $fsblWsDir "build"
$fsblElf   = Join-Path $fsblBuild "fsbl.elf"
$appBuild  = Join-Path $repo "software\FRA_Controller\build"
$appElf    = Join-Path $appBuild "FRA_Controller.elf"
$bif       = Join-Path $repo "software\boot.bif"
$bootBin   = Join-Path $repo "software\BOOT.BIN"

# IDCODE-qualified JTAG target for the xc7z015 device on the Digilent HS1 cable
# (confirmed present via `program_flash -jtagtargets`; re-probe if the cable changes).
$jtagTarget = "jsn-JTAG-HS1-210512180081-0373b093-0"
$jtagUrl    = "tcp:localhost:3121"

function Latest-MTime($paths) {
    $items = Get-ChildItem -Path $paths -File -ErrorAction SilentlyContinue
    if (-not $items) { return [datetime]::MinValue }
    return ($items | Measure-Object -Property LastWriteTime -Maximum).Maximum
}

function Fail($message) {
    Write-Output "FRA_QSPI_RESULT = FAIL ($message)"
    exit 1
}

# ---------------------------------------------------------------------------
# Stage 1/5 -- Bitstream
# ---------------------------------------------------------------------------
$bitSources = @(
    (Join-Path $hwDir "fra_zynq7015_pcie.srcs\sources_1\new\*.vhd"),
    (Join-Path $hwDir "fra_zynq7015_pcie.srcs\constrs_1\new\*.xdc"),
    (Join-Path $hwDir "fra_zynq7015_pcie.srcs\sources_1\bd\system_bd\system_bd.bd")
)
$bitstreamStale = (-not (Test-Path $bitstream)) -or
    ((Latest-MTime $bitSources) -gt (Get-Item $bitstream).LastWriteTime)

if ($bitstreamStale) {
    Write-Output "=== Stage 1/5: bitstream missing or stale -- running PCIe signoff build (Vivado, can take 30-90 min) ==="
    $passed = $false
    & $vivado -mode batch -source (Join-Path $hwDir "scripts\run_pcie_impl_signoff.tcl") 2>&1 | ForEach-Object {
        Write-Output $_
        if ($_ -match "FRA_PCIE_IMPL_RESULT\s*=\s*PASS") { $script:passed = $true }
    }
    if (-not $passed) { Fail "PCIe signoff build did not report FRA_PCIE_IMPL_RESULT = PASS" }
    if (-not (Test-Path $bitstream)) { Fail "signoff reported PASS but $bitstream is still missing" }
} else {
    Write-Output ("=== Stage 1/5: bitstream up to date ({0:yyyy-MM-dd HH:mm:ss}) ===" -f (Get-Item $bitstream).LastWriteTime)
}

# ---------------------------------------------------------------------------
# Stage 2/5 -- FSBL (refresh PS7 init from the latest hw export, then relink)
# ---------------------------------------------------------------------------
# export/ps7_init.{c,h} is a manually-captured snapshot, NOT auto-refreshed by
# Vivado -- if the BD's PS7 config changes (MIO/peripheral edits) after this
# snapshot was taken, this stage will happily build a FSBL from the stale copy
# and the board will boot with the wrong PS7 config (e.g. a peripheral whose
# clock/MIO routing the application now depends on never gets enabled). Before
# flashing after a PS7 config change, refresh export/ps7_init.{c,h} from
# fra_zynq7015_pcie.gen/.../system_bd_processing_system7_0_0/ps7_init.{c,h}.
# See docs/PCIE_BRINGUP_HANDOVER.md "dual-UART froze on QSPI/standalone boot".
$hwPs7C   = Join-Path $hwDir "export\ps7_init.c"
$hwPs7H   = Join-Path $hwDir "export\ps7_init.h"
$fsblPs7C = Join-Path $fsblWsDir "ps7_init.c"
$fsblPs7H = Join-Path $fsblWsDir "ps7_init.h"

$ps7Stale = (-not (Test-Path $fsblPs7C)) -or (-not (Test-Path $fsblPs7H)) -or
    ((Get-FileHash $hwPs7C).Hash -ne (Get-FileHash $fsblPs7C).Hash) -or
    ((Get-FileHash $hwPs7H).Hash -ne (Get-FileHash $fsblPs7H).Hash)

$fsblSources = Get-ChildItem -Path (Join-Path $fsblWsDir "*.c"), (Join-Path $fsblWsDir "*.h"), (Join-Path $fsblWsDir "*.S") -File
$fsblStale = $ps7Stale -or (-not (Test-Path $fsblElf)) -or
    ((Latest-MTime $fsblSources.FullName) -gt (Get-Item $fsblElf).LastWriteTime)

if ($fsblStale) {
    if ($ps7Stale) {
        Write-Output "=== Stage 2/5: FSBL ps7_init.{c,h} is stale relative to the latest hardware export -- refreshing ==="
        Copy-Item $hwPs7C $fsblPs7C -Force
        Copy-Item $hwPs7H $fsblPs7H -Force
    }
    Write-Output "=== Stage 2/5: building FSBL ==="
    & $ninja -C $fsblBuild
    if ($LASTEXITCODE -ne 0) { Fail "FSBL ninja build exited with code $LASTEXITCODE" }
    if (-not (Test-Path $fsblElf)) { Fail "FSBL build did not produce $fsblElf" }
} else {
    Write-Output ("=== Stage 2/5: FSBL up to date ({0:yyyy-MM-dd HH:mm:ss}) ===" -f (Get-Item $fsblElf).LastWriteTime)
}

# ---------------------------------------------------------------------------
# Stage 3/5 -- Application (FRA_Controller)
# ---------------------------------------------------------------------------
$appSrcDir  = Join-Path $repo "software\FRA_Controller\src"
$appSources = Get-ChildItem -Path (Join-Path $appSrcDir "*.c"), (Join-Path $appSrcDir "*.h") -File
$appStale = (-not (Test-Path $appElf)) -or
    ((Latest-MTime $appSources.FullName) -gt (Get-Item $appElf).LastWriteTime)

if ($appStale) {
    Write-Output "=== Stage 3/5: building FRA_Controller application ==="
    & $ninja -C $appBuild
    if ($LASTEXITCODE -ne 0) { Fail "application ninja build exited with code $LASTEXITCODE" }
    if (-not (Test-Path $appElf)) { Fail "application build did not produce $appElf" }
} else {
    Write-Output ("=== Stage 3/5: application up to date ({0:yyyy-MM-dd HH:mm:ss}) ===" -f (Get-Item $appElf).LastWriteTime)
}

# ---------------------------------------------------------------------------
# Stage 4/5 -- Boot image (bootgen)
# ---------------------------------------------------------------------------
Write-Output "=== Stage 4/5: packing boot image with bootgen ==="
if (Test-Path $bootBin) { Remove-Item $bootBin -Force }
& $bootgen -image $bif -arch zynq -o $bootBin -w
if ($LASTEXITCODE -ne 0) { Fail "bootgen exited with code $LASTEXITCODE" }
if (-not (Test-Path $bootBin)) { Fail "bootgen did not produce $bootBin" }
Write-Output ("  {0}  ({1:N0} bytes)" -f $bootBin, (Get-Item $bootBin).Length)

# ---------------------------------------------------------------------------
# Stage 5/5 -- Program the onboard QSPI flash over JTAG
# ---------------------------------------------------------------------------
# program_flash's hw_server auto-launch only fires reliably for standalone
# `-jtagtargets` probes -- when given full programming arguments it has been
# observed to print "Failed to connect to hw_server" and exit 0 without doing
# anything. Make sure one is actually listening on the target port first.
$hwServer    = "C:\Xilinx\2025.1\Vitis\bin\hw_server.bat"
$jtagPort    = [int]($jtagUrl -split ':')[-1]
$hwListening = Test-NetConnection -ComputerName "localhost" -Port $jtagPort -InformationLevel Quiet -WarningAction SilentlyContinue
if (-not $hwListening) {
    Write-Output "=== Stage 5/5: no hw_server listening on port $jtagPort -- starting one ==="
    Start-Process -FilePath $hwServer -WindowStyle Hidden
    $deadline = (Get-Date).AddSeconds(30)
    while (-not $hwListening -and (Get-Date) -lt $deadline) {
        Start-Sleep -Seconds 2
        $hwListening = Test-NetConnection -ComputerName "localhost" -Port $jtagPort -InformationLevel Quiet -WarningAction SilentlyContinue
    }
    if (-not $hwListening) { Fail "hw_server did not start listening on port $jtagPort within 30 s" }
}

Write-Output "=== Stage 5/5: writing boot image to onboard QSPI flash over JTAG ==="
& $progFlash -f $bootBin -fsbl $fsblElf -flash_type qspi-x4-single `
    -blank_check -verify -target_name $jtagTarget -url $jtagUrl
if ($LASTEXITCODE -ne 0) { Fail "program_flash exited with code $LASTEXITCODE" }

Write-Output "FRA_QSPI_RESULT = PASS"
Write-Output ""
Write-Output "QSPI flash programmed and verified. To boot standalone from flash:"
Write-Output "  1. Power off the board."
Write-Output "  2. Set DIP switch SW1 on the AC7015B SoM to QSPI FLASH mode: position 1 = OFF, position 2 = ON"
Write-Output "     (AX7015B_User_Manual.pdf section 2.11 -- JTAG mode is ON/ON, the board's current setting)."
Write-Output "  3. Power the board back on -- it boots the FRA CLI from flash without JTAG/host involvement."
Write-Output "  JTAG and UART stay connected and usable for debugging either way."
exit 0
