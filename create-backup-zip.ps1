param(
    [string]$zipFile,
    [string]$backupDir
)

$source = "C:\src\codex.oblitus"

Add-Type -AssemblyName System.IO.Compression.FileSystem

# Remover ZIP antigo se existir
if (Test-Path $zipFile) {
    Remove-Item $zipFile
}

Write-Host "Criando arquivo ZIP: $zipFile"

# Criar ZIP
$zip = [System.IO.Compression.ZipFile]::Open($zipFile, 'Create')

try {
    # Adicionar pastas completas
    $folders = @("api", "css", "images", "js")
    foreach ($folder in $folders) {
        $path = Join-Path $source $folder
        if (Test-Path $path) {
            Write-Host "Adicionando pasta: $folder"
            Get-ChildItem $path -Recurse -File | ForEach-Object {
                $rel = $_.FullName.Substring($source.Length + 1)
                [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $rel, 'Optimal') | Out-Null
            }
        }
    }

    # Adicionar HTMLs principais
    $htmlFiles = @("location-editor-db.html", "game-phaser.html", "index.html", "landing.html")
    foreach ($file in $htmlFiles) {
        $path = Join-Path $source $file
        if (Test-Path $path) {
            Write-Host "Adicionando: $file"
            [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $path, $file, 'Optimal') | Out-Null
        }
    }

    # Adicionar backup do banco
    $dbBackup = Join-Path $backupDir "database_backup.sql"
    if (Test-Path $dbBackup) {
        Write-Host "Adicionando: database_backup.sql"
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $dbBackup, "database_backup.sql", 'Optimal') | Out-Null
    }

    Write-Host "ZIP criado com sucesso!"
    Write-Host "Total de arquivos: $($zip.Entries.Count)"

} finally {
    $zip.Dispose()
}
