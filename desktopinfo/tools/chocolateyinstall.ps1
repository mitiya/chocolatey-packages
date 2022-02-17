$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.glenn.delahoy.com/downloads/desktopinfo/DesktopInfo3040.zip' # download url, HTTPS preferred

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
  Checksum = 'BA668BC5292BC72ED71D1F87D2E39EBD6527E994B41F4381F522F5366B7D796D'
  ChecksumType = 'SHA256'
}

Install-ChocolateyZipPackage @packageZipArgs
	
