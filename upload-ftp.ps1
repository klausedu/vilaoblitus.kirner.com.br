# FTP Upload Script
$ftpServer = "ftp://153.92.11.84:65002"
$username = "u811529511"
$password = "Italia2018!123"

# Criar credenciais
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($username, $securePassword)

Write-Host "Uploading LocationScene.v2.js..." -ForegroundColor Yellow

# Upload LocationScene.v2.js
$localFile1 = "js\phaser\scenes\LocationScene.v2.js"
$remoteFile1 = "$ftpServer/public_html/js/phaser/scenes/LocationScene.v2.js"

try {
    $webclient = New-Object System.Net.WebClient
    $webclient.Credentials = $credential
    $webclient.UploadFile($remoteFile1, $localFile1)
    Write-Host "✓ LocationScene.v2.js uploaded successfully!" -ForegroundColor Green
} catch {
    Write-Host "✗ Error uploading LocationScene.v2.js: $_" -ForegroundColor Red
}

Write-Host "Uploading game-phaser.html..." -ForegroundColor Yellow

# Upload game-phaser.html
$localFile2 = "game-phaser.html"
$remoteFile2 = "$ftpServer/public_html/game-phaser.html"

try {
    $webclient = New-Object System.Net.WebClient
    $webclient.Credentials = $credential
    $webclient.UploadFile($remoteFile2, $localFile2)
    Write-Host "✓ game-phaser.html uploaded successfully!" -ForegroundColor Green
} catch {
    Write-Host "✗ Error uploading game-phaser.html: $_" -ForegroundColor Red
}

Write-Host "`nUpload complete! Press any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
