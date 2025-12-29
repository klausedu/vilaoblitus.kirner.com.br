-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 25, 2025 at 03:38 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u811529511_voblitus`
--

-- --------------------------------------------------------

--
-- Table structure for table `connections`
--

CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `from_location` varchar(50) NOT NULL,
  `to_location` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `connections`
--

INSERT INTO `connections` (`id`, `from_location`, `to_location`, `created_at`) VALUES
(3, 'portao_entrada', 'floresta', '2025-11-04 12:20:35'),
(8, 'praca_central', 'rua_vila', '2025-11-04 12:20:35'),
(11, 'poco_profundo', 'praca_central', '2025-11-04 12:20:35'),
(12, 'casa_abandonada_01_frente', 'rua_vila', '2025-11-04 12:20:35'),
(16, 'casa_abandonada_01_quarto', 'casa_abandonada_01_sala', '2025-11-04 12:20:35'),
(17, 'casa_abandonada_02_frente', 'rua_vila', '2025-11-04 12:20:35'),
(20, 'portao_entrada_fechado', 'rua_vila', '2025-11-04 12:20:35'),
(21, 'casa_abandonada_01_porta_entrada', 'casa_abandonada_01_sala', '2025-11-04 12:20:35'),
(22, 'casa_abandonada_01_porta_entrada', 'casa_abandonada_01_frente', '2025-11-04 12:20:35'),
(24, 'casa_abandonada_02_porta_entrada', 'casa_abandonada_02_frente', '2025-11-04 12:20:35'),
(25, 'casa_abandonada_02_sala', 'casa_abandonada_02_porta_entrada', '2025-11-04 12:20:35'),
(27, 'casa_abandonada_02_cozinha', 'casa_abandonada_02_quintal', '2025-11-04 12:20:35'),
(28, 'casa_abandonada_02_cozinha', 'casa_abandonada_02_sala', '2025-11-04 12:20:35'),
(32, 'rua_final', 'praca_central', '2025-11-04 12:20:35'),
(33, 'portao_saida', 'rua_final', '2025-11-04 12:20:35'),
(35, 'cemiterio_entrada', 'rua_final', '2025-11-04 12:20:35'),
(38, 'cemiterio_dentro', 'cemiterio_entrada', '2025-11-04 12:20:35'),
(39, 'cemiterio_mausoleo_frente', 'cemiterio_dentro', '2025-11-04 12:20:35'),
(41, 'cemiterio_mausoleo_dentro', 'cemiterio_mausoleo_frente', '2025-11-04 12:20:35'),
(42, 'portao_saida_cadeado', 'portao_saida', '2025-11-04 12:20:35'),
(45, 'igreja_dentro', 'igreja_frente', '2025-11-04 12:20:35'),
(46, 'igreja_fundos', 'igreja_frente', '2025-11-04 12:20:35'),
(48, 'igreja_sinos', 'igreja_fundos', '2025-11-04 12:20:35'),
(49, 'floresta', 'portao_entrada', '2025-11-04 17:45:34'),
(50, 'portao_entrada', 'rua_vila', '2025-11-04 17:45:34'),
(52, 'rua_vila', 'portao_entrada_fechado', '2025-11-04 17:45:34'),
(53, 'rua_vila', 'praca_central', '2025-11-04 17:45:34'),
(54, 'rua_vila', 'casa_abandonada_02_frente', '2025-11-04 17:45:34'),
(55, 'rua_vila', 'casa_abandonada_01_frente', '2025-11-04 17:45:34'),
(57, 'praca_central', 'poco_profundo', '2025-11-04 17:45:34'),
(58, 'praca_central', 'rua_final', '2025-11-04 17:45:34'),
(61, 'casa_abandonada_01_frente', 'casa_abandonada_01_porta_entrada', '2025-11-04 17:45:34'),
(62, 'casa_abandonada_01_sala', 'casa_abandonada_01_porta_entrada', '2025-11-04 17:45:34'),
(63, 'casa_abandonada_01_sala', 'casa_abandonada_01_quarto', '2025-11-04 17:45:34'),
(66, 'casa_abandonada_02_frente', 'casa_abandonada_02_porta_entrada', '2025-11-04 17:45:34'),
(67, 'casa_abandonada_02_quintal', 'casa_abandonada_02_cozinha', '2025-11-04 17:45:34'),
(71, 'casa_abandonada_02_porta_entrada', 'casa_abandonada_02_sala', '2025-11-04 17:45:34'),
(74, 'casa_abandonada_02_sala', 'casa_abandonada_02_cozinha', '2025-11-04 17:45:34'),
(77, 'rua_final', 'igreja_frente', '2025-11-04 17:45:34'),
(78, 'rua_final', 'cemiterio_entrada', '2025-11-04 17:45:34'),
(79, 'rua_final', 'portao_saida', '2025-11-04 17:45:34'),
(82, 'portao_saida', 'portao_saida_cadeado', '2025-11-04 17:45:34'),
(84, 'cemiterio_entrada', 'cemiterio_dentro', '2025-11-04 17:45:34'),
(88, 'cemiterio_mausoleo_frente', 'cemiterio_mausoleo_dentro', '2025-11-04 17:45:34'),
(91, 'igreja_frente', 'igreja_fundos', '2025-11-04 17:45:34'),
(95, 'igreja_fundos', 'igreja_sinos', '2025-11-04 17:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `destructible_walls`
--

CREATE TABLE `destructible_walls` (
  `id` int(11) NOT NULL,
  `location_id` varchar(50) NOT NULL,
  `wall_id` varchar(50) NOT NULL,
  `x` decimal(5,2) NOT NULL DEFAULT 0.00,
  `y` decimal(5,2) NOT NULL DEFAULT 0.00,
  `width` decimal(5,2) NOT NULL DEFAULT 10.00,
  `height` decimal(5,2) NOT NULL DEFAULT 20.00,
  `image` varchar(255) DEFAULT NULL,
  `required_item` varchar(50) DEFAULT 'gun',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `destructible_walls`
--

INSERT INTO `destructible_walls` (`id`, `location_id`, `wall_id`, `x`, `y`, `width`, `height`, `image`, `required_item`, `created_at`, `updated_at`) VALUES
(2851, 'igreja_fundos', 'wall_1764607647127', 28.90, 72.50, 26.40, 22.20, 'images/walls/porta_moinho.png', 'pedecabra', '2025-12-25 15:25:08', '2025-12-25 15:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `game_progress`
--

CREATE TABLE `game_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `current_location` varchar(50) NOT NULL DEFAULT 'forest_entrance',
  `visited_locations` text DEFAULT NULL,
  `collected_items` text DEFAULT NULL,
  `solved_puzzles` text DEFAULT NULL,
  `inventory` text DEFAULT NULL,
  `has_key` tinyint(1) DEFAULT 0,
  `game_completed` tinyint(1) DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_progress`
--

INSERT INTO `game_progress` (`id`, `user_id`, `current_location`, `visited_locations`, `collected_items`, `solved_puzzles`, `inventory`, `has_key`, `game_completed`, `updated_at`) VALUES
(1, 1, 'igreja_sinos', '[\"floresta\",\"portao_entrada\",\"rua_vila\",\"casa_abandonada_01_frente\",\"casa_abandonada_01_porta_entrada\",\"casa_abandonada_01_sala\",\"casa_abandonada_01_quarto\",\"praca_central\",\"poco_profundo\",\"rua_final\",\"igreja_frente\",\"igreja_fundos\",\"igreja_sinos\",\"cemiterio_entrada\",\"cemiterio_dentro\"]', '[\"mapa\",\"moeda3\",\"balde\",\"gun\",\"pedecabra\"]', '[\"quadro\"]', '{\"mapa\":{\"id\":\"mapa\",\"name\":\"mapa\",\"description\":\"\",\"image\":\"images\\/items\\/mapa.png\",\"size\":{\"width\":80,\"height\":80},\"status\":\"held\",\"isDisplayItem\":true,\"displayImage\":\"images\\/items\\/mapa_completo.png\",\"transform\":{\"rotation\":-6,\"rotateX\":-28,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":0.6,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0},\"renderMode\":\"dom\",\"dropInPuzzleArea\":false},\"moeda3\":{\"id\":\"moeda3\",\"name\":\"moeda\",\"image\":\"images\\/items\\/moeda.png\",\"status\":\"held\",\"description\":\"\",\"size\":{\"width\":80,\"height\":80},\"dropInPuzzleArea\":false},\"balde\":{\"id\":\"balde\",\"name\":\"balde\",\"description\":\"\",\"image\":\"images\\/items\\/balde.png\",\"size\":{\"width\":80,\"height\":80},\"status\":\"held\",\"isDisplayItem\":false,\"displayImage\":null,\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0},\"renderMode\":\"dom\",\"dropInPuzzleArea\":false},\"gun\":{\"id\":\"gun\",\"name\":\"martelo\",\"description\":\"\",\"image\":\"images\\/items\\/marreta.png\",\"size\":{\"width\":80,\"height\":80},\"status\":\"held\",\"isDisplayItem\":false,\"displayImage\":null,\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":0.4,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0},\"renderMode\":\"dom\",\"dropInPuzzleArea\":false},\"pedecabra\":{\"id\":\"pedecabra\",\"name\":\"p\\u00e9 de cabra\",\"description\":\"\",\"image\":\"images\\/items\\/pe-de-cabra.png\",\"size\":{\"width\":80,\"height\":80},\"status\":\"held\",\"isDisplayItem\":false,\"displayImage\":null,\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":0.6,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0},\"renderMode\":\"dom\",\"dropInPuzzleArea\":false}}', 0, 0, '2025-12-25 15:24:44'),
(2, 2, 'casa_abandonada_01_frente', '[\"portao_entrada\",\"rua_vila\",\"casa_abandonada_01_frente\"]', '[]', '[]', '[]', 0, 0, '2025-11-04 18:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `game_settings`
--

CREATE TABLE `game_settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `game_settings`
--

INSERT INTO `game_settings` (`setting_key`, `setting_value`, `description`, `updated_at`, `updated_by`) VALUES
('registration_enabled', 'true', 'Controls whether new user registration is allowed', '2025-11-07 21:10:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hotspots`
--

CREATE TABLE `hotspots` (
  `id` int(11) NOT NULL,
  `location_id` varchar(50) NOT NULL,
  `type` enum('navigation','item','interaction') NOT NULL,
  `x` decimal(5,2) NOT NULL,
  `y` decimal(5,2) NOT NULL,
  `width` decimal(5,2) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `target_location` varchar(50) DEFAULT NULL,
  `item_id` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_display_item` tinyint(1) DEFAULT 0,
  `display_image` varchar(500) DEFAULT NULL,
  `solved_image` varchar(255) DEFAULT NULL,
  `interaction_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rotate_x` float DEFAULT 0,
  `rotate_y` float DEFAULT 0,
  `rotation` float DEFAULT 0,
  `scale_x` float DEFAULT 1,
  `scale_y` float DEFAULT 1,
  `opacity` float DEFAULT 1,
  `skew_x` decimal(10,2) DEFAULT 0.00 COMMENT 'Inclinação X',
  `skew_y` decimal(10,2) DEFAULT 0.00 COMMENT 'Inclinação Y',
  `flip_x` tinyint(1) DEFAULT 0 COMMENT 'Flip horizontal',
  `flip_y` tinyint(1) DEFAULT 0 COMMENT 'Flip vertical',
  `shadow_blur` int(11) DEFAULT 0 COMMENT 'Desfoque da sombra (px)',
  `shadow_offset_x` int(11) DEFAULT 0 COMMENT 'Deslocamento X da sombra (px)',
  `shadow_offset_y` int(11) DEFAULT 0 COMMENT 'Deslocamento Y da sombra (px)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotspots`
--

INSERT INTO `hotspots` (`id`, `location_id`, `type`, `x`, `y`, `width`, `height`, `label`, `description`, `target_location`, `item_id`, `image`, `is_display_item`, `display_image`, `solved_image`, `interaction_data`, `created_at`, `updated_at`, `rotate_x`, `rotate_y`, `rotation`, `scale_x`, `scale_y`, `opacity`, `skew_x`, `skew_y`, `flip_x`, `flip_y`, `shadow_blur`, `shadow_offset_x`, `shadow_offset_y`) VALUES
(158832, 'floresta', 'navigation', 32.91, 54.18, 32.46, 17.14, 'Portão', '', 'portao_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158833, 'portao_entrada', 'navigation', 26.17, 51.43, 50.74, 34.06, 'Portão Aberto', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158834, 'portao_entrada', 'navigation', 45.14, 94.06, 12.00, 5.94, 'Voltar', '', 'floresta', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158835, 'portao_entrada', 'item', 7.71, 91.49, 80.00, 80.00, 'mapa', '', NULL, 'mapa', NULL, 1, 'images/items/mapa_completo.png', NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', -28, 0, -6, 1, 1, 0.6, 0.00, 0.00, 0, 0, 0, 0, 0),
(158836, 'rua_vila', 'navigation', 2.63, 90.51, 97.14, 8.57, 'voltar', '', 'portao_entrada_fechado', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158837, 'rua_vila', 'navigation', 43.09, 51.43, 13.83, 11.08, 'Praça Central', '', 'praca_central', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158838, 'rua_vila', 'navigation', 64.35, 52.34, 6.97, 9.26, 'Casa Abandonada', '', 'casa_abandonada_02_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158839, 'rua_vila', 'navigation', 9.49, 50.17, 10.29, 15.20, 'Casa Abandonada', '', 'casa_abandonada_01_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158840, 'casa_abandonada_01_frente', 'navigation', 0.00, 0.00, 92.23, 4.00, 'voltar', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158841, 'casa_abandonada_01_frente', 'navigation', 38.86, 59.66, 23.66, 20.46, 'Porta', '', 'casa_abandonada_01_porta_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158842, 'casa_abandonada_01_frente', 'navigation', 47.54, 92.91, 10.06, 4.91, 'volta', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158843, 'casa_abandonada_02_cozinha', 'navigation', 42.63, 36.69, 14.40, 33.83, 'quintal', '', 'casa_abandonada_02_quintal', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158844, 'casa_abandonada_02_cozinha', 'navigation', 11.09, 93.60, 77.83, 5.03, 'voltar', '', 'casa_abandonada_02_sala', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158845, 'casa_abandonada_02_sala', 'navigation', 46.05, 94.17, 10.29, 5.49, 'Voltar', '', 'casa_abandonada_02_porta_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158846, 'casa_abandonada_02_sala', 'navigation', 40.57, 30.52, 17.26, 39.09, 'cozinha', '', 'casa_abandonada_02_cozinha', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158847, 'casa_abandonada_02_sala', 'item', 31.37, 62.69, 80.00, 80.00, 'triangulo', '', NULL, 'triangulo', NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158848, 'casa_abandonada_02_sala', 'item', 26.23, 66.80, 80.00, 80.00, 'circulo', '', NULL, 'circulo', NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158849, 'casa_abandonada_01_porta_entrada', 'navigation', 40.57, 34.86, 18.86, 34.51, 'Porta', '', 'casa_abandonada_01_sala', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158850, 'casa_abandonada_01_porta_entrada', 'navigation', 0.91, 90.40, 96.91, 6.29, 'Voltar', '', 'casa_abandonada_01_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158851, 'casa_abandonada_01_quarto', 'navigation', 4.69, 91.66, 90.17, 7.89, 'voltar', '', 'casa_abandonada_01_sala', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158852, 'casa_abandonada_01_sala', 'navigation', 22.86, 37.83, 17.26, 31.43, 'saida', '', 'casa_abandonada_01_porta_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158853, 'casa_abandonada_01_sala', 'navigation', 82.86, 50.06, 16.46, 32.57, 'Quarto', '', 'casa_abandonada_01_quarto', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158854, 'casa_abandonada_02_frente', 'navigation', 1.60, 93.60, 96.91, 5.83, 'voltar', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158855, 'casa_abandonada_02_frente', 'navigation', 41.94, 50.29, 14.51, 28.69, 'Porta', '', 'casa_abandonada_02_porta_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158856, 'casa_abandonada_02_porta_entrada', 'navigation', 28.46, 19.89, 28.69, 64.11, 'Porta', '', 'casa_abandonada_02_sala', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158857, 'casa_abandonada_02_porta_entrada', 'navigation', 2.51, 93.26, 92.69, 5.94, 'Voltar', '', 'casa_abandonada_02_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158858, 'casa_abandonada_02_quintal', 'navigation', 2.86, 92.80, 88.69, 4.80, 'cozinha', '', 'casa_abandonada_02_cozinha', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158859, 'cemiterio_dentro', 'navigation', 44.12, 59.31, 12.69, 10.06, 'mausoleo', '', 'cemiterio_mausoleo_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158860, 'cemiterio_dentro', 'navigation', 4.00, 93.60, 89.83, 4.23, 'voltar', '', 'cemiterio_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158861, 'cemiterio_dentro', 'item', 12.74, 78.91, 80.00, 80.00, 'pé de cabra', '', NULL, 'pedecabra', NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 0.6, 0.00, 0.00, 0, 0, 0, 0, 0),
(158862, 'cemiterio_entrada', 'navigation', 4.46, 92.34, 91.20, 5.37, 'voltar', '', 'rua_final', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158863, 'cemiterio_entrada', 'navigation', 36.91, 50.06, 28.34, 35.43, 'Portao', '', 'cemiterio_dentro', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158864, 'cemiterio_mausoleo_dentro', 'navigation', 7.66, 96.69, 86.74, 2.63, 'voltar', '', 'cemiterio_mausoleo_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158865, 'cemiterio_mausoleo_frente', 'navigation', 2.29, 93.03, 93.83, 6.29, 'voltar', '', 'cemiterio_dentro', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158866, 'cemiterio_mausoleo_frente', 'navigation', 42.51, 48.34, 15.31, 25.60, 'Mausoleo', '', 'cemiterio_mausoleo_dentro', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158867, 'igreja_dentro', 'navigation', 2.74, 95.20, 94.74, 3.54, 'voltar', '', 'igreja_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158868, 'igreja_frente', 'navigation', 79.54, 57.71, 13.60, 14.97, 'fundos', '', 'igreja_fundos', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158869, 'igreja_frente', 'navigation', 4.34, 54.86, 16.00, 16.69, 'fundos', '', 'igreja_fundos', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158870, 'igreja_frente', 'navigation', 42.86, 94.17, 13.26, 5.83, 'voltar', '', 'rua_final', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158871, 'igreja_frente', 'item', 86.80, 88.40, 80.00, 80.00, 'martelo', '', NULL, 'gun', NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 0.4, 0.00, 0.00, 0, 0, 0, 0, 0),
(158872, 'igreja_fundos', 'navigation', 47.54, 95.43, 8.35, 4.57, 'voltar', '', 'igreja_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158873, 'igreja_fundos', 'navigation', 39.09, 72.69, 10.06, 14.40, 'sinos', '', 'igreja_sinos', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158874, 'igreja_sinos', 'navigation', 10.40, 90.74, 81.14, 7.54, 'voltar', '', 'igreja_fundos', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158875, 'poco_profundo', 'navigation', 8.11, 83.66, 87.77, 16.11, 'voltar', '', 'praca_central', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158876, 'poco_profundo', 'item', 52.06, 61.66, 80.00, 80.00, 'balde', '', NULL, 'balde', NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158877, 'portao_entrada_fechado', 'navigation', 4.00, 93.49, 87.20, 5.49, 'voltar', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158878, 'portao_saida', 'navigation', 1.49, 94.74, 97.14, 4.80, 'voltar', '', 'rua_final', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158879, 'portao_saida_aberto', 'navigation', 41.80, 27.99, 17.42, 58.25, 'saida da vila', '', 'portao_saida_end', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158880, 'portao_saida_cadeado', 'navigation', 3.77, 90.40, 89.26, 8.57, 'voltar', '', 'portao_saida', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158881, 'praca_central', 'navigation', 1.94, 90.86, 96.34, 8.91, 'voltar', '', 'rua_vila', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158882, 'praca_central', 'navigation', 34.40, 58.51, 32.23, 19.43, 'Poço', '', 'poco_profundo', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158883, 'praca_central', 'navigation', 39.09, 47.31, 22.74, 8.23, 'Rua', '', 'rua_final', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158884, 'rua_final', 'navigation', 68.57, 38.63, 21.83, 23.31, 'Igreja', '', 'igreja_frente', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158885, 'rua_final', 'navigation', 29.49, 46.63, 12.34, 15.20, 'Cemiterio', '', 'cemiterio_entrada', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158886, 'rua_final', 'navigation', 42.86, 44.11, 15.09, 16.57, 'portao de saida', '', 'portao_saida', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(158887, 'rua_final', 'navigation', 2.97, 93.03, 91.20, 6.51, 'Voltar', '', 'praca_central', NULL, NULL, 0, NULL, NULL, NULL, '2025-12-25 15:25:08', '2025-12-25 15:25:08', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` enum('key','tool','collectible','quest') NOT NULL DEFAULT 'collectible',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `type`, `created_at`, `updated_at`) VALUES
('balde', 'balde', '', 'images/items/balde.png', 'collectible', '2025-11-21 18:56:28', '2025-12-25 15:25:08'),
('chave', 'chave', '', 'images/items/chave.png', 'collectible', '2025-11-06 23:48:42', '2025-11-27 21:06:13'),
('chave2', 'chave', '', 'images/items/chave2.png', 'collectible', '2025-11-21 18:51:33', '2025-11-21 18:55:59'),
('circulo', 'circulo', '', 'images/items/circulo.png', 'collectible', '2025-12-02 19:16:00', '2025-12-25 15:25:08'),
('gun', 'martelo', '', 'images/items/marreta.png', 'collectible', '2025-11-19 19:59:10', '2025-12-25 15:25:08'),
('mapa', 'mapa', '', 'images/items/mapa.png', 'collectible', '2025-11-05 12:52:00', '2025-12-25 15:25:08'),
('mapas', 'mapas', '', 'images/items/mapa_antigo.png', 'collectible', '2025-11-04 23:02:28', '2025-11-05 12:51:05'),
('moeda', 'moeda', '', 'images/items/moeda.png', 'collectible', '2025-11-05 14:16:48', '2025-11-06 21:07:20'),
('pedecabra', 'pé de cabra', '', 'images/items/pe-de-cabra.png', 'collectible', '2025-11-30 16:51:42', '2025-12-25 15:25:08'),
('triangulo', 'triangulo', '', 'images/items/triangulo.png', 'collectible', '2025-12-02 19:16:00', '2025-12-25 15:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `puzzle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`puzzle`)),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `is_final_scene` tinyint(1) DEFAULT 0 COMMENT 'Flag para cena final com créditos\r\n  Star Wars',
  `credits` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Array de créditos para a cena final (texto, fonte,\r\n  tamanho, cor, peso)' CHECK (json_valid(`credits`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `background_image`, `display_order`, `puzzle`, `created_at`, `updated_at`, `created_by`, `is_final_scene`, `credits`) VALUES
('casa_abandonada_01_frente', 'Casa Abandonada...', 'Uma casa antiga', 'images/casa_abandonada_01_frente.jpg', 3, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_01_porta_entrada', 'casa_abandonada_01_porta_entrada', 'Descrição do local...', 'images/casa_abandonada_01_porta_entrada.jpg', 6, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_01_quarto', 'casa_abandonada_01_quarto', 'Descrição do local...', 'images/casa_abandonada_01_quarto.jpg', 7, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_01_sala', 'casa_abandonada_01_sala', 'Descrição do local...', 'images/casa_abandonada_01_sala.jpg', 8, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_02_cozinha', 'casa_abandonada_02_cozinha', 'Descrição do local...', 'images/casa_abandonada_02_cozinha.jpg', 4, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_02_frente', 'casa_abandonada_02_frente', 'Descrição do local...', 'images/casa_abandonada_02_frente.jpg', 9, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_02_porta_entrada', 'casa_abandonada_02_porta_entrada', 'Descrição do local...', 'images/casa_abandonada_02_porta_entrada.jpg', 10, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_02_quintal', 'casa_abandonada_02_quintal', 'Descrição do local...', 'images/casa_abandonada_02_quintal.jpg', 11, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('casa_abandonada_02_sala', 'casa_abandonada_02_sala', 'Descrição do local...', 'images/casa_abandonada_02_sala.jpg', 5, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('cemiterio_dentro', 'cemiterio_dentro', 'Descrição do local...', 'images/cemiterio_dentro.jpg', 12, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('cemiterio_entrada', 'cemiterio_entrada', 'Descrição do local...', 'images/cemiterio_entrada.jpg', 13, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('cemiterio_mausoleo_dentro', 'cemiterio_mausoleo_dentro', 'Descrição do local...', 'images/cemiterio_mausoleo_dentro.jpg', 14, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('cemiterio_mausoleo_frente', 'cemiterio_mausoleo_frente', 'Descrição do local...', 'images/cemiterio_mausoleo_frente.jpg', 15, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('fim', 'fim', 'Descrição do local...', 'images/portao_saida_aberto_fim.jpg', 27, NULL, '2025-12-01 20:01:55', '2025-12-25 15:25:08', NULL, 1, '[{\"text\":\"Fim\",\"font\":\"Arial, sans-serif\",\"fontSize\":\"48px\",\"color\":\"#feda4a\",\"fontWeight\":\"bold\"}]'),
('floresta', 'Floresta', 'Após caminhar por 1 hora, você encontra ao fundo um portão semi aberto.', 'images/floresta.jpg', 0, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('igreja_dentro', 'igreja_dentro', 'Descrição do local...', 'images/igreja_dentro.jpg', 16, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('igreja_frente', 'igreja_frente', 'Descrição do local...', 'images/igreja_frente.jpg', 17, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('igreja_fundos', 'igreja_fundos', 'Descrição do local...', 'images/igreja_fundos_aberto.jpg', 18, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('igreja_sinos', 'igreja_sinos', 'Descrição do local...', 'images/igreja_sinos.jpg', 19, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('poco_profundo', 'Poço Profundo', 'Descrição do local...', 'images/poco_profundo.jpg', 20, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('Port', 'fim', 'Descrição do local...', 'images/portao_saida_aberto_fim.jpg', 28, NULL, '2025-12-02 14:08:40', '2025-12-25 15:25:08', NULL, 1, '[{\"text\":\"Fim\",\"font\":\"Arial, sans-serif\",\"fontSize\":\"48px\",\"color\":\"#feda4a\",\"fontWeight\":\"bold\"}]'),
('portao_entrada', 'Portao de entrada', 'Ao chegar mais perto dá pra ver que há uma trilha adentro', 'images/portao_entrada.jpg', 1, '{\"id\":\"mapa\",\"type\":\"item_combination\",\"question\":\"mapa\",\"requiredItems\":[\"mapa\"],\"reward\":{\"id\":\"moeda\",\"name\":\"moeda\"}}', '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('portao_entrada_fechado', 'Portão de Entrada', 'Minha nossa, agora o portão está trancado, \ndevo retornar, adentrar a vila e achar uma saída!', 'images/portao_entrada_fechado.jpg', 21, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('portao_saida', 'portao_saida', 'Descrição do local...', 'images/portao_saida.jpg', 22, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('portao_saida_aberto', 'portao_saida_aberto', 'Descrição do local...', 'images/portao_saida_aberto.jpg', 23, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('portao_saida_cadeado', 'portao_saida_cadeado', 'Descrição do local...', 'images/portao_saida_cadeado.jpg', 24, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('portao_saida_end', 'Portao de saída', 'Finalmente o portão é aberto, e consigo sair da vila abandonada, mas quando olho para trás!\ncuidado com a vila!', 'images/portao_saida_aberto_fim.jpg', 29, NULL, '2025-12-02 14:08:51', '2025-12-25 15:25:08', NULL, 1, '[{\"text\":\"Fim\",\"font\":\"Arial, sans-serif\",\"fontSize\":\"48px\",\"color\":\"#feda4a\",\"fontWeight\":\"bold\"}]'),
('praca_central', 'Praça Central', 'Descrição do local...', 'images/praca_central.jpg', 25, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('rua_final', 'rua_final', 'Descrição do local...', 'images/rua_final.jpg', 26, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL),
('rua_vila', 'Rua da Vila', 'Incrível, após passar pelo portão e caminhar um pouco, \nchega em uma vila abandonada', 'images/rua_vila.jpg', 2, NULL, '2025-11-04 12:20:35', '2025-12-25 15:25:08', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location_puzzles`
--

CREATE TABLE `location_puzzles` (
  `location_id` varchar(50) NOT NULL,
  `puzzle_id` varchar(100) NOT NULL,
  `puzzle_data` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_puzzles`
--

INSERT INTO `location_puzzles` (`location_id`, `puzzle_id`, `puzzle_data`, `created_at`, `updated_at`) VALUES
('casa_abandonada_01_sala', 'quadro', '{\"id\":\"quadro\",\"type\":\"shape_match\",\"title\":\"formas\",\"description\":\"formas\",\"molds\":[{\"shape\":\"circle\",\"x\":87.2571,\"y\":57.6572,\"item\":\"\",\"label\":\"\"},{\"shape\":\"square\",\"x\":32.9714,\"y\":43.9429,\"item\":\"\",\"label\":\"\"}],\"reward\":{\"id\":\"moeda3\",\"name\":\"moeda\",\"image\":\"images/items/moeda.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/quadro_antigo.png\",\"afterImage\":\"images/puzzles/quadro_antigo_aberto.png\",\"position\":{\"x\":48.8571,\"y\":48.7428},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":0.6,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}}}', '2025-11-27 16:27:58', '2025-12-25 15:25:08'),
('casa_abandonada_02_sala', 'quadro', '{\"id\":\"quadro\",\"type\":\"shape_match\",\"title\":\"formas\",\"description\":\"formas\",\"molds\":[{\"shape\":\"circle\",\"x\":87.2571,\"y\":57.6572,\"item\":\"\",\"label\":\"\"},{\"shape\":\"square\",\"x\":32.9714,\"y\":43.9429,\"item\":\"\",\"label\":\"\"}],\"reward\":{\"id\":\"moeda3\",\"name\":\"moeda\",\"image\":\"images/items/moeda.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/bau_fechado.png\",\"afterImage\":\"images/puzzles/bau_aberto.png\",\"position\":{\"x\":91.2572,\"y\":87.8285},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}}}', '2025-12-02 19:13:11', '2025-12-25 15:25:08'),
('portao_saida', 'Portao', '{\"id\":\"Portao\",\"type\":\"padlock_5digit\",\"secretCode\":\"21111\",\"onUnlockedAction\":{\"type\":\"navigate\",\"targetLocation\":\"fim\"},\"reward\":{\"id\":\"moeda3\",\"name\":\"moeda\",\"image\":\"images/items/moeda.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/cadeado_fechado.png\",\"afterImage\":\"images/puzzles/cadeado_aberto.png\",\"position\":{\"x\":51.4855,\"y\":36.672},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}},\"digitPositions\":[{\"x\":43.4855,\"y\":48.672},{\"x\":47.4855,\"y\":48.672},{\"x\":51.4855,\"y\":48.672},{\"x\":55.4855,\"y\":48.672},{\"x\":59.4855,\"y\":48.672}]}', '2025-12-01 19:07:12', '2025-12-25 15:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `user_id`, `token`, `expires_at`, `used`, `created_at`) VALUES
(5, 1, '14f61134b7ae27cf56a6f26292d6f6b2e5352ced1207b477da390e9cb85d096f', '2025-11-07 18:26:19', 0, '2025-11-07 17:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `created_at`, `last_login`, `is_admin`) VALUES
(1, 'klaus', 'klaused@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bThEcjNHSlRuLlJub1BOTw$tF/CMovxgqI/rPbiszjtVjHbXG5vMv1kHOtThOSgWkA', '2025-11-04 02:28:58', '2025-11-29 15:32:11', 1),
(2, 'luigi', 'nhkluigi@gmail.com', '$argon2id$v=19$m=65536,t=4,p=1$bGMwU1lRWEt1ajJZSkNZZw$6fsHd8htUvYYmq5suO/gxDxQRzpMQ33iKi3e1m+UHQY', '2025-11-04 02:56:30', '2025-11-04 18:08:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_token` varchar(64) NOT NULL,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_sessions`
--

INSERT INTO `user_sessions` (`id`, `user_id`, `session_token`, `expires_at`, `created_at`) VALUES
(43, 1, 'e78b5cee77883e549a77ea9dc007b7046bb0506fe20a0fc3ebd84d8d4780f051', '2025-11-30 15:32:11', '2025-11-29 15:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `waitlist`
--

CREATE TABLE `waitlist` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `book_source` varchar(255) DEFAULT NULL,
  `notified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waitlist`
--

INSERT INTO `waitlist` (`id`, `name`, `email`, `age`, `city`, `phone`, `book_source`, `notified`, `created_at`) VALUES
(2, 'klaus', 'klaused@gmail.com', 48, 'curitiba', '11994013474', 'bazar dsc', 1, '2025-11-07 13:12:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connections`
--
ALTER TABLE `connections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_connection` (`from_location`,`to_location`),
  ADD KEY `idx_from` (`from_location`),
  ADD KEY `idx_to` (`to_location`);

--
-- Indexes for table `destructible_walls`
--
ALTER TABLE `destructible_walls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_location` (`location_id`);

--
-- Indexes for table `game_progress`
--
ALTER TABLE `game_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_progress` (`user_id`);

--
-- Indexes for table `game_settings`
--
ALTER TABLE `game_settings`
  ADD PRIMARY KEY (`setting_key`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `hotspots`
--
ALTER TABLE `hotspots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_location` (`location_id`),
  ADD KEY `idx_type` (`type`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `location_puzzles`
--
ALTER TABLE `location_puzzles`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `idx_puzzle_id` (`puzzle_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_username` (`username`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_token` (`session_token`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_token` (`session_token`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `waitlist`
--
ALTER TABLE `waitlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_notified` (`notified`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connections`
--
ALTER TABLE `connections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `destructible_walls`
--
ALTER TABLE `destructible_walls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2852;

--
-- AUTO_INCREMENT for table `game_progress`
--
ALTER TABLE `game_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotspots`
--
ALTER TABLE `hotspots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158888;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `waitlist`
--
ALTER TABLE `waitlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `connections`
--
ALTER TABLE `connections`
  ADD CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`from_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`to_location`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `destructible_walls`
--
ALTER TABLE `destructible_walls`
  ADD CONSTRAINT `destructible_walls_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game_progress`
--
ALTER TABLE `game_progress`
  ADD CONSTRAINT `game_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `game_settings`
--
ALTER TABLE `game_settings`
  ADD CONSTRAINT `game_settings_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `hotspots`
--
ALTER TABLE `hotspots`
  ADD CONSTRAINT `hotspots_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `location_puzzles`
--
ALTER TABLE `location_puzzles`
  ADD CONSTRAINT `location_puzzles_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
