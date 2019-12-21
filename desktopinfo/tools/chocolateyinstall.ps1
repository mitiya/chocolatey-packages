$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://www.glenn.delahoy.com/downloads/desktopinfo/DesktopInfo210.zip' # download url, HTTPS preferred

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  validExitCodes= @(0, 3010, 1641)
  Checksum = 'fedd560dc83574ed1e2bf7f415a17e73d0fdb5c2287869116b960bd2b48f30ba'
  ChecksumType = 'SHA256'
}

Install-ChocolateyZipPackage @packageZipArgs
	
