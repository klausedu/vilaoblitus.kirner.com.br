<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

require_once '../config.php';

try {
    $pdo = getDBConnection();

    $input = file_get_contents('php://input');
    $data = json_decode($input, true);

    // Validar campos obrigatórios
    if (!isset($data['name']) || trim($data['name']) === '') {
        sendResponse(false, null, 'Nome é obrigatório');
    }

    if (!isset($data['email']) || trim($data['email']) === '') {
        sendResponse(false, null, 'Email é obrigatório');
    }

    // Validar formato de email
    $email = filter_var(trim($data['email']), FILTER_VALIDATE_EMAIL);
    if (!$email) {
        sendResponse(false, null, 'Email inválido');
    }

    $name = trim($data['name']);
    $age = isset($data['age']) && is_numeric($data['age']) ? (int)$data['age'] : null;
    $city = isset($data['city']) ? trim($data['city']) : null;
    $phone = isset($data['phone']) ? trim($data['phone']) : null;
    $bookSource = isset($data['book_source']) ? trim($data['book_source']) : null;

    // Verificar se email já existe
    $stmt = $pdo->prepare("SELECT id FROM waitlist WHERE email = ?");
    $stmt->execute([$email]);
    $existing = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($existing) {
        sendResponse(false, null, 'Este email já está cadastrado na lista de espera!');
    }

    // Inserir na waitlist
    $stmt = $pdo->prepare("
        INSERT INTO waitlist (name, email, age, city, phone, book_source)
        VALUES (?, ?, ?, ?, ?, ?)
    ");

    $stmt->execute([$name, $email, $age, $city, $phone, $bookSource]);

    // Log para debug
    error_log("✅ Nova inscrição na waitlist: $name ($email)");

    sendResponse(true, [
        'id' => $pdo->lastInsertId(),
        'name' => $name,
        'email' => $email
    ], 'Cadastro realizado com sucesso! Você receberá um email quando o jogo estiver disponível.');

} catch (PDOException $e) {
    error_log("❌ Erro ao cadastrar na waitlist: " . $e->getMessage());
    sendResponse(false, null, 'Erro ao processar cadastro. Tente novamente mais tarde.', 500);
} catch (Exception $e) {
    error_log("❌ Erro inesperado: " . $e->getMessage());
    sendResponse(false, null, 'Erro inesperado. Tente novamente mais tarde.', 500);
}
