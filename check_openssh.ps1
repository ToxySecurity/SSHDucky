# Check if OpenSSH is installed
$opensshPath = "C:\Program Files\OpenSSH"

if (Test-Path $opensshPath) {
    exit 0
} else {
    exit 1
}
