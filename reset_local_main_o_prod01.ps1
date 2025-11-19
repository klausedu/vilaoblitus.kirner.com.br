# ESTE SCRIPT SOBRESCREVE A MAIN LOCAL COM O CÓDIGO DA PROD01 DO GITHUB
# Use com cuidado. Ele descarta commits na main que não existam na prod01.

$RemoteBranch = "prod01"
$LocalBranchToReset = "main"

Write-Host "ATENÇÃO: Isso fará a '$LocalBranchToReset' ficar IDÊNTICA à '$RemoteBranch' do GitHub." -ForegroundColor Red
Write-Host "Qualquer histórico na '$LocalBranchToReset' que não esteja em '$RemoteBranch' será PERDIDO." -ForegroundColor Red
Write-Host "Pressione ENTER para continuar ou CTRL+C para cancelar..."
Read-Host

# 1. Garante que temos a versão mais recente do GitHub
Write-Host "Buscando atualizações do remoto (fetch)..." -ForegroundColor Cyan
git fetch origin

# 2. Vai para a branch main
Write-Host "Entrando na branch '$LocalBranchToReset'..." -ForegroundColor Cyan
git checkout $LocalBranchToReset

# 3. O Comando Nuclear: Reset Hard
# Isso move o ponteiro da main para exatamente onde está origin/prod01
Write-Host "Resetando '$LocalBranchToReset' para combinar com 'origin/$RemoteBranch'..." -ForegroundColor Yellow
git reset --hard origin/$RemoteBranch

Write-Host "Sua branch local '$LocalBranchToReset' agora é um espelho exato de '$RemoteBranch'." -ForegroundColor Green

# Dica sobre o push
Write-Host "`nNOTA IMPORTANTE SOBRE O PUSH:" -ForegroundColor Magenta
Write-Host "Se você tentar dar 'git push origin main' agora, o Git vai rejeitar porque você voltou no tempo (removeu commits)."
Write-Host "Para forçar essa mudança no GitHub (apagando os commits lá também), você teria que usar:"
Write-Host "git push origin main --force" -ForegroundColor Red