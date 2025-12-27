<?php
/**
 * Migration: Add transition_video column to locations table
 * Allows configuring a custom MP4 video to play before entering a final scene
 */

require_once '../config.php';

try {
    $pdo = getDBConnection();

    echo "🔧 Adicionando coluna transition_video à tabela locations...\n";

    // Check if column already exists
    $stmt = $pdo->query("SHOW COLUMNS FROM locations LIKE 'transition_video'");
    $exists = $stmt->fetch();

    if ($exists) {
        echo "✅ Coluna transition_video já existe!\n";
    } else {
        // Add the column
        $pdo->exec("
            ALTER TABLE locations
            ADD COLUMN transition_video VARCHAR(255) NULL AFTER credits
        ");

        echo "✅ Coluna transition_video adicionada com sucesso!\n";
    }

    echo "\n✅ Migração concluída!\n";

} catch (PDOException $e) {
    echo "❌ Erro na migração: " . $e->getMessage() . "\n";
    exit(1);
}
