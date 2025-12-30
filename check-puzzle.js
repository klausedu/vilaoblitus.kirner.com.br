const mysql = require('mysql2/promise');

async function checkPuzzle() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🔍 Verificando puzzle de casa_abandonada_01_sala...\n');

    try {
        // Verificar se há puzzle
        const [puzzles] = await connection.execute(
            'SELECT puzzle_id, puzzle_data FROM location_puzzles WHERE location_id = ?',
            ['casa_abandonada_01_sala']
        );

        if (puzzles.length === 0) {
            console.log('❌ NENHUM puzzle encontrado no banco!\n');
        } else {
            console.log('✅ Puzzle encontrado!');
            console.log('📌 ID:', puzzles[0].puzzle_id);
            console.log('📄 Data:');
            console.log(JSON.stringify(JSON.parse(puzzles[0].puzzle_data), null, 2));
        }

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

checkPuzzle().catch(console.error);
