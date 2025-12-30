<?php
header('Content-Type: text/html; charset=utf-8');

require_once 'api/config.php';

echo "<h1>🗑️ Limpar Puzzle de casa_abandonada_01_sala</h1>";
echo "<pre>";

try {
    $pdo = getDBConnection();

    echo "📋 Verificando puzzle...\n\n";

    // Verificar se há puzzle
    $stmt = $pdo->prepare("SELECT puzzle_id, puzzle_data FROM location_puzzles WHERE location_id = ?");
    $stmt->execute(['casa_abandonada_01_sala']);
    $puzzles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($puzzles) === 0) {
        echo "⚠️ Nenhum puzzle encontrado para casa_abandonada_01_sala.\n\n";
    } else {
        echo "📌 Puzzle encontrado:\n";
        echo "  ID: " . $puzzles[0]['puzzle_id'] . "\n";
        echo "  Data: " . substr($puzzles[0]['puzzle_data'], 0, 100) . "...\n\n";

        // Deletar puzzle
        $deleteStmt = $pdo->prepare("DELETE FROM location_puzzles WHERE location_id = ?");
        $deleteStmt->execute(['casa_abandonada_01_sala']);

        echo "✅ Puzzle removido da tabela location_puzzles!\n\n";
    }

    // Verificar hotspots de puzzle
    $stmt = $pdo->prepare("SELECT id, label FROM hotspots WHERE location_id = ? AND type = 'puzzle'");
    $stmt->execute(['casa_abandonada_01_sala']);
    $hotspots = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (count($hotspots) > 0) {
        echo "📍 Encontrados " . count($hotspots) . " hotspots de puzzle:\n";
        foreach ($hotspots as $h) {
            echo "  - {$h['label']} (ID: {$h['id']})\n";
        }
        echo "\n";

        // Deletar hotspots de puzzle
        $deleteStmt = $pdo->prepare("DELETE FROM hotspots WHERE location_id = ? AND type = 'puzzle'");
        $deleteStmt->execute(['casa_abandonada_01_sala']);

        echo "✅ Hotspots de puzzle removidos!\n\n";
    } else {
        echo "ℹ️ Nenhum hotspot de puzzle encontrado.\n\n";
    }

    echo "✅ Limpeza concluída com sucesso!\n";
    echo "\n🔄 Recarregue o editor ou o jogo para ver as mudanças.";

} catch (Exception $e) {
    echo "❌ Erro: " . $e->getMessage() . "\n";
}

echo "</pre>";
?>
