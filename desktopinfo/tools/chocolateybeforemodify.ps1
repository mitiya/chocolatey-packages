if (Get-Process 'DesktopInfo' -ErrorAction SilentlyContinue) {
   Stop-Process -Name DesktopInfo -Force
}
