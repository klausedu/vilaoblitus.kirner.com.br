<?php
require_once '../config.php';

try {
    $pdo = getDBConnection();
    echo "🔧 Verificando e corrigindo colunas dramatic_messages...\n\n";

    // Verificar estrutura atual
    $stmt = $pdo->query("SHOW CREATE TABLE locations");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "📋 Estrutura atual da tabela:\n";
    echo $result['Create Table'] . "\n\n";

    // Recriar as colunas sem constraints problemáticos
    echo "🔨 Recriando colunas dramatic_messages e dramatic_message_duration...\n";

    // Drop e recriar dramatic_messages
    try {
        $pdo->exec("ALTER TABLE locations DROP COLUMN dramatic_messages");
        echo "✅ Coluna dramatic_messages removida\n";
    } catch (PDOException $e) {
        echo "⚠️ Erro ao remover dramatic_messages (pode não existir): " . $e->getMessage() . "\n";
    }

    try {
        $pdo->exec("ALTER TABLE locations DROP COLUMN dramatic_message_duration");
        echo "✅ Coluna dramatic_message_duration removida\n";
    } catch (PDOException $e) {
        echo "⚠️ Erro ao remover dramatic_message_duration (pode não existir): " . $e->getMessage() . "\n";
    }

    // Recriar as colunas corretamente
    $pdo->exec("
        ALTER TABLE locations
        ADD COLUMN dramatic_messages LONGTEXT NULL DEFAULT NULL AFTER transition_video
    ");
    echo "✅ Coluna dramatic_messages recriada (LONGTEXT NULL)\n";

    $pdo->exec("
        ALTER TABLE locations
        ADD COLUMN dramatic_message_duration INT(5) NULL DEFAULT NULL AFTER dramatic_messages
    ");
    echo "✅ Coluna dramatic_message_duration recriada (INT NULL)\n";

    echo "\n✅ Migração concluída com sucesso!\n";

} catch (PDOException $e) {
    echo "❌ Erro na migração: " . $e->getMessage() . "\n";
    exit(1);
}
