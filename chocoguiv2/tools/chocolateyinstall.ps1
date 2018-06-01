$packageName = 'chocoguiv2'
$url = 'https://github.com/mitiya/chocoGUI/releases/download/0.4/chocoGUIv2.zip'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shcPath = $ChocolateyInstall + '\bin\chocoGUIv2.exe'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" 
	
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\chocoGUIv2.lnk" -targetPath "$($env:ChocolateyInstall + '\bin\chocoGUIv2.exe')"				 