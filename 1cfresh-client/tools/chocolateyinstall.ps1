$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$url        = 'https://1cfresh.com/downloads/platform/setuptc_' + $env:ChocolateyPackageVersion + '.exe' # download url, HTTPS preferred
$url64        = 'https://1cfresh.com/downloads/platform/setuptc_' + $env:ChocolateyPackageVersion + '_x86-64.exe' 

$packageZipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir + '/setup'
  url           = $url
  url64bit		= $url64
  validExitCodes= @(0, 3010, 1641)
}


$packageMSIArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI' #only one of these: exe, msi, msu
  softwareName  = '1c*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  # MSI
    file64		  = $toolsDir + '\setup\1CEnterprise 8 Thin client (x86-64).msi'
    file          = $toolsDir + '\setup\1CEnterprise 8 Thin client.msi'
    silentArgs    = "/qn DESIGNERALLCLIENTS=1 THICKCLIENT=1 THINCLIENTFILE=1 THINCLIENT=1 WEBSERVEREXT=0 SERVER=0 CONFREPOSSERVER=0 CONVERTER77=0 SERVERCLIENT=0 LANGUAGES=RU"
  validExitCodes= @(0, 3010, 1641)
}

Write-Output "install 1с"
Install-ChocolateyZipPackage @packageZipArgs
Install-ChocolateyInstallPackage @packageMSIArgs
Remove-Item -LiteralPath $toolsDir'\setup' -Force -Recurse