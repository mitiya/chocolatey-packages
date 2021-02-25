function killpdf417 {
	$prc = gwmi Win32_Process | ? { $_.commandline -match "PDF417" } 
	$prc.Handle
	Stop-Process -Id $prc.Handle -Force
}

