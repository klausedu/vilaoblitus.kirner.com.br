-- Verificar quais location_ids dos hotspots não existem na tabela locations

-- Localizações únicas necessárias pelos hotspots do backup:
SELECT DISTINCT location_id FROM (
    SELECT 'floresta' as location_id UNION ALL
    SELECT 'portao_entrada' UNION ALL
    SELECT 'rua_vila' UNION ALL
    SELECT 'casa_abandonada_01_frente' UNION ALL
    SELECT 'casa_abandonada_02_cozinha' UNION ALL
    SELECT 'casa_abandonada_02_sala' UNION ALL
    SELECT 'casa_abandonada_01_porta_entrada' UNION ALL
    SELECT 'casa_abandonada_01_quarto' UNION ALL
    SELECT 'casa_abandonada_01_sala' UNION ALL
    SELECT 'casa_abandonada_02_frente' UNION ALL
    SELECT 'casa_abandonada_02_porta_entrada' UNION ALL
    SELECT 'casa_abandonada_02_quintal' UNION ALL
    SELECT 'cemiterio_dentro' UNION ALL
    SELECT 'cemiterio_entrada' UNION ALL
    SELECT 'cemiterio_mausoleo_dentro' UNION ALL
    SELECT 'cemiterio_mausoleo_frente' UNION ALL
    SELECT 'igreja_dentro' UNION ALL
    SELECT 'igreja_frente' UNION ALL
    SELECT 'igreja_fundos' UNION ALL
    SELECT 'igreja_sinos' UNION ALL
    SELECT 'poco_profundo' UNION ALL
    SELECT 'portao_entrada_fechado' UNION ALL
    SELECT 'portao_saida' UNION ALL
    SELECT 'portao_saida_aberto' UNION ALL
    SELECT 'portao_saida_cadeado' UNION ALL
    SELECT 'portao_saida_end' UNION ALL
    SELECT 'praca_central' UNION ALL
    SELECT 'rua_final'
) AS backup_locations
WHERE location_id NOT IN (SELECT id FROM locations)
ORDER BY location_id;

-- Se retornar vazio, todas as localizações existem e você pode usar restore-hotspots-safe.sql
-- Se retornar algo, essas localizações precisam ser criadas primeiro
