# Check if script is running with administrator privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as an Administrator!"
    exit 1
}

# Ensure TLS 1.2 is enabled
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Set Chocolatey download URL
$chocolateyUrl = 'https://chocolatey.org/install.ps1'

# Download and install Chocolatey
try {
    Write-Host "Downloading and installing Chocolatey..."
    iex ((New-Object System.Net.WebClient).DownloadString($chocolateyUrl))
    Write-Host "Chocolatey installation completed."
}
catch {
    Write-Error "Failed to install Chocolatey. Please check the error message and try again."
    exit 1
}

# Verify Chocolatey installation
try {
    choco --version
    Write-Host "Chocolatey is installed and ready to use."
}
catch {
    Write-Error "Chocolatey installation verification failed. Please check the error message and try again."
    exit 1
}