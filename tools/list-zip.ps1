Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead("C:\src\codex.oblitus\backups\codex_oblitus_2026-01-01_00-34-20.zip")
Write-Host "=== CONTEÚDO DO ZIP (primeiros 30 itens) ==="
$zip.Entries | Select-Object -First 30 | ForEach-Object { Write-Host $_.FullName }
$zip.Dispose()
