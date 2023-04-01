# escape=`
# Use the official Windows Server Core image as the base image
FROM mcr.microsoft.com/windows/servercore:ltsc2019
# FROM chocolatey/choco:latest-windows
# Set environment variables for Visual Studio, CMake, and MSBuild
ENV VS_VERSION=2022 `
    VS_EDITION=BuildTools `
    VS_CHANNEL_URI=https://aka.ms/vs/17/release/channel `
    VS_BUILDTOOLS_URI=https://aka.ms/vs/17/release/vs_buildtools.exe `
    CMAKE_VERSION=3.22.0

# Install Chocolatey
ADD install/Install-Choco.ps1 .
RUN powershell -Command C:\Install-Choco.ps1 -Wait;
RUN powershell -Command Remove-Item C:\Install-Choco.ps1 -Force

# Install Visual Studio Build Tools, CMake, and Git
RUN choco install -y --no-progress cmake --version %CMAKE_VERSION% --installargs 'ADD_CMAKE_TO_PATH=System' `
    && choco install -y --no-progress git 
    
RUN powershell -Command `
    Invoke-WebRequest -Uri "https://aka.ms/vs/16/release/vs_buildtools.exe" -OutFile "vs_buildtools.exe"

RUN powershell -Command .\vs_buildtools.exe --quiet --wait --norestart --nocache `
        --installPath C:\BuildTools `
        --add Microsoft.VisualStudio.Workload.VCTools `
        --add Microsoft.VisualStudio.Component.Windows10SDK.19041 `
        --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 `
        --add Microsoft.VisualStudio.Component.VC.CMake.Project

# Create a folder under the drive root
RUN mkdir actions-runner
RUN cd actions-runner

# Download the action-runner package
RUN powershell -Command $NetProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12' ;   `
    [System.Net.ServicePointManager]::SecurityProtocol = $NetProtocols ;                            `
    Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-win-x64-2.303.0.zip -OutFile actions-runner-win-x64-2.303.0.zip -UseBasicParsing

# Extract the installer
RUN powershell -Command Add-Type -AssemblyName System.IO.Compression.FileSystem ; `
    [System.IO.Compression.ZipFile]::ExtractToDirectory('C:\actions-runner-win-x64-2.303.0.zip', 'C:\actions-runner')
RUN powershell -Command Remove-Item -Path 'C:\actions-runner-win-x64-2.303.0.zip'

COPY scripts/* scripts/

RUN powershell -Command `
    [Environment]::SetEnvironmentVariable('ACTIONS_RUNNER_HOOK_JOB_STARTED', 'C:/scripts/job-started.ps1', [EnvironmentVariableTarget]::Machine) ;                      `
    [Environment]::SetEnvironmentVariable('ACTIONS_RUNNER_HOOK_JOB_COMPLETED', 'C:/scripts/job-finished.ps1', [EnvironmentVariableTarget]::Machine) ;           

ENTRYPOINT ["powershell", "-File", "scripts/start.ps1"]