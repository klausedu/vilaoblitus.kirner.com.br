const mysql = require('mysql2/promise');

async function fixDuplicatePuzzleIds() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🔧 Corrigindo IDs duplicados de puzzles...\n');

    try {
        // Buscar todos os puzzles
        const [puzzles] = await connection.execute(
            'SELECT location_id, puzzle_id, puzzle_data FROM location_puzzles ORDER BY location_id'
        );

        console.log(`📋 Total de puzzles encontrados: ${puzzles.length}\n`);

        // Processar cada puzzle
        for (const puzzle of puzzles) {
            const locationId = puzzle.location_id;
            const oldPuzzleId = puzzle.puzzle_id;
            const newPuzzleId = `${locationId}_puzzle`;

            // Parse puzzle data
            let puzzleData;
            try {
                puzzleData = JSON.parse(puzzle.puzzle_data);
            } catch (e) {
                console.error(`❌ Erro ao parsear puzzle data para location ${locationId}`);
                continue;
            }

            // Verificar se precisa atualizar
            if (oldPuzzleId !== newPuzzleId) {
                console.log(`🔄 Atualizando puzzle:`);
                console.log(`   Location: ${locationId}`);
                console.log(`   ID antigo: ${oldPuzzleId}`);
                console.log(`   ID novo: ${newPuzzleId}`);

                // Atualizar ID no JSON
                puzzleData.id = newPuzzleId;
                const updatedPuzzleData = JSON.stringify(puzzleData);

                // Atualizar no banco
                await connection.execute(
                    'UPDATE location_puzzles SET puzzle_id = ?, puzzle_data = ? WHERE location_id = ?',
                    [newPuzzleId, updatedPuzzleData, locationId]
                );

                console.log(`   ✅ Atualizado!\n`);
            } else {
                console.log(`✓ Puzzle da location "${locationId}" já está correto (ID: ${newPuzzleId})\n`);
            }
        }

        console.log('✅ Correção concluída com sucesso!');

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

fixDuplicatePuzzleIds().catch(console.error);
