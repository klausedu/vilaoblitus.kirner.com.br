const mysql = require('mysql2/promise');

async function fixArvore() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('[*] Corrigindo item arvore...\n');

    try {
        // Atualizar display_image e is_decorative
        const [result] = await connection.execute(`
            UPDATE hotspots
            SET display_image = 'images/objects/arvore01_spritesheet.png',
                is_decorative = 1
            WHERE item_id = 'arvore'
        `);

        console.log(`[OK] Atualizado ${result.affectedRows} registro(s)\n`);

        // Verificar
        const [rows] = await connection.execute(`
            SELECT h.id, h.location_id, h.item_id, h.display_image, h.is_decorative
            FROM hotspots h
            WHERE h.item_id = 'arvore'
        `);

        rows.forEach(row => {
            console.log(`[SUCCESS] Item arvore atualizado:`);
            console.log(`  Location: ${row.location_id}`);
            console.log(`  Image: ${row.display_image}`);
            console.log(`  Decorative: ${row.is_decorative ? 'SIM' : 'NAO'}`);
            console.log('');
        });

        console.log('[INFO] Agora de Ctrl+Shift+R no jogo para ver a animacao!');
    } catch (error) {
        console.error('[ERROR]', error.message);
    } finally {
        await connection.end();
    }
}

fixArvore().catch(console.error);
