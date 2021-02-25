$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\helpers.ps1"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI' 
  url                    = 'https://data.nalog.ru/files/ppdgr/2.0.7/SetupPPDGR2.msi'
  silentArgs    = '/passive'
  Checksum = '9ba2234a9dd92b2dd2cbbc3bc9d1e80db92c5e9057d783136a82b3ca195e609d'
  ChecksumType = 'sha256'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
killpdf417