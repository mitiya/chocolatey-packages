$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$forceX86 = $env:chocolateyForceX86

$force = $env:chocolateyForce


if ($forceX86 -eq 'true') {
	
	$bit = '--x86'
	$packname = '1C:Enterprise 8 Thin client*'
	
} else {
	
	$packname = '1C:Enterprise 8 (x86-64) Thin client*'
	
}
	
if ($force -eq 'true') {$force = '--force'}


$filePath = $toolsDir + "\vers"
$lines = Get-Content -Path $filePath
$newvers = $lines -as [string[]]


$localvers = @(Get-Package ${packname} -ErrorAction Ignore).Version

if ($localvers.Count -eq 0) {
    $localvers = @('')
} 

$difsver = Compare-Object -ReferenceObject $localvers -DifferenceObject $newvers -PassThru


foreach ($fresh_version in $difsver) {

    Write-Host $fresh_version
    choco install 1cfresh-client --version ${fresh_version} -pre -m ${bit} -y --allow-downgrade ${force}
}


