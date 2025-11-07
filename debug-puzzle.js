// Debug script - Cole no console do navegador
console.log('=== DEBUG PUZZLE ===');

// 1. Verificar se o databaseLoader existe e tem dados
if (typeof databaseLoader !== 'undefined') {
    console.log('✓ databaseLoader exists');
    console.log('Locations loaded:', Object.keys(databaseLoader.gameMap).length);

    // Encontrar locations com puzzle
    const locationsWithPuzzle = Object.entries(databaseLoader.gameMap)
        .filter(([id, loc]) => loc.puzzle)
        .map(([id, loc]) => ({
            id,
            name: loc.name,
            puzzleType: loc.puzzle?.type,
            puzzleQuestion: loc.puzzle?.question
        }));

    console.log('Locations com puzzle:', locationsWithPuzzle);

    // Mostrar dados do puzzle da location atual
    if (typeof game !== 'undefined' && game.scene && game.scene.scenes[1]) {
        const scene = game.scene.scenes[1];
        const currentLoc = scene.currentLocation;
        console.log('Current location:', currentLoc);

        const locData = databaseLoader.getLocation(currentLoc);
        console.log('Location data:', locData);
        console.log('Puzzle data:', locData?.puzzle);
    }
} else {
    console.error('❌ databaseLoader not found');
}

// 2. Verificar UIManager
if (typeof uiManager !== 'undefined') {
    console.log('✓ uiManager exists');
    console.log('Active puzzle context:', uiManager.activePuzzleContext);
} else {
    console.error('❌ uiManager not found');
}

// 3. Verificar elementos do puzzle overlay
const overlay = document.getElementById('puzzle-overlay');
console.log('Puzzle overlay element:', overlay);
if (overlay) {
    console.log('Puzzle overlay display:', overlay.style.display);
    console.log('Puzzle overlay classList:', overlay.classList);
}

// 4. Função helper para testar abertura manual
window.debugOpenPuzzle = function(locationId) {
    const locData = databaseLoader.getLocation(locationId);
    if (!locData || !locData.puzzle) {
        console.error('Location não tem puzzle:', locationId);
        return;
    }

    console.log('Tentando abrir puzzle:', locData.puzzle);

    if (uiManager && typeof uiManager.openPuzzleDialog === 'function') {
        uiManager.openPuzzleDialog(locData.puzzle, {
            onSubmit: (payload) => {
                console.log('Submit payload:', payload);
                return { success: false, message: 'Teste - não enviado' };
            }
        });
    } else {
        console.error('uiManager.openPuzzleDialog não encontrado');
    }
};

console.log('=== FIM DEBUG ===');
console.log('Para testar manualmente: debugOpenPuzzle("location_id")');
