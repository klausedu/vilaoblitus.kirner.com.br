const mysql = require('mysql2/promise');

async function checkConnections() {
    const connection = await mysql.createConnection({
        host: 'srv1364.hstgr.io',
        user: 'u181238044_kirner',
        password: 'Italia2018!123',
        database: 'u181238044_codexoblitus'
    });

    console.log('🔗 Verificando conexões para casa_abandonada_02_frente e casa_abandonada_02_sala...\n');

    // Buscar hotspots de navegação para casa_abandonada_02_frente
    const [frente] = await connection.execute(`
        SELECT id, location_id, type, label, target_location, arrow_direction
        FROM hotspots
        WHERE location_id = 'casa_abandonada_02_frente' AND type = 'navigation'
        ORDER BY id
    `);

    console.log('📍 Hotspots de navegação em casa_abandonada_02_frente:');
    frente.forEach(h => {
        console.log(`  - ${h.label} → ${h.target_location} (arrow: ${h.arrow_direction || 'nenhuma'})`);
    });

    // Buscar hotspots de navegação para casa_abandonada_02_sala
    const [sala] = await connection.execute(`
        SELECT id, location_id, type, label, target_location, arrow_direction
        FROM hotspots
        WHERE location_id = 'casa_abandonada_02_sala' AND type = 'navigation'
        ORDER BY id
    `);

    console.log('\n📍 Hotspots de navegação em casa_abandonada_02_sala:');
    sala.forEach(h => {
        console.log(`  - ${h.label} → ${h.target_location} (arrow: ${h.arrow_direction || 'nenhuma'})`);
    });

    // Verificar se há conexão bidirecional
    const frenteToSala = frente.find(h => h.target_location === 'casa_abandonada_02_sala');
    const salaToFrente = sala.find(h => h.target_location === 'casa_abandonada_02_frente');

    console.log('\n🔍 Análise de conexão:');
    console.log(`  casa_abandonada_02_frente → casa_abandonada_02_sala: ${frenteToSala ? '✅ SIM' : '❌ NÃO'}`);
    console.log(`  casa_abandonada_02_sala → casa_abandonada_02_frente: ${salaToFrente ? '✅ SIM' : '❌ NÃO'}`);

    await connection.end();
}

checkConnections().catch(console.error);
