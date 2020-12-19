. $PSScriptRoot\Setup-Tools.ps1

if (!(Test-Path $destination\addons)) {
    mkdir $destination\addons
}

Get-ChildItem $PSScriptRoot\..\addons | ForEach-Object {
    $outputName = "$destination\addons\" + $_.Name + ".pbo"
    Write-Output ("Packing " + $_.Name + "to $outputName.")
    & $addonBuilder "build" "-p" $_.FullName $outputName "--force"
}

Copy-Item -Path $PSScriptRoot\..\cnto_logo.paa $destination
Copy-Item -Path $PSScriptRoot\..\COPYING.txt $destination
Copy-Item -Path $PSScriptRoot\..\mod.cpp $destination
Copy-Item -Path $PSScriptRoot\..\README.md $destination