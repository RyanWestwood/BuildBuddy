Write-Host "Use linux docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine

Write-Host "Start the Ubuntu container in a new PowerShell window"
Start-Process powershell.exe -NoNewWindow -ArgumentList '-Command "docker run --name actions-ubuntu -d --rm gh-action-runner-ubuntu; "'

Write-Host "Switch to Windows docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine

Write-Host "Start the Windows container in a new PowerShell window"
Start-Process powershell.exe -NoNewWindow -ArgumentList '-Command "docker run --name actions-windows -d --rm gh-action-runner; "'