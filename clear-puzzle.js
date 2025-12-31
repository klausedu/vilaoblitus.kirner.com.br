const mysql = require('mysql2/promise');

async function clearAllPuzzles() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🗑️  Limpando TODOS os puzzles do banco...\n');

    try {
        // Deletar todos os puzzles
        const [result] = await connection.execute('DELETE FROM location_puzzles');

        console.log(`✅ ${result.affectedRows} puzzles removidos com sucesso!`);
        console.log('Agora você pode recriar os puzzles do zero no editor.\n');

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

clearAllPuzzles().catch(console.error);
