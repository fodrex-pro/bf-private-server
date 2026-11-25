param([Parameter(Mandatory=$true)][string]$ServerDirectory)
$ErrorActionPreference = 'Stop'
$root = (Resolve-Path -LiteralPath $ServerDirectory).Path
$inventory = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'personal-resource-inventory.json') -Raw | ConvertFrom-Json
$missing = @()
foreach ($group in @('mst','system','archive')) {
    $found = 0
    foreach ($name in $inventory.$group) {
        $relative = Join-Path $group $name
        $file = Join-Path $root $relative
        if ((Test-Path -LiteralPath $file -PathType Leaf) -and ((Get-Item -LiteralPath $file).Length -gt 0)) { $found++ }
        else { $missing += $relative }
    }
    Write-Host ("{0}: {1}/{2} present and nonempty" -f $group,$found,$inventory.$group.Count)
}
foreach ($dir in $inventory.assetDirectories) {
    $path = Join-Path $root $dir
    if (!(Test-Path -LiteralPath $path -PathType Container)) { $missing += $dir }
}
if ($missing.Count) {
    Write-Host 'Missing inventory entries (may include optional inputs):'
    $missing | ForEach-Object { Write-Host $_ }
    exit 1
}
Write-Host 'Inventory entries present. Integrity, version compatibility and server startup remain unverified.'
exit 0
