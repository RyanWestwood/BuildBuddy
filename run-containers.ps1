Write-Host "Use linux docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine

Write-Host "Start the Ubuntu container in a new PowerShell window"
Start-Process powershell.exe -NoNewWindow -ArgumentList '-Command "docker run --name buildbuddy-ubuntu -d --rm buildbuddy-ubuntu; "'

Write-Host "Switch to Windows docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine

Write-Host "Start the Windows container in a new PowerShell window"
Start-Process powershell.exe -NoNewWindow -ArgumentList '-Command "docker run --name buildbuddy-windows -d --rm buildbuddy-windows; "'