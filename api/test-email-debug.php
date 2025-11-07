<?php
/**
 * Script de teste com debug inline (sem error_log)
 * Acesse: /api/test-email-debug.php?to=seu@email.com
 */

require_once 'config.php';

// Array para armazenar logs
$logs = [];

function debugLog($message) {
    global $logs;
    $logs[] = $message;
    echo "<p style='margin: 5px 0; padding: 5px; background: #f0f0f0; border-left: 3px solid #666; font-family: monospace; font-size: 12px;'>$message</p>";
    flush();
}

// Verificar parâmetro 'to'
$toEmail = $_GET['to'] ?? '';

if (empty($toEmail)) {
    die("<h1>❌ Erro</h1><p>Uso: test-email-debug.php?to=seu@email.com</p>");
}

echo "<html><head><meta charset='UTF-8'><style>body{font-family:Arial;padding:20px;background:#f5f5f5;}h1,h2,h3{color:#333;}.success{color:green;}.error{color:red;}.info{color:blue;}</style></head><body>";

echo "<h1>🧪 Teste de Envio de Email (Debug Mode)</h1>";
echo "<hr>";

echo "<h2>Configurações SMTP:</h2>";
echo "<ul>";
echo "<li><strong>SMTP_HOST:</strong> " . SMTP_HOST . "</li>";
echo "<li><strong>SMTP_PORT:</strong> " . SMTP_PORT . "</li>";
echo "<li><strong>SMTP_USER:</strong> " . SMTP_USER . "</li>";
echo "<li><strong>SMTP_PASS:</strong> " . (!empty(SMTP_PASS) ? "✅ Configurado (" . strlen(SMTP_PASS) . " caracteres)" : "❌ NÃO CONFIGURADO") . "</li>";
echo "<li><strong>SMTP_SECURE:</strong> " . SMTP_SECURE . "</li>";
echo "<li><strong>EMAIL_FROM:</strong> " . EMAIL_FROM . "</li>";
echo "<li><strong>EMAIL_FROM_NAME:</strong> " . EMAIL_FROM_NAME . "</li>";
echo "</ul>";
echo "<hr>";

if (empty(SMTP_PASS)) {
    echo "<h2 class='error'>❌ Erro: SMTP_PASS não configurado</h2>";
    echo "<p>Configure a senha SMTP no arquivo <code>api/config.php</code></p>";
    exit;
}

echo "<h2>📧 Enviando email de teste para: <strong>$toEmail</strong></h2>";
echo "<h3>Logs detalhados:</h3>";
flush();

// ========================================
// INLINE EMAIL SENDING (sem usar email_helper.php)
// ========================================

try {
    debugLog("🔵 Validando email destinatário...");
    if (!filter_var($toEmail, FILTER_VALIDATE_EMAIL)) {
        debugLog("❌ Email inválido: $toEmail");
        throw new Exception("Email inválido");
    }
    debugLog("✅ Email válido");

    $smtpServer = (SMTP_SECURE == 'ssl' ? 'ssl://' : '') . SMTP_HOST;
    debugLog("🔵 Conectando a: $smtpServer:" . SMTP_PORT);

    // Verificar se a extensão openssl está habilitada
    if (!extension_loaded('openssl')) {
        debugLog("❌ Extensão OpenSSL não está habilitada no PHP!");
        throw new Exception("OpenSSL não habilitado");
    }
    debugLog("✅ OpenSSL habilitado");

    // Conectar ao servidor SMTP
    $errno = 0;
    $errstr = '';
    $smtpConn = @fsockopen(
        $smtpServer,
        SMTP_PORT,
        $errno,
        $errstr,
        30
    );

    if (!$smtpConn) {
        debugLog("❌ Erro ao conectar: $errstr (código: $errno)");
        throw new Exception("Falha na conexão: $errstr ($errno)");
    }
    debugLog("✅ Conectado ao servidor SMTP");

    // Função auxiliar para ler resposta
    function getResponse($conn) {
        $response = '';
        while ($line = fgets($conn, 515)) {
            $response .= $line;
            if (substr($line, 3, 1) == ' ') break;
        }
        return trim($response);
    }

    // Ler resposta inicial (220)
    $response = getResponse($smtpConn);
    debugLog("🔵 Resposta inicial: $response");
    if (substr($response, 0, 3) != '220') {
        debugLog("❌ Resposta inesperada do servidor");
        throw new Exception("Servidor retornou: $response");
    }

    // EHLO
    $serverName = $_SERVER['SERVER_NAME'] ?? 'localhost';
    fputs($smtpConn, "EHLO $serverName\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 EHLO: $response");

    // AUTH LOGIN
    fputs($smtpConn, "AUTH LOGIN\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 AUTH LOGIN: $response");

    if (substr($response, 0, 3) != '334') {
        debugLog("❌ Servidor não aceitou AUTH LOGIN");
        throw new Exception("AUTH LOGIN falhou: $response");
    }

    // Username
    fputs($smtpConn, base64_encode(SMTP_USER) . "\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 Username enviado: $response");

    if (substr($response, 0, 3) != '334') {
        debugLog("❌ Username rejeitado");
        throw new Exception("Username falhou: $response");
    }

    // Password
    fputs($smtpConn, base64_encode(SMTP_PASS) . "\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 Password enviado: $response");

    if (substr($response, 0, 3) != '235') {
        debugLog("❌ Autenticação falhou! Verifique SMTP_USER e SMTP_PASS");
        debugLog("❌ User usado: " . SMTP_USER);
        debugLog("❌ Pass length: " . strlen(SMTP_PASS));
        throw new Exception("Autenticação falhou: $response");
    }
    debugLog("✅ Autenticação bem-sucedida!");

    // MAIL FROM
    fputs($smtpConn, "MAIL FROM: <" . EMAIL_FROM . ">\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 MAIL FROM: $response");

    if (substr($response, 0, 3) != '250') {
        throw new Exception("MAIL FROM falhou: $response");
    }

    // RCPT TO
    fputs($smtpConn, "RCPT TO: <$toEmail>\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 RCPT TO: $response");

    if (substr($response, 0, 3) != '250') {
        throw new Exception("RCPT TO falhou: $response");
    }

    // DATA
    fputs($smtpConn, "DATA\r\n");
    $response = getResponse($smtpConn);
    debugLog("🔵 DATA: $response");

    if (substr($response, 0, 3) != '354') {
        throw new Exception("DATA falhou: $response");
    }

    // Montar mensagem
    $subject = "Teste de Email - Vila Abandonada";
    $message = "From: " . EMAIL_FROM_NAME . " <" . EMAIL_FROM . ">\r\n";
    $message .= "To: Teste <$toEmail>\r\n";
    $message .= "Subject: =?UTF-8?B?" . base64_encode($subject) . "?=\r\n";
    $message .= "MIME-Version: 1.0\r\n";
    $message .= "Content-Type: text/html; charset=UTF-8\r\n";
    $message .= "Content-Transfer-Encoding: 8bit\r\n";
    $message .= "\r\n";
    $message .= "<html><body><h1>Email de Teste</h1><p>Funcionou! " . date('d/m/Y H:i:s') . "</p></body></html>";
    $message .= "\r\n.\r\n";

    debugLog("🔵 Enviando mensagem...");
    fputs($smtpConn, $message);
    $response = getResponse($smtpConn);
    debugLog("🔵 Resposta envio: $response");

    if (substr($response, 0, 3) != '250') {
        throw new Exception("Envio falhou: $response");
    }

    // QUIT
    fputs($smtpConn, "QUIT\r\n");
    fclose($smtpConn);

    debugLog("✅ Email enviado com sucesso!");
    echo "<hr><h2 class='success'>✅ Email enviado com sucesso!</h2>";
    echo "<p>Verifique sua caixa de entrada (e spam): <strong>$toEmail</strong></p>";

} catch (Exception $e) {
    echo "<hr><h2 class='error'>❌ Erro ao enviar email</h2>";
    echo "<p class='error'><strong>Mensagem:</strong> " . htmlspecialchars($e->getMessage()) . "</p>";
}

echo "<hr><p><a href='?to=$toEmail'>🔄 Tentar novamente</a></p>";
echo "</body></html>";
?>
