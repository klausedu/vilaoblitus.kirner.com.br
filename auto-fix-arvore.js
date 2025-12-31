#!/usr/bin/env node
/**
 * Auto-fix: Garante que árvore sempre tenha valores corretos
 * Execute automaticamente antes de abrir o editor
 */

const mysql = require('mysql2/promise');

async function autoFixArvore() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    try {
        // Verificar estado atual
        const [rows] = await connection.execute(`
            SELECT display_image, is_decorative
            FROM hotspots
            WHERE item_id = 'arvore'
        `);

        if (rows.length === 0) {
            console.log('[INFO] Item arvore não encontrado no banco');
            return;
        }

        const current = rows[0];
        const needsFix = !current.display_image || current.is_decorative !== 1;

        if (needsFix) {
            console.log('[FIX] Corrigindo arvore...');
            await connection.execute(`
                UPDATE hotspots
                SET display_image = 'images/objects/arvore01_spritesheet.png',
                    is_decorative = 1
                WHERE item_id = 'arvore'
            `);
            console.log('[OK] Árvore corrigida automaticamente!');
        } else {
            console.log('[OK] Árvore já está correta');
        }

    } catch (error) {
        console.error('[ERROR]', error.message);
    } finally {
        await connection.end();
    }
}

autoFixArvore().catch(console.error);
