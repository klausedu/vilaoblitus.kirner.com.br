// Script para consultar banco de dados MySQL
const mysql = require('mysql2/promise');

async function queryDatabase() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    try {
        // Buscar todos os puzzles na tabela location_puzzles
        const [puzzles] = await connection.execute("SELECT location_id, puzzle_id, puzzle_data FROM location_puzzles");

        console.log(`=== PUZZLES NO BANCO (${puzzles.length} encontrados) ===\n`);

        puzzles.forEach((p, i) => {
            console.log(`${i + 1}. Location: ${p.location_id}`);
            console.log(`   Puzzle ID: ${p.puzzle_id}`);

            try {
                const data = JSON.parse(p.puzzle_data);
                console.log(`   Type: ${data.type}`);
                console.log(`   Tem digitPositions? ${!!data.digitPositions}`);
                console.log(`   Tem digitSize? ${!!data.digitSize}`);
                console.log(`   Tem visual? ${!!data.visual}`);

                if (data.digitPositions) {
                    console.log(`   digitPositions:`);
                    data.digitPositions.forEach((pos, idx) => {
                        console.log(`     [${idx}] x: ${pos.x}, y: ${pos.y}`);
                    });
                }

                if (data.digitSize) {
                    console.log(`   digitSize:`, data.digitSize);
                }

                console.log('');
            } catch (e) {
                console.log('   ❌ Erro ao parsear puzzle_data:', e.message);
                console.log('');
            }
        });

    } catch (error) {
        console.error('Erro ao consultar banco:', error.message);
    } finally {
        await connection.end();
    }
}

queryDatabase();
