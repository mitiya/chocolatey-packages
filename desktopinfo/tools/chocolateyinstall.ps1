$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.glenn.delahoy.com/downloads/desktopinfo/DesktopInfo200.zip' # download url, HTTPS preferred

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
  Checksum = '7b7d0ba9f3e8fa9f01b4b9f69fbcdc3fd086bf61a9de5afb6dd36a57b2c3d851'
  ChecksumType = 'SHA256'
}

Install-ChocolateyZipPackage @packageZipArgs
	
