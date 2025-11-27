/**
 * Phaser Game Configuration
 * Configuração principal e inicialização do jogo
 */


// Configuração do Phaser
const config = {
    type: Phaser.AUTO,
    parent: 'game-container',
    width: 1280,
    height: 720,
    backgroundColor: '#000000',
    scale: {
        mode: Phaser.Scale.RESIZE,
        autoCenter: Phaser.Scale.CENTER_BOTH
    },
    dom: {
        createContainer: true
    },
    scene: [BootScene, LocationScene]
};

// Inicializar jogo
let game;

async function initGame() {

    // PRIMEIRO: Carregar dados do banco de dados
    try {
        await databaseLoader.loadGameData();
    } catch (error) {
        console.error('❌ Erro ao carregar do banco, usando map.js como fallback');
    }

    // DEPOIS: Inicializar Phaser
    game = new Phaser.Game(config);
    window.game = game;
}

// Iniciar quando página carregar
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initGame);
} else {
    initGame();
}
