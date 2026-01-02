Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead("C:\src\codex.oblitus\backups\codex_oblitus_2026-01-01_00-39-41.zip")
$hasImages = $zip.Entries | Where-Object { $_.FullName.StartsWith("images") }
$hasJs = $zip.Entries | Where-Object { $_.FullName.StartsWith("js") }
$hasCss = $zip.Entries | Where-Object { $_.FullName.StartsWith("css") }
$hasApi = $zip.Entries | Where-Object { $_.FullName.StartsWith("api") }
$hasDb = $zip.Entries | Where-Object { $_.Name -eq "database_backup.sql" }

Write-Host "=== VERIFICAÇÃO DO BACKUP ==="
Write-Host "API incluída:" ($hasApi.Count) "arquivos"
Write-Host "Images incluídas:" ($hasImages.Count) "arquivos"
Write-Host "JS incluído:" ($hasJs.Count) "arquivos"
Write-Host "CSS incluído:" ($hasCss.Count) "arquivos"
Write-Host "Database backup:" ($hasDb.Count -gt 0)
Write-Host ""
Write-Host "Total de arquivos no ZIP:" $zip.Entries.Count

$zip.Dispose()
