<?php
/**
 * API: Delete a location
 * Cascades to delete hotspots and connections
 */

header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: DELETE, POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once '../config.php';

// Get database connection
$pdo = getDBConnection();

// Get location ID from query or JSON body
$locationId = $_GET['id'] ?? null;

if (!$locationId) {
    $input = json_decode(file_get_contents('php://input'), true);
    $locationId = $input['id'] ?? null;
}

if (!$locationId) {
    http_response_code(400);
    sendResponse(false, null, 'Location ID is required');
}

try {
    // Check if location exists
    $checkStmt = $pdo->prepare("SELECT id, name FROM locations WHERE id = ?");
    $checkStmt->execute([$locationId]);
    $location = $checkStmt->fetch(PDO::FETCH_ASSOC);

    if (!$location) {
        http_response_code(404);
        sendResponse(false, null, 'Location not found');
    }

    // Delete location (cascades to hotspots and connections)
    $stmt = $pdo->prepare("DELETE FROM locations WHERE id = ?");
    $stmt->execute([$locationId]);

    sendResponse(true, [
        'deleted_id' => $locationId,
        'deleted_name' => $location['name']
    ], 'Location deleted successfully');

} catch (PDOException $e) {
    http_response_code(500);
    sendResponse(false, null, 'Database error: ' . $e->getMessage());
}
