Write-Host "Build linux image"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine
docker build -t buildbuddy-ubuntu ./ubuntu/

Write-Host "Switch to Windows docker engine"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine

Write-Host "Start the Windows container in a new PowerShell window"
docker build -t buildbuddy-windows ./windows/