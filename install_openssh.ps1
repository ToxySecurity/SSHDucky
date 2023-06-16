# Define the temporary download path
$downloadPath = "$env:TEMP\OpenSSHInstaller.msi"

# Define the paths to the scripts
$GetInfo = "$PWD\get_info.ps1"
$replacedata = "$PWD\replace.ps1"

# Download the OpenSSH installer
$opensshInstallerURL = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v9.2.2.0p1-Beta/OpenSSH-Win64-v9.2.2.0.msi"

Write-Host "Downloading OpenSSH installer..."
Invoke-WebRequest -Uri $opensshInstallerURL -OutFile $downloadPath

# Check if the download was successful
if (Test-Path $downloadPath) {
    Write-Host "OpenSSH installer downloaded successfully."

    # Install OpenSSH using the MSI installer with administrative permissions
    Write-Host "Installing OpenSSH..."

    # Prompt for permission
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$downloadPath`" /qn" -Verb RunAs -Wait

    # Check if the installation was successful
    $isOpenSSHInstalled = Get-WindowsCapability -Online | Where-Object { $_.Name -like 'OpenSSH*' }

    if ($isOpenSSHInstalled) {
        Write-Host "OpenSSH installation completed."
        & $replacedata
        & $GetInfo
        exit 0
    }
    else {
        Write-Host "OpenSSH installation failed."
        exit 1
    }
}
else {
    Write-Host "OpenSSH installer download failed."
    exit 1
}
