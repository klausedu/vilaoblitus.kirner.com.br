<?php
// Migration: Adicionar coluna corners na tabela hotspots para quadriláteros irregulares

require_once '../config.php';

try {
    $sql = "ALTER TABLE hotspots ADD COLUMN corners TEXT NULL DEFAULT NULL AFTER height";

    $pdo->exec($sql);

    echo "✅ Coluna corners adicionada com sucesso à tabela hotspots!\n";

} catch (PDOException $e) {
    if (strpos($e->getMessage(), 'Duplicate column name') !== false) {
        echo "ℹ️ Coluna corners já existe na tabela hotspots\n";
    } else {
        echo "❌ Erro: " . $e->getMessage() . "\n";
        exit(1);
    }
}
