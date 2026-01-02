$SourceBranch = "prod01"
$TargetBranch = "main"

Write-Host "Comparando '$SourceBranch' com '$TargetBranch'..." -ForegroundColor Cyan

# 1. Garante que temos as referências mais recentes do remoto sem alterar seus arquivos locais
Write-Host "Buscando atualizações do remoto (git fetch)..." -ForegroundColor Yellow
git fetch origin

# 2. Mostra os commits que existem na origem mas não no destino
# Isso responde: "O que vai entrar na main se eu fizer o merge?"
Write-Host "`n--- Commits em '$SourceBranch' que NÃO estão em '$TargetBranch' ---" -ForegroundColor Magenta
$commits = git log origin/$TargetBranch..origin/$SourceBranch --oneline --graph --decorate
if ($commits) {
    $commits | Out-Host
} else {
    Write-Host "Nenhum commit novo para mesclar." -ForegroundColor Green
}

# 3. Mostra o resumo dos arquivos alterados (diffstat)
# O uso de três pontos (...) compara o ponto em que as branches divergiram
Write-Host "`n--- Resumo dos arquivos modificados ---" -ForegroundColor Magenta
git diff --stat origin/$TargetBranch...origin/$SourceBranch

Write-Host "`n--- Fim da comparação ---" -ForegroundColor Cyan