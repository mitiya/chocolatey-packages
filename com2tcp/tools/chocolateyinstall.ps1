$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$url        = 'https://deac-riga.dl.sourceforge.net/project/com0com/com2tcp/' + $env:ChocolateyPackageVersion + '/com2tcp-1.3.0.0-386.zip'


$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
  Checksum = 'c13cd062187b84cdc25b5e774c8a45be83dad14721755d44c9bf9494ca460b8b'
  ChecksumType = 'sha256'
}

Install-ChocolateyZipPackage @packageZipArgs
