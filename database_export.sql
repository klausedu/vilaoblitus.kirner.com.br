-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 07, 2025 at 04:15 PM
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
(1, 1, 'portao_entrada', '[\"floresta\",\"portao_entrada\"]', '[\"chave\",\"moeda\"]', '[\"codigo\",\"bau\"]', '{\"chave\":{\"id\":\"chave\",\"name\":\"chave\",\"description\":\"\",\"image\":\"images\\/items\\/chave.png\",\"size\":{\"width\":80,\"height\":80},\"status\":\"used\",\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0},\"renderMode\":\"dom\",\"dropInPuzzleArea\":false},\"moeda\":{\"id\":\"moeda\",\"name\":\"moeda\",\"image\":\"images\\/items\\/moeda.png\",\"status\":\"held\",\"dropTransform\":null,\"transform\":null,\"size\":{\"width\":80,\"height\":80},\"description\":\"\"},\"mapa\":{\"id\":\"mapa\",\"name\":\"mapa\",\"image\":\"images\\/items\\/mapa.png\",\"status\":\"dropped\",\"dropLocation\":\"portao_entrada\",\"dropPosition\":{\"x\":7.485669999999993,\"y\":91.87897409440174},\"dropSize\":null,\"dropTransform\":null,\"transform\":null,\"size\":{\"width\":80,\"height\":80},\"description\":\"\",\"dropInPuzzleArea\":false}}', 0, 0, '2025-11-07 13:14:49'),
(2, 2, 'casa_abandonada_01_frente', '[\"portao_entrada\",\"rua_vila\",\"casa_abandonada_01_frente\"]', '[]', '[]', '[]', 0, 0, '2025-11-04 18:09:41');

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

INSERT INTO `hotspots` (`id`, `location_id`, `type`, `x`, `y`, `width`, `height`, `label`, `description`, `target_location`, `item_id`, `image`, `solved_image`, `interaction_data`, `created_at`, `updated_at`, `rotate_x`, `rotate_y`, `rotation`, `scale_x`, `scale_y`, `opacity`, `skew_x`, `skew_y`, `flip_x`, `flip_y`, `shadow_blur`, `shadow_offset_x`, `shadow_offset_y`) VALUES
(6814, 'floresta', 'navigation', 34.17, 54.75, 32.46, 17.14, 'Portão', '', 'portao_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6815, 'floresta', 'item', 16.02, 81.17, 80.00, 80.00, 'chave', '', NULL, 'chave', NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6816, 'portao_entrada', 'navigation', 26.17, 51.43, 50.74, 34.06, 'Portão Aberto', '', 'rua_vila', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6817, 'portao_entrada', 'navigation', 1.71, 94.17, 98.29, 5.60, 'Voltar', '', 'floresta', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6818, 'portao_entrada', 'interaction', 39.43, 29.26, 29.37, 17.83, 'mapa', '', 'mapa', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6819, 'rua_vila', 'navigation', 2.63, 90.51, 97.14, 8.57, 'voltar', '', 'portao_entrada_fechado', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6820, 'rua_vila', 'navigation', 38.63, 51.43, 22.86, 12.00, 'Praça Central', '', 'praca_central', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6821, 'rua_vila', 'navigation', 63.66, 50.40, 9.60, 12.46, 'Casa Abandonada', '', 'casa_abandonada_02_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6822, 'rua_vila', 'navigation', 5.83, 45.94, 20.23, 20.91, 'Casa Abandonada', '', 'casa_abandonada_01_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6823, 'casa_abandonada_01_frente', 'navigation', 3.77, 94.97, 92.23, 4.00, 'voltar', '', 'rua_vila', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6824, 'casa_abandonada_01_frente', 'navigation', 38.86, 59.66, 23.66, 20.46, 'Porta', '', 'casa_abandonada_01_porta_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6825, 'casa_abandonada_02_cozinha', 'navigation', 42.63, 36.69, 14.40, 33.83, 'quintal', '', 'casa_abandonada_02_quintal', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6826, 'casa_abandonada_02_cozinha', 'navigation', 11.09, 93.60, 77.83, 5.03, 'voltar', '', 'casa_abandonada_02_sala', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6827, 'casa_abandonada_01_porta_entrada', 'navigation', 40.57, 34.86, 18.86, 34.51, 'Porta', '', 'casa_abandonada_01_sala', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6828, 'casa_abandonada_01_porta_entrada', 'navigation', 0.91, 90.40, 96.91, 6.29, 'Voltar', '', 'casa_abandonada_01_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6829, 'casa_abandonada_01_quarto', 'navigation', 4.69, 91.66, 90.17, 7.89, 'voltar', '', 'casa_abandonada_01_sala', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6830, 'casa_abandonada_01_sala', 'navigation', 22.86, 37.83, 17.26, 31.43, 'saida', '', 'casa_abandonada_01_porta_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6831, 'casa_abandonada_01_sala', 'navigation', 82.86, 50.06, 16.46, 32.57, 'Quarto', '', 'casa_abandonada_01_quarto', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6832, 'casa_abandonada_02_frente', 'navigation', 1.60, 93.60, 96.91, 5.83, 'voltar', '', 'rua_vila', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6833, 'casa_abandonada_02_frente', 'navigation', 41.94, 50.29, 14.51, 28.69, 'Porta', '', 'casa_abandonada_02_porta_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6834, 'casa_abandonada_02_porta_entrada', 'navigation', 28.46, 19.89, 28.69, 64.11, 'Porta', '', 'casa_abandonada_02_sala', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6835, 'casa_abandonada_02_porta_entrada', 'navigation', 2.51, 93.26, 92.69, 5.94, 'Voltar', '', 'casa_abandonada_02_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6836, 'casa_abandonada_02_quintal', 'navigation', 2.86, 92.80, 88.69, 4.80, 'cozinha', '', 'casa_abandonada_02_cozinha', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6837, 'casa_abandonada_02_sala', 'navigation', 14.51, 88.80, 72.80, 10.06, 'Voltar', '', 'casa_abandonada_02_porta_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6838, 'casa_abandonada_02_sala', 'navigation', 41.71, 29.83, 17.26, 39.09, 'cozinha', '', 'casa_abandonada_02_cozinha', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6839, 'cemiterio_dentro', 'navigation', 43.66, 56.11, 12.69, 10.06, 'mausoleo', '', 'cemiterio_mausoleo_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6840, 'cemiterio_dentro', 'navigation', 4.00, 93.60, 89.83, 4.23, 'voltar', '', 'cemiterio_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6841, 'cemiterio_entrada', 'navigation', 4.46, 92.34, 91.20, 5.37, 'voltar', '', 'rua_final', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6842, 'cemiterio_entrada', 'navigation', 36.91, 50.06, 28.34, 35.43, 'Portao', '', 'cemiterio_dentro', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6843, 'cemiterio_mausoleo_dentro', 'navigation', 7.66, 96.69, 86.74, 2.63, 'voltar', '', 'cemiterio_mausoleo_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6844, 'cemiterio_mausoleo_frente', 'navigation', 2.29, 93.03, 93.83, 6.29, 'voltar', '', 'cemiterio_dentro', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6845, 'cemiterio_mausoleo_frente', 'navigation', 42.51, 48.34, 15.31, 25.60, 'Mausoleo', '', 'cemiterio_mausoleo_dentro', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6846, 'igreja_dentro', 'navigation', 2.74, 95.20, 94.74, 3.54, 'voltar', '', 'igreja_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6847, 'igreja_frente', 'navigation', 79.54, 57.71, 13.60, 14.97, 'fundos', '', 'igreja_fundos', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6848, 'igreja_frente', 'navigation', 4.34, 54.86, 16.00, 16.69, 'fundos', '', 'igreja_fundos', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6849, 'igreja_frente', 'navigation', 5.60, 90.51, 90.06, 8.34, 'voltar', '', 'rua_final', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6850, 'igreja_fundos', 'navigation', 1.94, 94.17, 97.94, 4.57, 'voltar', '', 'igreja_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6851, 'igreja_fundos', 'navigation', 38.86, 72.46, 10.06, 14.40, 'sinos', '', 'igreja_sinos', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6852, 'igreja_sinos', 'navigation', 10.40, 90.74, 81.14, 7.54, 'voltar', '', 'igreja_fundos', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6853, 'poco_profundo', 'navigation', 8.11, 83.66, 87.77, 16.11, 'voltar', '', 'praca_central', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6854, 'portao_entrada_fechado', 'navigation', 4.00, 93.49, 87.20, 5.49, 'voltar', '', 'rua_vila', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6855, 'portao_saida', 'navigation', 1.49, 94.74, 97.14, 4.80, 'voltar', '', 'rua_final', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6856, 'portao_saida', 'navigation', 39.54, 51.31, 21.71, 19.89, 'Cadeado', '', 'portao_saida_cadeado', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6857, 'portao_saida_cadeado', 'navigation', 3.77, 90.40, 89.26, 8.57, 'voltar', '', 'portao_saida', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6858, 'praca_central', 'navigation', 1.94, 90.86, 96.34, 8.91, 'voltar', '', 'rua_vila', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6859, 'praca_central', 'navigation', 34.40, 58.51, 32.23, 19.43, 'Poço', '', 'poco_profundo', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6860, 'praca_central', 'navigation', 39.09, 47.31, 22.74, 8.23, 'Rua', '', 'rua_final', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6861, 'rua_final', 'navigation', 68.57, 38.63, 21.83, 23.31, 'Igreja', '', 'igreja_frente', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6862, 'rua_final', 'navigation', 29.49, 46.63, 12.34, 15.20, 'Cemiterio', '', 'cemiterio_entrada', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6863, 'rua_final', 'navigation', 42.86, 44.11, 15.09, 16.57, 'portao de saida', '', 'portao_saida', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0),
(6864, 'rua_final', 'navigation', 2.97, 93.03, 91.20, 6.51, 'Voltar', '', 'praca_central', NULL, NULL, NULL, NULL, '2025-11-07 12:34:46', '2025-11-07 12:34:46', 0, 0, 0, 1, 1, 1, 0.00, 0.00, 0, 0, 0, 0, 0);

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
('chave', 'chave', '', 'images/items/chave.png', 'collectible', '2025-11-06 23:48:42', '2025-11-07 12:34:46'),
('mapa', 'mapa', '', 'images/items/mapa_antigo.png', 'collectible', '2025-11-05 12:52:00', '2025-11-06 23:42:46'),
('mapas', 'mapas', '', 'images/items/mapa_antigo.png', 'collectible', '2025-11-04 23:02:28', '2025-11-05 12:51:05'),
('moeda', 'moeda', '', 'images/items/moeda.png', 'collectible', '2025-11-05 14:16:48', '2025-11-06 21:07:20');

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
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `description`, `background_image`, `display_order`, `puzzle`, `created_at`, `updated_at`, `created_by`) VALUES
('casa_abandonada_01_frente', 'Casa Abandonada...', 'Uma casa antiga', 'images/casa_abandonada_01_frente.jpg', 3, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_01_porta_entrada', 'casa_abandonada_01_porta_entrada', 'Descrição do local...', 'images/casa_abandonada_01_porta_entrada.jpg', 5, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_01_quarto', 'casa_abandonada_01_quarto', 'Descrição do local...', 'images/casa_abandonada_01_quarto.jpg', 6, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_01_sala', 'casa_abandonada_01_sala', 'Descrição do local...', 'images/casa_abandonada_01_sala.jpg', 7, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_02_cozinha', 'casa_abandonada_02_cozinha', 'Descrição do local...', 'images/casa_abandonada_02_cozinha.jpg', 4, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_02_frente', 'casa_abandonada_02_frente', 'Descrição do local...', 'images/casa_abandonada_02_frente.jpg', 8, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_02_porta_entrada', 'casa_abandonada_02_porta_entrada', 'Descrição do local...', 'images/casa_abandonada_02_porta_entrada.jpg', 9, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_02_quintal', 'casa_abandonada_02_quintal', 'Descrição do local...', 'images/casa_abandonada_02_quintal.jpg', 10, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('casa_abandonada_02_sala', 'casa_abandonada_02_sala', 'Descrição do local...', 'images/casa_abandonada_02_sala.jpg', 11, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('cemiterio_dentro', 'cemiterio_dentro', 'Descrição do local...', 'images/cemiterio_dentro.jpg', 12, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('cemiterio_entrada', 'cemiterio_entrada', 'Descrição do local...', 'images/cemiterio_entrada.jpg', 13, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('cemiterio_mausoleo_dentro', 'cemiterio_mausoleo_dentro', 'Descrição do local...', 'images/cemiterio_mausoleo_dentro.jpg', 14, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('cemiterio_mausoleo_frente', 'cemiterio_mausoleo_frente', 'Descrição do local...', 'images/cemiterio_mausoleo_frente.jpg', 15, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('floresta', 'Floresta', 'Descrição do local...', 'images/floresta.jpg', 0, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('igreja_dentro', 'igreja_dentro', 'Descrição do local...', 'images/igreja_dentro.jpg', 16, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('igreja_frente', 'igreja_frente', 'Descrição do local...', 'images/igreja_frente.jpg', 17, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('igreja_fundos', 'igreja_fundos', 'Descrição do local...', 'images/igreja_fundos.jpg', 18, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('igreja_sinos', 'igreja_sinos', 'Descrição do local...', 'images/igreja_sinos.jpg', 19, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('poco_profundo', 'Poço Profundo', 'Descrição do local...', 'images/poco_profundo.jpg', 20, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('portao_entrada', 'Portao de entrada', 'Descrição do local...', 'images/portao_entrada.jpg', 1, '{\"id\":\"mapa\",\"type\":\"item_combination\",\"question\":\"mapa\",\"requiredItems\":[\"mapa\"],\"reward\":{\"id\":\"moeda\",\"name\":\"moeda\"}}', '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('portao_entrada_fechado', 'Portão de Entrada', 'Descrição do local...', 'images/portao_entrada_fechado.jpg', 21, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('portao_saida', 'portao_saida', 'Descrição do local...', 'images/portao_saida.jpg', 22, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('portao_saida_aberto', 'portao_saida_aberto', 'Descrição do local...', 'images/portao_saida_aberto.jpg', 23, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('portao_saida_cadeado', 'portao_saida_cadeado', 'Descrição do local...', 'images/portao_saida_cadeado.jpg', 24, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('praca_central', 'Praça Central', 'Descrição do local...', 'images/praca_central.jpg', 25, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('rua_final', 'rua_final', 'Descrição do local...', 'images/rua_final.jpg', 26, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL),
('rua_vila', 'Rua da Vila', 'Descrição do local...', 'images/rua_vila.jpg', 2, NULL, '2025-11-04 12:20:35', '2025-11-07 12:34:46', NULL);

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
('floresta', 'codigo', '{\"id\":\"codigo\",\"type\":\"code\",\"question\":\"qual é a sequencia\",\"correctAnswer\":1234,\"hint\":\"1 a 4\",\"reward\":{\"id\":\"moeda\",\"name\":\"moeda\",\"image\":\"images/items/moeda.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/bau_fechado.png\",\"afterImage\":\"images/puzzles/bau_aberto.png\",\"position\":{\"x\":51.1429,\"y\":44.9714},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}}}', '2025-11-07 02:02:07', '2025-11-07 12:34:46'),
('portao_entrada', 'bau', '{\"id\":\"bau\",\"type\":\"item_combination\",\"question\":\"abra o baú\",\"requiredItems\":[\"chave\"],\"reward\":{\"id\":\"mapa\",\"name\":\"mapa\",\"image\":\"images/items/mapa.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/bau_fechado.png\",\"afterImage\":\"images/puzzles/bau_aberto.png\",\"position\":{\"x\":7.48567,\"y\":81.7714},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}}}', '2025-11-06 12:17:41', '2025-11-07 12:34:46'),
('rua_vila', 'codigo2', '{\"id\":\"codigo2\",\"type\":\"direction\",\"question\":\"o sol nasce no?\",\"options\":[\"Norte\",\"Sul\",\"Leste\",\"Oeste\"],\"correctAnswer\":3,\"hint\":\"l\",\"reward\":{\"id\":\"moeda2\",\"name\":\"moeda\",\"image\":\"images/items/moeda.png\"},\"visual\":{\"beforeImage\":\"images/puzzles/bau_fechado.png\",\"afterImage\":\"images/puzzles/bau_aberto.png\",\"position\":{\"x\":48.2857,\"y\":74.5715},\"size\":{\"width\":120,\"height\":120},\"transform\":{\"rotation\":0,\"rotateX\":0,\"rotateY\":0,\"scaleX\":1,\"scaleY\":1,\"skewX\":0,\"skewY\":0,\"flipX\":false,\"flipY\":false,\"opacity\":1,\"shadowBlur\":0,\"shadowOffsetX\":0,\"shadowOffsetY\":0}}}', '2025-11-07 02:06:51', '2025-11-07 12:34:46');

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
(25, 1, 'ca90cf90e867f6d15fa5875198b91619d782996408d495b08ee6c86e9c81d673', '2025-11-07 13:32:14', '2025-11-06 13:32:14'),
(26, 1, '7ad9b33d5abf242f7ff01359c51cbb17323ea3c8300e995cbb1078099e463cf2', '2025-11-07 13:47:20', '2025-11-06 13:47:20'),
(27, 1, 'd922cefc48cee13d98317a259ac3b02c41b7450eb71fb01abe02ac50d0961268', '2025-11-07 13:49:39', '2025-11-06 13:49:39'),
(28, 1, '1414a6f4095ac3bd0a54c39a1bfee03508f21598495f3819e55982917280f906', '2025-11-07 14:07:44', '2025-11-06 14:07:44'),
(29, 1, 'd27e3f206c67bfe1d4f22a9753436b84953e5b01ea25eab60a2cae36255fe4a2', '2025-11-07 14:08:33', '2025-11-06 14:08:33'),
(30, 1, '4972c01d46d0c55ed4e7c90ba601fa1f76d9bda08f6be4be691622f073416e0b', '2025-11-07 14:15:53', '2025-11-06 14:15:53'),
(31, 1, '854783fdd72eddf84b4b4f6dd3402a160250d252d033f6f1aa032e191478d0de', '2025-11-07 14:32:50', '2025-11-06 14:32:50'),
(32, 1, 'addaecee016fb7062959a138fa50df6d380afef066b4bc523d39df330c2ad3ef', '2025-11-07 16:13:51', '2025-11-06 16:13:51'),
(33, 1, '4bf1e47d89de4c64f69ea45a331ae5d6508cdf15bac7d6f8711a82e9882a8404', '2025-11-07 17:56:35', '2025-11-06 17:56:35'),
(34, 1, 'e22b57c33c56f527370e3fb4d9b221723cac00d8713ea22be7c26ea6c3be02e3', '2025-11-07 18:07:08', '2025-11-06 18:07:08'),
(35, 1, '0d858ae4540d894f19a0565ee5a234738be83c4a029ddbf23104167f55a3b060', '2025-11-07 18:30:11', '2025-11-06 18:30:11'),
(36, 1, 'bc7d790e71413d20e27d40afbdfeac1612ebb6f824b2a0ec56e0594c80dca27e', '2025-11-08 11:56:52', '2025-11-07 11:56:52'),
(37, 1, '02547b1895c0d39fcf0a4ed2d57e0aacf17716e21a82e14071a62b4095234565', '2025-11-08 12:05:36', '2025-11-07 12:05:36'),
(38, 1, '33195f93beda7995c9172821aa19441b855c3bc2a098b1260c9fa8a1919dd04c', '2025-11-08 13:13:27', '2025-11-07 13:13:27');

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
(1, 'klaus', 'klaus.kirner@gmail.com', 48, 'curitiba', '11994013474', 'bazar dsc', 0, '2025-11-07 12:58:40'),
(2, 'klaus', 'klaused@gmail.com', 48, 'curitiba', '11994013474', 'bazar dsc', 0, '2025-11-07 13:12:41');

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
-- Indexes for table `game_progress`
--
ALTER TABLE `game_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_progress` (`user_id`);

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
-- AUTO_INCREMENT for table `game_progress`
--
ALTER TABLE `game_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hotspots`
--
ALTER TABLE `hotspots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6865;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
-- Constraints for table `game_progress`
--
ALTER TABLE `game_progress`
  ADD CONSTRAINT `game_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
