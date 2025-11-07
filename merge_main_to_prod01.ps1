$TargetBranch = "prod01"
$SourceBranch = "main"
$InitialBranch = (git rev-parse --abbrev-ref HEAD).Trim()

Write-Host "Entrando na branch '$SourceBranch' e atualizando..." -ForegroundColor Cyan
git checkout $SourceBranch
git pull --ff-only origin $SourceBranch

Write-Host "Entrando na branch '$TargetBranch'..." -ForegroundColor Cyan
git checkout $TargetBranch
git pull --ff-only origin $TargetBranch

Write-Host "Mesclando '$SourceBranch' -> '$TargetBranch'..." -ForegroundColor Cyan
if (git merge $SourceBranch) {
    Write-Host "Merge concluído com sucesso." -ForegroundColor Green
} else {
    Write-Host "Merge gerou conflitos. Corrija-os manualmente e execute o merge novamente." -ForegroundColor Yellow
    return
}

Write-Host "Empurrando '$TargetBranch' para o remoto..." -ForegroundColor Cyan
git push origin $TargetBranch

if ($InitialBranch -ne $TargetBranch) {
    Write-Host "Voltando para a branch original '$InitialBranch'." -ForegroundColor Cyan
    git checkout $InitialBranch
}
