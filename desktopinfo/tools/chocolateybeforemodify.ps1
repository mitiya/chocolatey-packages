if (Get-Process 'DesktopInfo' -ErrorAction SilentlyContinue) {
   Stop-Process -Name DesktopInfo -Force
}

if (Get-Process 'DesktopInfo64' -ErrorAction SilentlyContinue) {
   Stop-Process -Name DesktopInfo64 -Force
}