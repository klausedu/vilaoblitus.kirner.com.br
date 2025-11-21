# SSH connection details
$sshHost = "153.92.11.84"
$sshPort = "65002"
$sshUser = "u811529511"
$sshPass = "Italia2018!123"

Write-Host "Connecting to Hostinger via SSH..." -ForegroundColor Yellow
Write-Host "Host: $sshHost" -ForegroundColor Cyan
Write-Host "Port: $sshPort" -ForegroundColor Cyan
Write-Host "User: $sshUser" -ForegroundColor Cyan

# Commands to execute on the server
$commands = @"
cd public_html
git config pull.rebase false
git fetch origin
git reset --hard origin/main
echo 'Git repository updated successfully!'
"@

Write-Host "`nExecuting commands on server..." -ForegroundColor Yellow
Write-Host $commands -ForegroundColor Gray

# Use plink (PuTTY) if available, otherwise show manual instructions
if (Get-Command plink -ErrorAction SilentlyContinue) {
    echo y | plink -P $sshPort ${sshUser}@${sshHost} -pw $sshPass $commands
}
else {
    Write-Host "`n⚠ PuTTY/plink not found. Please run these commands manually:" -ForegroundColor Yellow
    Write-Host "`n1. Connect via SSH:" -ForegroundColor Cyan
    Write-Host "   ssh -p $sshPort ${sshUser}@${sshHost}" -ForegroundColor White
    Write-Host "`n2. Enter password when prompted:" -ForegroundColor Cyan
    Write-Host "   $sshPass" -ForegroundColor White
    Write-Host "`n3. Run these commands:" -ForegroundColor Cyan
    Write-Host $commands -ForegroundColor White
}

Write-Host "`nPress any key to exit..." -ForegroundColor Cyan
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
