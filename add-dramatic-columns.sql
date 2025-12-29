-- Adicionar colunas de mensagens dramáticas à tabela locations

-- Verificar e adicionar dramatic_messages
ALTER TABLE `locations`
ADD COLUMN IF NOT EXISTS `dramatic_messages` LONGTEXT NULL DEFAULT NULL
COMMENT 'Mensagens dramáticas antes do vídeo (uma por linha)'
AFTER `transition_video`;

-- Verificar e adicionar dramatic_message_duration
ALTER TABLE `locations`
ADD COLUMN IF NOT EXISTS `dramatic_message_duration` INT(5) NULL DEFAULT 5
COMMENT 'Duração de cada mensagem em segundos'
AFTER `dramatic_messages`;

-- Concluído!
SELECT 'Colunas adicionadas com sucesso!' AS status;
