# Generate SSH key pair
$sshDirectory = "$HOME\.ssh"
$sshKeyPath = "$sshDirectory\id_rsa"
$sshPublicKeyPath = "$sshDirectory\id_rsa.pub"

if (!(Test-Path $sshDirectory)) {
    New-Item -ItemType Directory -Path $sshDirectory | Out-Null
}

if (!(Test-Path $sshKeyPath) -or !(Test-Path $sshPublicKeyPath)) {
    ssh-keygen -t rsa -b 4096 -f $sshKeyPath -N " "
    
    Write-Host "SSH key pair generated."
}
else {
    Write-Host "SSH key pair already exists."
}

# Get public IP address
$publicIP = Invoke-RestMethod -Uri "https://api.ipify.org?format=text"

# Save public IP to file
$publicIPPath = "$sshDirectory\public_ip.txt"
$publicIP | Out-File -FilePath $publicIPPath

# Move SSH keys to the same folder
Move-Item -Path "$sshKeyPath*" -Destination $sshDirectory -Force

Write-Host "SSH keys and public IP address saved in $sshDirectory."
