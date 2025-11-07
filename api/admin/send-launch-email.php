<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Authorization');

require_once '../config.php';
require_once '../email_helper.php';

// Verificar autenticação admin
$headers = getallheaders();
$authHeader = $headers['Authorization'] ?? '';

if (empty($authHeader) || !preg_match('/Bearer\s+(.*)$/i', $authHeader, $matches)) {
    http_response_code(401);
    echo json_encode(['success' => false, 'message' => 'Token não fornecido']);
    exit;
}

$token = $matches[1];

// Get input
$input = json_decode(file_get_contents('php://input'), true);
$userIds = $input['user_ids'] ?? [];

if (empty($userIds) || !is_array($userIds)) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => 'Lista de IDs não fornecida']);
    exit;
}

try {
    // Conectar ao banco
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

    if ($conn->connect_error) {
        throw new Exception("Erro de conexão: " . $conn->connect_error);
    }

    $conn->set_charset("utf8mb4");

    // Verificar se o token é válido e se é admin
    $stmt = $conn->prepare("
        SELECT u.id, u.username, u.is_admin
        FROM user_sessions s
        INNER JOIN users u ON s.user_id = u.id
        WHERE s.session_token = ? AND s.expires_at > NOW()
    ");

    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        http_response_code(401);
        echo json_encode(['success' => false, 'message' => 'Sessão inválida ou expirada']);
        $stmt->close();
        $conn->close();
        exit;
    }

    $user = $result->fetch_assoc();
    $stmt->close();

    if (!$user['is_admin']) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Acesso negado. Apenas administradores.']);
        $conn->close();
        exit;
    }

    // Buscar usuários selecionados que ainda não foram notificados
    $placeholders = str_repeat('?,', count($userIds) - 1) . '?';
    $stmt = $conn->prepare("
        SELECT id, name, email
        FROM waitlist
        WHERE id IN ($placeholders) AND notified = FALSE
    ");

    // Bind parameters dinamicamente
    $types = str_repeat('i', count($userIds));
    $stmt->bind_param($types, ...$userIds);
    $stmt->execute();
    $result = $stmt->get_result();

    $recipients = [];
    while ($row = $result->fetch_assoc()) {
        $recipients[] = $row;
    }

    $stmt->close();

    if (empty($recipients)) {
        echo json_encode([
            'success' => false,
            'message' => 'Nenhum inscrito pendente encontrado para os IDs selecionados'
        ]);
        $conn->close();
        exit;
    }

    error_log("🔵 [LAUNCH-EMAIL] Iniciando envio de emails de lançamento para " . count($recipients) . " usuários");

    // Verificar se SMTP está configurado
    if (empty(SMTP_PASS)) {
        error_log("❌ [LAUNCH-EMAIL] SMTP_PASS não configurado");
        echo json_encode([
            'success' => false,
            'message' => 'SMTP não configurado. Configure SMTP_PASS no config.php'
        ]);
        $conn->close();
        exit;
    }

    // Enviar emails
    $sent = 0;
    $failed = 0;
    $sentIds = [];

    foreach ($recipients as $recipient) {
        try {
            $subject = "🎮 Vila Abandonada Está Disponível!";
            $body = getLaunchEmailTemplate($recipient['name']);

            error_log("🔵 [LAUNCH-EMAIL] Enviando para: {$recipient['email']}");

            $emailSent = sendEmail($recipient['email'], $recipient['name'], $subject, $body);

            if ($emailSent) {
                $sent++;
                $sentIds[] = $recipient['id'];
                error_log("✅ [LAUNCH-EMAIL] Email enviado para: {$recipient['email']}");
            } else {
                $failed++;
                error_log("❌ [LAUNCH-EMAIL] Falha ao enviar para: {$recipient['email']}");
            }

            // Pequeno delay entre envios para não sobrecarregar o servidor SMTP
            usleep(500000); // 0.5 segundos

        } catch (Exception $e) {
            $failed++;
            error_log("❌ [LAUNCH-EMAIL] Erro ao enviar para {$recipient['email']}: " . $e->getMessage());
        }
    }

    // Marcar como notificados os que foram enviados com sucesso
    if (!empty($sentIds)) {
        $placeholders = str_repeat('?,', count($sentIds) - 1) . '?';
        $updateStmt = $conn->prepare("
            UPDATE waitlist
            SET notified = TRUE
            WHERE id IN ($placeholders)
        ");

        $types = str_repeat('i', count($sentIds));
        $updateStmt->bind_param($types, ...$sentIds);
        $updateStmt->execute();
        $updateStmt->close();

        error_log("✅ [LAUNCH-EMAIL] Marcados como notificados: " . implode(', ', $sentIds));
    }

    $conn->close();

    error_log("✅ [LAUNCH-EMAIL] Processo finalizado - Enviados: $sent, Falhas: $failed");

    echo json_encode([
        'success' => true,
        'message' => "Emails enviados com sucesso!",
        'sent' => $sent,
        'failed' => $failed,
        'total' => count($recipients)
    ]);

} catch (Exception $e) {
    error_log("Erro em admin/send-launch-email.php: " . $e->getMessage());
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Erro ao enviar emails'
    ]);
}
?>
