$BuildToolsPath = "C:\BuildTools"
$MSVCPath = "$BuildToolsPath\VC\Tools\MSVC\14.29.30133"
$WindowsSDKPath = "C:\Program Files (x86)\Windows Kits\10"

$env:PATH = "$($MSVCPath)\bin\Hostx64\x64;$($WindowsSDKPath)\bin\10.0.19041.0\x64;$($env:PATH)"
$env:LIB = "$($MSVCPath)\lib\x64;$($WindowsSDKPath)\Lib\10.0.19041.0\ucrt\x64;$($WindowsSDKPath)\Lib\10.0.19041.0\um\x64;$($env:LIB)"
$env:INCLUDE = "$($MSVCPath)\include;$($WindowsSDKPath)\Include\10.0.19041.0\ucrt;$($WindowsSDKPath)\Include\10.0.19041.0\um;$($WindowsSDKPath)\Include\10.0.19041.0\shared;$($env:INCLUDE)"

C:/actions-runner/config.cmd --url url --pat token --unattended --replace --name Windows --work _work --labels 'self-hosted','Windows','X64'
C:/actions-runner/run.cmd