Write-Host "Close linux containers"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchLinuxEngine
docker stop actions-ubuntu
docker rm actions-ubuntu

Write-Host "Close windows containers"
& 'C:\Program Files\Docker\Docker\DockerCli.exe' -SwitchWindowsEngine
docker stop actions-windows
docker rm actions-windows