const mysql = require('mysql2/promise');

async function checkPuzzles() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🔍 Verificando puzzles nas localizações...\n');

    try {
        // Buscar todas as localizações com puzzles
        const [puzzles] = await connection.execute(
            'SELECT location_id, puzzle_id, puzzle_data FROM location_puzzles ORDER BY location_id'
        );

        if (puzzles.length === 0) {
            console.log('❌ NENHUM puzzle encontrado no banco!\n');
        } else {
            console.log(`✅ ${puzzles.length} puzzles encontrados:\n`);
            puzzles.forEach((p, i) => {
                console.log(`${i + 1}. Location ID: ${p.location_id}`);
                console.log(`   Puzzle ID: ${p.puzzle_id}`);

                // Parse puzzle data para ver se tem dados duplicados
                try {
                    const data = JSON.parse(p.puzzle_data);
                    console.log(`   Type: ${data.type || 'N/A'}`);
                    console.log(`   ID no JSON: ${data.id || 'N/A'}`);
                    if (data.type === 'slider') {
                        console.log(`   Slider image: ${data.backgroundImage || 'N/A'}`);
                        console.log(`   Rows: ${data.rows}, Cols: ${data.cols}`);
                    }
                    if (data.type === 'password') {
                        console.log(`   Password: ${data.password || 'N/A'}`);
                    }
                } catch (e) {
                    console.log(`   ⚠️ Erro ao parsear JSON: ${e.message}`);
                }
                console.log('');
            });
        }

        // Contar total
        const [counts] = await connection.execute(
            'SELECT COUNT(*) as total FROM location_puzzles'
        );

        console.log('📊 Estatísticas:');
        console.log(`   Total de puzzles: ${counts[0].total}`);

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

checkPuzzles().catch(console.error);
