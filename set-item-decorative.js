const mysql = require('mysql2/promise');

async function setItemDecorative() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u811529511_vobadmin',
        password: 'Italia2018!123',
        database: 'u811529511_voblitus'
    });

    console.log('🔧 Definindo item como decorativo...\n');

    try {
        // Listar itens disponíveis
        const [items] = await connection.execute(
            `SELECT location_id, item_id, is_decorative
             FROM hotspots
             WHERE type = 'item'
             ORDER BY location_id`
        );

        console.log('📋 Itens disponíveis:\n');
        items.forEach((item, index) => {
            console.log(`${index + 1}. ${item.location_id} - ${item.item_id} (decorativo: ${item.is_decorative || 0})`);
        });

        console.log('\n❓ Qual item você quer marcar como decorativo?');
        console.log('   Digite o número do item (1-' + items.length + '):\n');

        // Para teste, vamos marcar o primeiro item
        const itemIndex = 0; // Você pode mudar isso
        const selectedItem = items[itemIndex];

        console.log(`✓ Selecionado: ${selectedItem.location_id} - ${selectedItem.item_id}\n`);

        // Atualizar para decorativo
        await connection.execute(
            `UPDATE hotspots
             SET is_decorative = 1
             WHERE location_id = ? AND item_id = ? AND type = 'item'`,
            [selectedItem.location_id, selectedItem.item_id]
        );

        console.log('✅ Item marcado como decorativo!');
        console.log(`   Location: ${selectedItem.location_id}`);
        console.log(`   Item: ${selectedItem.item_id}`);
        console.log(`   is_decorative: 1\n`);

        console.log('🎮 Agora:');
        console.log('   1. Dê F5 no jogo');
        console.log('   2. O item NÃO deve ser coletável');
        console.log('   3. Se for GIF, deve animar\n');

        // Verificar
        const [updated] = await connection.execute(
            `SELECT is_decorative FROM hotspots
             WHERE location_id = ? AND item_id = ?`,
            [selectedItem.location_id, selectedItem.item_id]
        );

        console.log('📊 Verificação: is_decorative =', updated[0].is_decorative);

    } catch (error) {
        console.error('❌ Erro:', error.message);
    } finally {
        await connection.end();
    }
}

setItemDecorative().catch(console.error);
