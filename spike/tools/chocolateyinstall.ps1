$packageName = 'spike'
$installerType = 'exe'
$silentArgs = '/S'
$url = 'https://spikenow.com/web/_dist/win/Spike%20Setup%202.9.1.exe'


Install-ChocolateyPackage $packageName $installerType $silentArgs $url