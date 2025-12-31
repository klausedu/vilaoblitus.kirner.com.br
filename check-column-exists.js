const mysql = require('mysql2/promise');

async function checkColumn() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🔍 Verificando coluna is_decorative...\n');

    try {
        const [columns] = await connection.execute(
            `SHOW COLUMNS FROM hotspots WHERE Field = 'is_decorative'`
        );

        if (columns.length > 0) {
            console.log('✅ Coluna is_decorative EXISTE:');
            console.log('   Field:', columns[0].Field);
            console.log('   Type:', columns[0].Type);
            console.log('   Null:', columns[0].Null);
            console.log('   Default:', columns[0].Default);
            console.log('\n✓ A coluna está pronta para uso!');
        } else {
            console.log('❌ Coluna is_decorative NÃO EXISTE!');
            console.log('   Execute: node add-decorative-column.js');
        }

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

checkColumn().catch(console.error);
