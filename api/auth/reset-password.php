<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once '../config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Método não permitido']);
    exit;
}

// Get input
$input = json_decode(file_get_contents('php://input'), true);
$token = trim($input['token'] ?? '');
$newPassword = $input['password'] ?? '';

// Validate input
if (empty($token)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Token não fornecido']);
    exit;
}

if (empty($newPassword) || strlen($newPassword) < 6) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Senha deve ter no mínimo 6 caracteres']);
    exit;
}

try {
    // Connect to database
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    if ($conn->connect_error) {
        throw new Exception("Erro de conexão: " . $conn->connect_error);
    }

    $conn->set_charset("utf8mb4");

    // Find valid token
    $stmt = $conn->prepare("
        SELECT t.id, t.user_id, t.expires_at, t.used, u.username
        FROM password_reset_tokens t
        INNER JOIN users u ON t.user_id = u.id
        WHERE t.token = ?
    ");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Token inválido']);
        $stmt->close();
        $conn->close();
        exit;
    }

    $tokenData = $result->fetch_assoc();
    $stmt->close();

    // Check if token is already used
    if ($tokenData['used']) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Este token já foi utilizado']);
        $conn->close();
        exit;
    }

    // Check if token is expired
    $now = new DateTime();
    $expiresAt = new DateTime($tokenData['expires_at']);

    if ($now > $expiresAt) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => 'Token expirado. Solicite um novo reset de senha']);
        $conn->close();
        exit;
    }

    // Hash new password
    $passwordHash = password_hash($newPassword, PASSWORD_DEFAULT);

    // Begin transaction
    $conn->begin_transaction();

    try {
        // Update user password
        $updateStmt = $conn->prepare("UPDATE users SET password_hash = ? WHERE id = ?");
        $updateStmt->bind_param("si", $passwordHash, $tokenData['user_id']);

        if (!$updateStmt->execute()) {
            throw new Exception("Erro ao atualizar senha");
        }
        $updateStmt->close();

        // Mark token as used
        $markStmt = $conn->prepare("UPDATE password_reset_tokens SET used = TRUE WHERE id = ?");
        $markStmt->bind_param("i", $tokenData['id']);

        if (!$markStmt->execute()) {
            throw new Exception("Erro ao marcar token como usado");
        }
        $markStmt->close();

        // Commit transaction
        $conn->commit();

        echo json_encode([
            'success' => true,
            'message' => 'Senha resetada com sucesso! Você pode fazer login agora.'
        ]);

    } catch (Exception $e) {
        // Rollback on error
        $conn->rollback();
        throw $e;
    }

    $conn->close();

} catch (Exception $e) {
    error_log("Erro em reset-password.php: " . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Erro ao processar solicitação'
    ]);
}
?>
