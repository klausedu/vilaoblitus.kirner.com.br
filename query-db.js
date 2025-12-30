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
        // Listar todas as tabelas
        const [tables] = await connection.execute('SHOW TABLES');
        console.log('=== TODAS AS TABELAS ===');
        console.log(tables.map(t => Object.values(t)[0]).join(', '));

        // Buscar circulo e triangulo
        const [items] = await connection.execute("SELECT * FROM items WHERE id IN ('circulo', 'triangulo')");
        console.log('\n=== CIRCULO E TRIANGULO ===');
        console.table(items);

        // Verificar estrutura da tabela locations
        const [locDesc] = await connection.execute("DESCRIBE locations");
        console.log('\n=== ESTRUTURA DA TABELA LOCATIONS ===');
        console.table(locDesc);

        // Buscar locations que contenham circulo ou triangulo no puzzle JSON
        const [locs] = await connection.execute("SELECT id, name, puzzle FROM locations WHERE puzzle LIKE '%circulo%' OR puzzle LIKE '%triangulo%'");
        console.log('\n=== LOCATIONS COM CIRCULO OU TRIANGULO ===');
        locs.forEach(loc => {
            console.log(`\n--- ${loc.id} (${loc.name}) ---`);
            if (loc.puzzle) {
                try {
                    const puzzleData = JSON.parse(loc.puzzle);
                    if (puzzleData.items) {
                        const filtered = puzzleData.items.filter(i => i.id === 'circulo' || i.id === 'triangulo');
                        if (filtered.length > 0) {
                            console.log(JSON.stringify(filtered, null, 2));
                        }
                    }
                } catch (e) {
                    console.log('Erro ao parsear puzzle:', e.message);
                }
            }
        });

    } catch (error) {
        console.error('Erro ao consultar banco:', error.message);
    } finally {
        await connection.end();
    }
}

queryDatabase();
