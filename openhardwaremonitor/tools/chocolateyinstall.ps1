$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"




$url        = 'https://openhardwaremonitor.org/files/openhardwaremonitor-v' + $env:ChocolateyPackageVersion + '.zip' # download url, HTTPS preferred

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
}


Install-ChocolateyZipPackage @packageZipArgs
