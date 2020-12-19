$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI' 
  url                    = 'https://data.nalog.ru/files/decl2019/1.1.0/InsD2019.msi'
  silentArgs    = '/passive'
  Checksum = '53be4a9072add569596f082cca4a39bd5fee985a94c5dec39c6d4cb5ee953753'
  ChecksumType = 'sha256'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
killpdf417