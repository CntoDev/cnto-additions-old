. $PSScriptRoot\Setup-Tools.ps1

if (Test-Path $destination\addons) {
    Remove-Item -Path $destination\addons -Force -Recurse -Confirm:$false
}

mkdir $destination\addons

if (Test-Path $destination\optionals) {
    Remove-Item -Path $destination\optionals -Force -Recurse -Confirm:$false
}

mkdir $destination\optionals

Get-ChildItem $PSScriptRoot\..\addons | ForEach-Object {
    $outputName = "$destination\addons\" + $_.Name + ".pbo"
    Write-Output ("Packing " + $_.Name + "to $outputName.")
    & $addonBuilder "build" "-p" $_.FullName $outputName "--force"
}

Get-ChildItem $PSScriptRoot\..\optionals | ForEach-Object {
    $outputName = "$destination\optionals\" + $_.Name + ".pbo"
    Write-Output ("Packing " + $_.Name + "to $outputName.")
    & $addonBuilder "build" "-p" $_.FullName $outputName "--force"
}

Copy-Item -Path $PSScriptRoot\..\cnto_logo.paa $destination
Copy-Item -Path $PSScriptRoot\..\COPYING.txt $destination
Copy-Item -Path $PSScriptRoot\..\mod.cpp $destination
Copy-Item -Path $PSScriptRoot\..\README.md $destination