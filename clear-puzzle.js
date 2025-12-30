const mysql = require('mysql2/promise');

async function clearPuzzle() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🗑️ Limpando puzzle de casa_abandonada_01_sala...\n');

    try {
        // Verificar se há puzzle
        const [puzzles] = await connection.execute(
            'SELECT puzzle_id FROM location_puzzles WHERE location_id = ?',
            ['casa_abandonada_01_sala']
        );

        if (puzzles.length === 0) {
            console.log('⚠️ Nenhum puzzle encontrado para esta localização.');
        } else {
            console.log(`📋 Puzzle encontrado: ${puzzles[0].puzzle_id}`);

            // Deletar puzzle
            await connection.execute(
                'DELETE FROM location_puzzles WHERE location_id = ?',
                ['casa_abandonada_01_sala']
            );

            console.log('✅ Puzzle removido com sucesso!');
        }

        // Verificar hotspots de puzzle
        const [hotspots] = await connection.execute(
            "SELECT id, label FROM hotspots WHERE location_id = ? AND type = 'puzzle'",
            ['casa_abandonada_01_sala']
        );

        if (hotspots.length > 0) {
            console.log(`\n📍 Encontrados ${hotspots.length} hotspots de puzzle:`);
            hotspots.forEach(h => console.log(`  - ${h.label} (ID: ${h.id})`));

            // Deletar hotspots de puzzle
            await connection.execute(
                "DELETE FROM hotspots WHERE location_id = ? AND type = 'puzzle'",
                ['casa_abandonada_01_sala']
            );

            console.log('✅ Hotspots de puzzle removidos!');
        }

        console.log('\n✅ Limpeza concluída!');

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

clearPuzzle().catch(console.error);
