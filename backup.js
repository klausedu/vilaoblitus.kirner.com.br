const mysql = require('mysql2/promise');
const fs = require('fs').promises;
const { exec } = require('child_process');
const { promisify } = require('util');
const execAsync = promisify(exec);

// Data formatada: YYYY-MM-DD_HH-MM-SS
const now = new Date();
const dateStr = now.toISOString()
    .replace(/T/, '_')
    .replace(/:/g, '-')
    .replace(/\..+/, '');

const backupDir = `C:\\src\\codex.oblitus\\backups\\${dateStr}`;
const sqlFile = `${backupDir}\\database_backup.sql`;
const zipFile = `C:\\src\\codex.oblitus\\backups\\codex_oblitus_${dateStr}.zip`;

async function createBackup() {
    console.log('🗂️ Criando backup versionado:', dateStr);

    try {
        // Criar diretório de backup
        await fs.mkdir(backupDir, { recursive: true });
        console.log('✅ Diretório criado:', backupDir);

        // 1. Backup do banco de dados MySQL
        console.log('📊 Fazendo backup do banco de dados...');

        const connection = await mysql.createConnection({
            host: 'srv1364.hstgr.io',
            user: 'u811529511_vobadmin',
            password: 'Italia2018!123',
            database: 'u811529511_voblitus'
        });

        // Pegar todas as tabelas
        const [tables] = await connection.execute('SHOW TABLES');

        let sqlDump = '-- Backup do banco de dados\\n';
        sqlDump += `-- Data: ${now.toISOString()}\\n\\n`;
        sqlDump += 'SET FOREIGN_KEY_CHECKS=0;\\n\\n';

        for (const table of tables) {
            const tableName = Object.values(table)[0];
            console.log(`  📋 Exportando tabela: ${tableName}`);

            // DROP TABLE
            sqlDump += `DROP TABLE IF EXISTS \`${tableName}\`;\\n`;

            // CREATE TABLE
            const [createTable] = await connection.execute(`SHOW CREATE TABLE \`${tableName}\``);
            sqlDump += createTable[0]['Create Table'] + ';\\n\\n';

            // INSERT DATA
            const [rows] = await connection.execute(`SELECT * FROM \`${tableName}\``);
            if (rows.length > 0) {
                for (const row of rows) {
                    const values = Object.values(row).map(v => {
                        if (v === null) return 'NULL';
                        if (typeof v === 'string') return `'${v.replace(/'/g, "''")}'`;
                        return v;
                    }).join(', ');

                    sqlDump += `INSERT INTO \`${tableName}\` VALUES (${values});\\n`;
                }
                sqlDump += '\\n';
            }
        }

        sqlDump += 'SET FOREIGN_KEY_CHECKS=1;\\n';

        await fs.writeFile(sqlFile, sqlDump);
        await connection.end();
        console.log('✅ Backup do banco salvo:', sqlFile);

        // 2. Criar ZIP com arquivos do projeto
        console.log('📦 Criando arquivo ZIP...');

        // Usar script PowerShell para criar ZIP
        await execAsync(`powershell -ExecutionPolicy Bypass -File create-backup-zip.ps1 -zipFile "${zipFile}" -backupDir "${backupDir}"`, { cwd: 'C:\\src\\codex.oblitus' });

        // 3. Estatísticas
        const stats = await fs.stat(zipFile);
        const sizeMB = (stats.size / 1024 / 1024).toFixed(2);

        console.log('\\n🎉 BACKUP CONCLUÍDO!');
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
        console.log('📅 Data:', dateStr);
        console.log('💾 Tamanho:', sizeMB, 'MB');
        console.log('📁 Localização:', zipFile);
        console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    } catch (error) {
        console.error('❌ Erro ao criar backup:', error.message);
        throw error;
    }
}

createBackup();
