# Flash the AX7015B with the current PCIe-integrated bitstream + FRA_Controller ELF over JTAG.
#
# Wraps program_fra_pcie_jtag.tcl (which always points at the latest exported
# system_bd_wrapper_pcie.bit / ps7_init.tcl / FRA_Controller.elf) with up-front
# existence + freshness checks, so a stale artifact is reported before JTAG runs.
#
# Usage (from repo root or anywhere):
#   powershell -File hardware/fra_zynq7015_pcie/scripts/flash_fra_pcie.ps1

$ErrorActionPreference = "Stop"

$repo   = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path
$xsct   = "C:\Xilinx\2025.1\Vitis\bin\xsct.bat"
$tclScript = Join-Path $PSScriptRoot "program_fra_pcie_jtag.tcl"

$artifacts = [ordered]@{
    "Bitstream" = Join-Path $repo "hardware\fra_zynq7015_pcie\export\system_bd_wrapper_pcie.bit"
    "PS7 init"  = Join-Path $repo "software\PCIE_FRA\hw\sdt\ps7_init.tcl"
    "Firmware"  = Join-Path $repo "software\FRA_Controller\build\FRA_Controller.elf"
}

Write-Output "Flashing FRA PCIe design with:"
foreach ($name in $artifacts.Keys) {
    $path = $artifacts[$name]
    if (-not (Test-Path $path)) {
        Write-Output "FRA_FLASH_RESULT = FAIL (missing $path)"
        exit 1
    }
    $item = Get-Item $path
    Write-Output ("  {0,-10} {1}  ({2:yyyy-MM-dd HH:mm:ss})" -f $name, $item.FullName, $item.LastWriteTime)
}

& $xsct $tclScript 2>&1 | ForEach-Object {
    Write-Output $_
    if ($_ -match "FRA_JTAG_RESULT = OK") { $script:jtagOk = $true }
}

if ($script:jtagOk) {
    Write-Output "FRA_FLASH_RESULT = PASS"
    exit 0
} else {
    Write-Output "FRA_FLASH_RESULT = FAIL (see xsct output above)"
    exit 1
}
