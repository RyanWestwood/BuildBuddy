Write-Host "Close windows containers"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine
docker stop buildbuddy-windows

Write-Host "Close linux containers"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine
docker stop buildbuddy-ubuntu