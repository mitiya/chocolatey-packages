$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$url        = 'https://github.com/mitiya/wifiabbcmd/releases/download/' + $env:ChocolateyPackageVersion + '/wifiaddcmd.zip' # download url, HTTPS preferred

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
}


