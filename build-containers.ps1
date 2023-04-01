Write-Host "Build linux image"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine
docker build -t gh-action-runner-ubuntu ./ubuntu/

Write-Host "Switch to Windows docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine

Write-Host "Start the Windows container in a new PowerShell window"
docker build -t gh-action-runner ./windows/