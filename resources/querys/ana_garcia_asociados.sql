-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2019 a las 05:55:30
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ana_garcia_asociados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `account_consultants`
--

CREATE TABLE `account_consultants` (
  `id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `bank` varchar(200) DEFAULT NULL,
  `to_use` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `account_consultants`
--

INSERT INTO `account_consultants` (`id`, `consultant_id`, `account_number`, `bank`, `to_use`, `created_at`, `updated_at`) VALUES
(1, 17, '2132434535', 'Banco Industrial de Venezuela, C.A. Banco Universal', '0', '2019-08-10 18:54:30', '2019-10-22 07:32:00'),
(2, 17, '02929292038933000000', 'Banco Provincial, S.A. Banco Universal', '1', '2019-08-10 20:03:52', '2019-11-08 02:19:46'),
(3, 17, '12345678901234567890', 'Banco de Venezuela S.A.C.A. Banco Universal', '1', '2019-11-08 01:58:43', '2019-11-08 02:17:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `advisory_report`
--

CREATE TABLE `advisory_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_title` varchar(100) NOT NULL,
  `report_message` varchar(256) NOT NULL,
  `dating_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `advisory_report`
--

INSERT INTO `advisory_report` (`id`, `report_title`, `report_message`, `dating_id`, `created_at`, `updated_at`) VALUES
(1, 'Reporte Asesoria #19', 'Prueba de una creación de reporte', 19, '2019-10-31 07:52:05', '2019-10-31 07:52:05'),
(2, 'Reporte Asesoria #19', 'Prueba de una creación de reporte', 19, '2019-10-31 07:52:33', '2019-10-31 07:52:33'),
(3, 'Reporte Asesoria #19', 'Hola', 19, '2019-10-31 07:53:56', '2019-10-31 07:53:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attached`
--

CREATE TABLE `attached` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  `dating_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `attached`
--

INSERT INTO `attached` (`id`, `name`, `url`, `dating_id`, `created_at`, `updated_at`) VALUES
(4, '52490d46db16cfc125112520192350.png', '52490d46db16cfc125112520192350.png', 21, '2019-11-26 03:50:33', '2019-11-26 03:50:33'),
(5, 'skin original25112520192350.png', 'skin original25112520192350.png', 21, '2019-11-26 03:50:39', '2019-11-26 03:50:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance_consultants`
--

CREATE TABLE `balance_consultants` (
  `id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `balance_consultants`
--

INSERT INTO `balance_consultants` (`id`, `consultant_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 17, '19800', '2019-07-19 07:53:58', '2019-10-31 05:52:18'),
(2, 18, '0', '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(3, 15, '1000', '2019-07-19 09:29:49', '2019-08-16 06:43:09'),
(4, 19, '0', '2019-08-04 08:01:50', '2019-08-04 08:01:50'),
(5, 20, '0', '2019-11-06 06:47:28', '2019-11-06 06:47:28'),
(6, 21, '0', '2019-11-06 06:48:39', '2019-11-06 06:48:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `balance_users`
--

CREATE TABLE `balance_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `balance_users`
--

INSERT INTO `balance_users` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 6, '0', '2019-07-19 07:50:52', '2019-07-19 07:50:52'),
(3, 8, '0', '2019-07-19 08:09:02', '2019-07-19 08:09:02'),
(4, 9, '22470', '2019-07-19 08:10:19', '2019-11-08 01:36:20'),
(5, 10, '960000', '2019-08-15 07:17:44', '2019-08-15 07:21:36'),
(6, 11, '0', '2019-10-15 03:44:25', '2019-10-15 03:44:25'),
(7, 12, '0', '2019-10-15 03:47:12', '2019-10-15 03:47:12'),
(8, 13, '0', '2019-10-15 04:27:52', '2019-10-15 04:27:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `identification_document` text,
  `account_type` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `banks`
--

INSERT INTO `banks` (`id`, `code`, `name`, `identification_document`, `account_type`, `created_at`, `updated_at`) VALUES
(2, '17889182981912', 'Banco Exterior C.A. Banco Universal', '2889210', 'Corriente', '2019-08-16 09:47:33', '2019-08-16 09:47:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bug_report`
--

CREATE TABLE `bug_report` (
  `id` int(10) UNSIGNED NOT NULL,
  `report_title` varchar(100) NOT NULL,
  `report_message` varchar(256) NOT NULL,
  `consultant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bug_report`
--

INSERT INTO `bug_report` (`id`, `report_title`, `report_message`, `consultant_id`, `created_at`, `updated_at`) VALUES
(1, 'Prueba', 'Prueba Prueba', 17, '2019-11-01 09:54:36', '2019-11-01 09:54:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `careers`
--

CREATE TABLE `careers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `careers`
--

INSERT INTO `careers` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Asesor Legal', 'AS', '2019-06-23 02:36:55', '2019-06-23 02:36:55'),
(2, 'Asesor Psicologico', 'AP', '2019-06-23 02:37:08', '2019-06-23 02:37:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `career_consultant`
--

CREATE TABLE `career_consultant` (
  `career_id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `career_consultant`
--

INSERT INTO `career_consultant` (`career_id`, `consultant_id`, `created_at`, `updated_at`) VALUES
(2, 15, '2019-06-30 07:40:35', '2019-06-30 07:40:35'),
(1, 17, '2019-07-19 07:53:55', '2019-07-19 07:53:55'),
(2, 18, '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(1, 19, '2019-08-04 08:01:50', '2019-08-04 08:01:50'),
(1, 20, '2019-11-06 06:47:28', '2019-11-06 06:47:28'),
(2, 21, '2019-11-06 06:48:39', '2019-11-06 06:48:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultants`
--

CREATE TABLE `consultants` (
  `id` int(10) UNSIGNED NOT NULL,
  `identification_document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach_document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach_certification` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `office_hours_from` time DEFAULT NULL,
  `office_hours_to` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultants`
--

INSERT INTO `consultants` (`id`, `identification_document`, `name`, `lastname`, `birthdate`, `phone_number`, `email`, `password`, `attach_document`, `attach_certification`, `validate`, `office_hours_from`, `office_hours_to`, `created_at`, `updated_at`) VALUES
(15, '2918291', 'Armando', 'Mercado', '1991-06-09', '04124310425', 'amercado@a.net', '1234', NULL, NULL, 'Y', '10:00:00', '18:00:00', '2019-06-30 07:40:33', '2019-10-23 04:39:11'),
(17, '100201001', 'Jesus', 'Mora', '1980-10-19', '1002-100234', 'consulnew@mail.com', '1234', NULL, NULL, 'Y', '10:00:00', '20:00:00', '2019-07-19 07:53:53', '2019-08-10 04:14:45'),
(18, '2892982', 'Nuev', 'Pruob', '1029-10-10', '1029290', 'purbea@nueva.com', '1234', NULL, NULL, 'Y', '10:00:00', '18:00:00', '2019-07-19 09:29:49', '2019-10-23 04:39:15'),
(19, '100000000', 'Jose', 'Perez', '1980-10-10', '1234-9892992', 'jperez@mail.com', '1234', NULL, NULL, 'Y', '08:00:00', '20:00:00', '2019-08-04 08:01:49', '2019-10-23 04:39:20'),
(20, '1234556778', 'Maria', 'Duarte', '1990-10-10', '10291209321', 'mduarte@mail.com', '1234', NULL, NULL, 'Y', '09:10:00', '20:00:00', '2019-11-06 06:47:28', '2019-11-06 06:49:16'),
(21, '928930029', 'Luis', 'Lopez', '1990-09-12', '102928392', 'llopez@mail.com', '1234', NULL, NULL, 'Y', '10:00:00', '17:00:00', '2019-11-06 06:48:39', '2019-11-06 06:49:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultant_history`
--

CREATE TABLE `consultant_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED DEFAULT NULL,
  `movement_type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consultant_history`
--

INSERT INTO `consultant_history` (`id`, `consultant_id`, `movement_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 18, 'Registro', 'Registro de Asesor', '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(2, 17, 'Inicio de sesión', 'Inicio de Sesión el 24/07/19', '2019-07-24 18:00:27', '2019-07-24 18:00:27'),
(3, 17, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 16:05:19', '2019-07-27 16:05:19'),
(4, 17, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 18:30:46', '2019-07-27 18:30:46'),
(5, 17, 'Inicio de sesión', 'Inicio de Sesión el 28/07/19', '2019-07-29 02:59:57', '2019-07-29 02:59:57'),
(6, 17, 'Inicio de sesión', 'Inicio de Sesión el 28/07/19', '2019-07-29 03:24:25', '2019-07-29 03:24:25'),
(7, 17, 'Inicio de sesión', 'Inicio de Sesión el 28/07/19', '2019-07-29 03:26:10', '2019-07-29 03:26:10'),
(8, 17, 'Actualización de Perfil', 'Modificacion de la informacion de perfil del Asesor el 28/07/19', '2019-07-29 03:39:24', '2019-07-29 03:39:24'),
(9, 17, 'Inicio de sesión', 'Inicio de Sesión el 30/07/19', '2019-07-30 04:06:15', '2019-07-30 04:06:15'),
(10, 17, 'Inicio de sesión', 'Inicio de Sesión el 31/07/19', '2019-07-31 04:30:18', '2019-07-31 04:30:18'),
(11, 15, 'Asesoria solicitada', 'Test test', '2019-08-01 08:01:49', '2019-08-01 08:01:49'),
(12, 15, 'Inicio de sesión', 'Inicio de Sesión el 01/08/19', '2019-08-01 08:03:55', '2019-08-01 08:03:55'),
(13, 15, 'Actualización de Perfil', 'Modificacion de la informacion de perfil del Asesor el 01/08/19', '2019-08-01 08:31:27', '2019-08-01 08:31:27'),
(14, 15, 'Asesoria', 'Asesoria Hola: Aprobada', '2019-08-01 08:54:23', '2019-08-01 08:54:23'),
(15, 15, 'Asesoria', 'Asesoria Prueba 1: Rechazada', '2019-08-01 08:59:50', '2019-08-01 08:59:50'),
(16, 15, 'Asesoria solicitada', 'Hola esta es una prueba remota', '2019-08-02 06:16:16', '2019-08-02 06:16:16'),
(17, 17, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 07:10:41', '2019-08-04 07:10:41'),
(18, 17, 'Actualización de Perfil', 'Modificacion de la informacion de perfil del Asesor el 04/08/19', '2019-08-04 07:55:45', '2019-08-04 07:55:45'),
(19, 17, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 07:56:37', '2019-08-04 07:56:37'),
(20, 19, 'Registro', 'Registro de Asesor', '2019-08-04 08:01:50', '2019-08-04 08:01:50'),
(21, 19, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:02:41', '2019-08-04 08:02:41'),
(22, 17, 'Asesoria solicitada', 'Presupuesto Automatico', '2019-08-07 07:56:39', '2019-08-07 07:56:39'),
(23, 17, 'Asesoria solicitada', 'Otra pureba de consulta', '2019-08-07 07:59:14', '2019-08-07 07:59:14'),
(24, 17, 'Inicio de sesión', 'Inicio de Sesión el 07/08/19', '2019-08-07 08:05:59', '2019-08-07 08:05:59'),
(25, 17, 'Inicio de sesión', 'Inicio de Sesión el 08/08/19', '2019-08-09 03:26:45', '2019-08-09 03:26:45'),
(26, 15, 'Activacion', 'Se ha activado su usuario', '2019-08-10 03:59:59', '2019-08-10 03:59:59'),
(27, 17, 'Activacion', 'Se ha activado su usuario', '2019-08-10 04:14:45', '2019-08-10 04:14:45'),
(28, 15, 'Activacion', 'Se ha activado su usuario', '2019-08-10 04:15:30', '2019-08-10 04:15:30'),
(29, 17, 'Asesoria solicitada', 'Hola', '2019-08-10 07:36:41', '2019-08-10 07:36:41'),
(30, 17, 'Asesoria solicitada', 'Hola', '2019-08-10 07:41:36', '2019-08-10 07:41:36'),
(31, 17, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 07:48:05', '2019-08-10 07:48:05'),
(32, 17, 'Asesoria solicitada', 'Prueba', '2019-08-10 08:08:15', '2019-08-10 08:08:15'),
(33, 17, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 08:13:56', '2019-08-10 08:13:56'),
(34, 17, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 18:31:59', '2019-08-10 18:31:59'),
(35, 17, 'Asesoria solicitada', 'hshshjs', '2019-08-10 19:55:37', '2019-08-10 19:55:37'),
(36, 17, 'Asesoria solicitada', NULL, '2019-08-10 20:01:04', '2019-08-10 20:01:04'),
(37, 17, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 20:02:24', '2019-08-10 20:02:24'),
(38, 17, 'Cuenta Bancaria', 'Adicion de nueva cuenta bancaria.', '2019-08-10 20:03:52', '2019-08-10 20:03:52'),
(39, 17, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 20:09:16', '2019-08-10 20:09:16'),
(40, 17, 'Asesoria', 'Asesoria Nueva Prueba: Aprobada', '2019-08-10 20:09:32', '2019-08-10 20:09:32'),
(41, 17, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-10 20:09:42', '2019-08-10 20:09:42'),
(42, 17, 'Inicio de sesión', 'Inicio de Sesión el 11/08/19', '2019-08-11 08:11:52', '2019-08-11 08:11:52'),
(43, 17, 'Retiro', 'Solicitud de Retiro', '2019-08-11 08:26:00', '2019-08-11 08:26:00'),
(44, 17, 'Retiro', 'Solicitud de Retiro', '2019-08-11 08:31:17', '2019-08-11 08:31:17'),
(45, 17, 'Asesoria solicitada', 'Prueba de contador de la hora', '2019-08-14 04:40:38', '2019-08-14 04:40:38'),
(46, 17, 'Asesoria solicitada', 'Hola', '2019-08-14 04:47:27', '2019-08-14 04:47:27'),
(47, 17, 'Inicio de sesión', 'Inicio de Sesión el 14/08/19', '2019-08-14 08:20:41', '2019-08-14 08:20:41'),
(48, 17, 'Inicio de sesión', 'Inicio de Sesión el 14/08/19', '2019-08-14 08:28:54', '2019-08-14 08:28:54'),
(49, 17, 'Asesoria solicitada', 'Nueva PRueba con nuevo Usuario', '2019-08-15 07:21:37', '2019-08-15 07:21:37'),
(50, 17, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 09:18:34', '2019-08-15 09:18:34'),
(51, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 05:45:04', '2019-08-16 05:45:04'),
(52, 17, 'Asesoria', 'Asesoria Prueba Validando Presupuesto: Aprobada', '2019-08-16 06:04:48', '2019-08-16 06:04:48'),
(53, 17, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-16 06:06:20', '2019-08-16 06:06:20'),
(54, 17, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-16 06:08:12', '2019-08-16 06:08:12'),
(55, 17, 'Asesoria solicitada', 'Prueba', '2019-08-16 06:21:59', '2019-08-16 06:21:59'),
(56, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:53:18', '2019-08-16 06:53:18'),
(57, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:55:19', '2019-08-16 06:55:19'),
(58, 17, 'Asesoria', 'Asesoria Prueba Formato: Aprobada', '2019-08-16 06:55:42', '2019-08-16 06:55:42'),
(59, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:59:21', '2019-08-16 06:59:21'),
(60, 17, 'Asesoria', 'Asesoria Prueba: Aprobada', '2019-08-16 06:59:48', '2019-08-16 06:59:48'),
(61, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:02:01', '2019-08-16 07:02:01'),
(62, 17, 'Asesoria', 'Asesoria Highcharts Demo: Aprobada', '2019-08-16 07:02:23', '2019-08-16 07:02:23'),
(63, 17, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:04:04', '2019-08-16 07:04:04'),
(64, 17, 'Inicio de sesión', 'Inicio de Sesión el 15/10/19', '2019-10-15 06:03:03', '2019-10-15 06:03:03'),
(65, 17, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 04:52:35', '2019-10-22 04:52:35'),
(66, 17, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 07:23:04', '2019-10-22 07:23:04'),
(67, 17, 'Retiro', 'Solicitud de Retiro', '2019-10-22 07:32:48', '2019-10-22 07:32:48'),
(68, 17, 'Inicio de sesión', 'Inicio de Sesión el 23/10/19', '2019-10-23 04:33:48', '2019-10-23 04:33:48'),
(69, 15, 'Activacion', 'Se ha activado su usuario', '2019-10-23 04:39:11', '2019-10-23 04:39:11'),
(70, 18, 'Activacion', 'Se ha activado su usuario', '2019-10-23 04:39:15', '2019-10-23 04:39:15'),
(71, 19, 'Activacion', 'Se ha activado su usuario', '2019-10-23 04:39:20', '2019-10-23 04:39:20'),
(72, 17, 'Inicio de sesión', 'Inicio de Sesión el 29/10/19', '2019-10-29 08:21:54', '2019-10-29 08:21:54'),
(73, 17, 'Inicio de sesión', 'Inicio de Sesión el 29/10/19', '2019-10-29 08:31:55', '2019-10-29 08:31:55'),
(74, 17, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:21:02', '2019-10-31 05:21:02'),
(75, 17, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:37:47', '2019-10-31 05:37:47'),
(76, 17, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:48:32', '2019-10-31 05:48:32'),
(77, 17, 'Retiro', 'Solicitud de Retiro', '2019-10-31 05:48:57', '2019-10-31 05:48:57'),
(78, 17, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:53:13', '2019-10-31 05:53:13'),
(79, 17, 'Asesoria', 'Asesoria Note: Aprobada', '2019-10-31 05:55:14', '2019-10-31 05:55:14'),
(80, 17, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 07:35:19', '2019-11-01 07:35:19'),
(81, 17, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 09:18:02', '2019-11-01 09:18:02'),
(82, 17, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 09:39:03', '2019-11-01 09:39:03'),
(83, 20, 'Registro', 'Registro de Asesor', '2019-11-06 06:47:28', '2019-11-06 06:47:28'),
(84, 21, 'Registro', 'Registro de Asesor', '2019-11-06 06:48:39', '2019-11-06 06:48:39'),
(85, 20, 'Activacion', 'Se ha activado su usuario', '2019-11-06 06:49:16', '2019-11-06 06:49:16'),
(86, 21, 'Activacion', 'Se ha activado su usuario', '2019-11-06 06:49:21', '2019-11-06 06:49:21'),
(87, 17, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 07:22:21', '2019-11-06 07:22:21'),
(88, 17, 'Asesoria solicitada', 'asdasd', '2019-11-08 01:18:17', '2019-11-08 01:18:17'),
(89, 17, 'Asesoria solicitada', 'ASFD', '2019-11-08 01:36:21', '2019-11-08 01:36:21'),
(90, 17, 'Inicio de sesión', 'Inicio de Sesión el 07/11/19', '2019-11-08 01:57:56', '2019-11-08 01:57:56'),
(91, 17, 'Cuenta Bancaria', 'Adicion de nueva cuenta bancaria.', '2019-11-08 01:58:43', '2019-11-08 01:58:43'),
(92, 17, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-11 15:18:09', '2019-11-11 15:18:09'),
(93, 17, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-12 03:41:30', '2019-11-12 03:41:30'),
(94, 17, 'Inicio de sesión', 'Inicio de Sesión el 26/11/19', '2019-11-26 04:45:43', '2019-11-26 04:45:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datings`
--

CREATE TABLE `datings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `consultant_id` int(10) UNSIGNED DEFAULT NULL,
  `for_date` timestamp NULL DEFAULT NULL,
  `time_from` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_up` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `dating_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conference_room_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datings`
--

INSERT INTO `datings` (`id`, `user_id`, `consultant_id`, `for_date`, `time_from`, `time_up`, `title`, `summary`, `price`, `dating_status`, `conference_room_url`, `created_at`, `updated_at`) VALUES
(1, 9, 15, '2019-10-11 02:00:00', '22:00', '23:00', 'Prueba 1', 'Pruebsa 1', '0', 'Rechazada', NULL, '2019-07-25 02:03:27', '2019-08-01 08:59:49'),
(2, 9, 17, '2019-10-11 02:10:00', '22:00', '23:00', 'Prueba 2', 'Prueba 2', '0', 'Cancelada', NULL, '2019-07-25 02:22:34', '2019-08-07 07:39:26'),
(3, 9, 17, '2019-08-24 15:00:00', '22:00', '23:00', 'Solicitud de Asesoria', 'Necesito una asesoria.', '0', 'Cancelada', NULL, '2019-07-25 02:26:38', '2019-08-07 07:37:18'),
(4, 9, 15, '1970-01-01 16:00:00', '22:00', '23:00', 'Hola', 'Que', '1000', 'Finalizada', NULL, '2019-07-27 15:56:58', '2019-08-16 06:43:08'),
(5, 9, 17, '2019-07-29 14:00:00', '22:00', '23:00', 'Note', 'Cita de Prueba', '0', 'Cancelada', NULL, '2019-07-27 18:30:05', '2019-08-07 07:38:56'),
(6, 9, 15, '2019-08-10 04:00:00', '10:00', '11:10', 'Highcharts Demo', 'Test test', '1000', 'Cancelada', NULL, '2019-08-01 08:01:47', '2019-08-10 08:11:31'),
(7, NULL, 15, '2019-08-08 04:00:00', '10:00', '12:00', 'Prueba Remota', 'Hola esta es una prueba remota', '1000', 'Solicitado', NULL, '2019-08-02 06:16:16', '2019-08-02 06:16:16'),
(8, NULL, 17, '2019-08-13 04:00:00', '13:00', '15:00', 'Prueba de Consulta', 'Presupuesto Automatico', '20', 'Solicitado', NULL, '2019-08-07 07:56:39', '2019-08-07 07:56:39'),
(9, 9, 17, '2019-10-10 04:00:00', '10:00', '15:00', 'Nueva Prueba', 'Otra pureba de consulta', '50', 'Cancelada', NULL, '2019-08-07 07:59:14', '2019-08-16 06:53:02'),
(10, 9, 17, '2019-08-15 04:00:00', '10:00', '15:00', 'Prueba Validando Presupuesto', 'Hola', '50', 'Cancelada', NULL, '2019-08-10 07:36:40', '2019-08-16 06:58:23'),
(11, 9, 17, '2019-09-20 04:00:00', '10:00', '11:00', 'Segunda Prueba hoy', 'Hola', '10', 'Cancelada', NULL, '2019-08-10 07:41:36', '2019-08-10 08:12:35'),
(12, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Cancelada', NULL, '2019-08-10 08:06:44', '2019-08-16 06:54:48'),
(13, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Aprobada', NULL, '2019-08-10 08:07:29', '2019-08-16 06:06:20'),
(14, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Aprobada', 'https://hangouts.google.com/call/vT8exSjXHFeizLNbVgShAEEE?no_rd', '2019-08-10 08:08:11', '2019-08-16 06:08:12'),
(15, 9, 17, '2019-10-10 04:00:00', '10:00', '12:00', 'Group', 'hshshjs', '20', 'Cancelada', NULL, '2019-08-10 19:55:37', '2019-08-10 19:56:49'),
(16, 9, 17, '2019-08-11 04:00:00', '10:00', '12:00', NULL, NULL, '20', 'Cancelada', NULL, '2019-08-10 20:01:03', '2019-08-10 20:01:31'),
(17, 9, 17, '2019-10-10 04:00:00', '10:00', '13:0', 'Prueba', 'Prueba de contador de la hora', '120000', 'Aprobada', 'https://hangouts.google.com/call/hK6A1iIjUMTVic2ewst5AEEE?no_rd', '2019-08-14 04:40:37', '2019-08-16 06:59:47'),
(18, 9, 17, '2019-10-10 04:00:00', '10:10', '11:10', 'Prueba Formato', 'Hola', '40000', 'Cancelada', 'https://hangouts.google.com/call/hK6A1iIjUMTVic2ewst5AEEE?no_rd', '2019-08-14 04:47:26', '2019-08-16 06:56:58'),
(19, 10, 17, '2019-08-19 04:00:00', '10:00', '11:00', 'Highcharts Demo', 'Nueva PRueba con nuevo Usuario', '40000', 'Finalizada', 'https://hangouts.google.com/call/hK6A1iIjUMTVic2ewst5AEEE?no_rd', '2019-08-15 07:21:36', '2019-08-16 07:03:47'),
(20, 9, 17, '2019-08-17 04:00:00', '12:00', '13:00', 'Note', 'Prueba', '40000', 'Aprobada', 'asdfghjk', '2019-08-16 06:21:58', '2019-10-31 05:55:14'),
(21, 9, 17, '2019-11-08 04:00:00', '14:00', '1:00', 'asd', 'asdasd', '80000', 'Solicitado', NULL, '2019-11-08 01:18:16', '2019-11-08 01:18:16'),
(22, 9, 17, '2019-11-07 04:00:00', '22:30', '23:30', 'Note Status test', 'ASFD', '40000', 'Solicitado', NULL, '2019-11-08 01:36:20', '2019-11-08 01:36:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `document` varchar(256) DEFAULT NULL,
  `referenceno` varchar(200) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `bank_from` varchar(256) DEFAULT NULL,
  `deposit_status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `amount`, `document`, `referenceno`, `payment_method`, `bank_from`, `deposit_status`, `created_at`, `updated_at`) VALUES
(9, 9, '200', '52684422_2231854323750791_6293877017230180352_n0908092019144.jpg', '00009102223', 'Transferencia', 'Banco Plaza Banco Universal', 'A', '2019-08-09 05:44:43', '2019-08-10 07:27:31'),
(10, 9, '300', 'DR__153243929656710081020191557.jpeg', '00000001', 'Pago Movil', 'Banco Provincial, S.A. Banco Universal', 'A', '2019-08-10 19:57:48', '2019-08-10 19:59:20'),
(11, 9, '200000', '1 pago trasnferencia1408142019037.PNG', '2388398298289298', 'Pago Movil', 'Bancaribe C.A. Banco Universal', 'A', '2019-08-14 04:37:19', '2019-08-14 04:38:14'),
(12, 10, '1000000', '1 cuenta josue1508152019320.PNG', '109920111', 'Transferencia', 'Banco Sofitasa Banco Universal', 'A', '2019-08-15 07:20:00', '2019-08-15 07:20:25'),
(13, 9, '100000', '45671271_10217093662964123_3732994851365453824_n2210222019316.jpg', '34344500', 'Transferencia', 'Banco de Venezuela S.A.C.A. Banco Universal', 'A', '2019-10-22 07:16:22', '2019-10-22 07:35:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `error_reports`
--

CREATE TABLE `error_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `error_title` varchar(100) NOT NULL,
  `error_description` varchar(256) NOT NULL,
  `dating_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history_user`
--

CREATE TABLE `history_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `movement_type` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `history_user`
--

INSERT INTO `history_user` (`id`, `user_id`, `movement_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 9, 'Registro', 'Registro de usuario', '2019-07-19 08:10:21', '2019-07-19 08:10:21'),
(2, 9, 'Inicio de sesión', 'Inicio de Sesión el 23/07/19', '2019-07-23 16:56:37', '2019-07-23 16:56:37'),
(3, 9, 'Inicio de sesión', 'Inicio de Sesión el 23/07/19', '2019-07-23 17:29:21', '2019-07-23 17:29:21'),
(4, 9, 'Inicio de sesión', 'Inicio de Sesión el 23/07/19', '2019-07-24 02:41:58', '2019-07-24 02:41:58'),
(5, 9, 'Inicio de sesión', 'Inicio de Sesión el 24/07/19', '2019-07-24 18:06:37', '2019-07-24 18:06:37'),
(6, 9, 'Inicio de sesión', 'Inicio de Sesión el 24/07/19', '2019-07-25 00:54:47', '2019-07-25 00:54:47'),
(7, 9, 'Solicitud de Asesoria', 'Prueba 2', '2019-07-25 02:22:34', '2019-07-25 02:22:34'),
(8, 9, 'Solicitud de Asesoria', 'Necesito una asesoria.', '2019-07-25 02:26:38', '2019-07-25 02:26:38'),
(9, 9, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 15:20:21', '2019-07-27 15:20:21'),
(10, NULL, 'Solicitud de Asesoria', 'Que', '2019-07-27 15:57:00', '2019-07-27 15:57:00'),
(11, 9, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 18:28:47', '2019-07-27 18:28:47'),
(12, 9, 'Solicitud de Asesoria', 'Cita de Prueba', '2019-07-27 18:30:05', '2019-07-27 18:30:05'),
(13, 9, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 18:32:04', '2019-07-27 18:32:04'),
(14, 9, 'Inicio de sesión', 'Inicio de Sesión el 01/08/19', '2019-08-01 07:43:22', '2019-08-01 07:43:22'),
(15, 9, 'Solicitud de Asesoria', 'Test test', '2019-08-01 08:01:48', '2019-08-01 08:01:48'),
(16, 9, 'Asesoria', 'Asesoria Hola: Aprobada', '2019-08-01 08:54:23', '2019-08-01 08:54:23'),
(17, 9, 'Asesoria', 'Asesoria Prueba 1: Rechazada', '2019-08-01 08:59:50', '2019-08-01 08:59:50'),
(18, 9, 'Inicio de sesión', 'Inicio de Sesión el 01/08/19', '2019-08-01 09:00:30', '2019-08-01 09:00:30'),
(19, 9, 'Inicio de sesión', 'Inicio de Sesión el 02/08/19', '2019-08-02 06:14:35', '2019-08-02 06:14:35'),
(20, NULL, 'Solicitud de Asesoria', 'Hola esta es una prueba remota', '2019-08-02 06:16:16', '2019-08-02 06:16:16'),
(21, 9, 'Inicio de sesión', 'Inicio de Sesión el 02/08/19', '2019-08-02 06:19:10', '2019-08-02 06:19:10'),
(22, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 07:09:13', '2019-08-04 07:09:13'),
(23, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:07:11', '2019-08-04 08:07:11'),
(24, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:45:46', '2019-08-04 08:45:46'),
(25, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:48:30', '2019-08-04 08:48:30'),
(26, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:49:30', '2019-08-04 08:49:30'),
(27, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:51:12', '2019-08-04 08:51:12'),
(28, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:53:14', '2019-08-04 08:53:14'),
(29, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:53:59', '2019-08-04 08:53:59'),
(30, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 08:55:29', '2019-08-04 08:55:29'),
(31, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 09:03:02', '2019-08-04 09:03:02'),
(32, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 22:42:38', '2019-08-04 22:42:38'),
(33, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 23:17:20', '2019-08-04 23:17:20'),
(34, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 23:39:02', '2019-08-04 23:39:02'),
(35, 9, 'Inicio de sesión', 'Inicio de Sesión el 04/08/19', '2019-08-04 23:56:05', '2019-08-04 23:56:05'),
(36, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/08/19', '2019-08-06 08:28:31', '2019-08-06 08:28:31'),
(37, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/08/19', '2019-08-06 08:30:39', '2019-08-06 08:30:39'),
(38, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/08/19', '2019-08-06 10:04:07', '2019-08-06 10:04:07'),
(39, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/08/19', '2019-08-06 10:47:27', '2019-08-06 10:47:27'),
(40, 9, 'Inicio de sesión', 'Inicio de Sesión el 07/08/19', '2019-08-07 04:07:43', '2019-08-07 04:07:43'),
(41, 9, 'Inicio de sesión', 'Inicio de Sesión el 07/08/19', '2019-08-07 06:17:47', '2019-08-07 06:17:47'),
(42, NULL, 'Solicitud de Asesoria', 'Presupuesto Automatico', '2019-08-07 07:56:39', '2019-08-07 07:56:39'),
(43, 9, 'Solicitud de Asesoria', 'Otra pureba de consulta', '2019-08-07 07:59:14', '2019-08-07 07:59:14'),
(44, 9, 'Actualización de Perfil', 'Modificacion de la informacion de perfil de usuario el 07/08/19', '2019-08-07 08:00:27', '2019-08-07 08:00:27'),
(45, 9, 'Inicio de sesión', 'Inicio de Sesión el 08/08/19', '2019-08-09 03:31:52', '2019-08-09 03:31:52'),
(46, 2, 'Inicio de sesión', 'Inicio de Sesión el 08/08/19', '2019-08-09 03:40:14', '2019-08-09 03:40:14'),
(47, 9, 'Inicio de sesión', 'Inicio de Sesión el 09/08/19', '2019-08-09 05:22:18', '2019-08-09 05:22:18'),
(48, 9, 'Deposito', 'Ingreso de deposito por 1000$, el09/08/19', '2019-08-09 05:40:58', '2019-08-09 05:40:58'),
(49, 9, 'Deposito', 'Ingreso de deposito por 40000$, el09/08/19', '2019-08-09 05:43:28', '2019-08-09 05:43:28'),
(50, 9, 'Deposito', 'Ingreso de deposito por 200$, el09/08/19', '2019-08-09 05:44:44', '2019-08-09 05:44:44'),
(51, 2, 'Inicio de sesión', 'Inicio de Sesión el 09/08/19', '2019-08-10 02:54:59', '2019-08-10 02:54:59'),
(52, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 04:10:02', '2019-08-10 04:10:02'),
(53, 2, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 04:13:08', '2019-08-10 04:13:08'),
(54, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 04:18:17', '2019-08-10 04:18:17'),
(55, 2, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 04:19:05', '2019-08-10 04:19:05'),
(56, 9, 'Deposito', 'Deposito 00009102223 Aprobado', '2019-08-10 07:26:46', '2019-08-10 07:26:46'),
(57, 9, 'Deposito', 'Deposito 00009102223 Aprobado', '2019-08-10 07:27:34', '2019-08-10 07:27:34'),
(58, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 07:27:59', '2019-08-10 07:27:59'),
(59, 9, 'Solicitud de Asesoria', 'Hola', '2019-08-10 07:36:40', '2019-08-10 07:36:40'),
(60, 9, 'Solicitud de Asesoria', 'Hola', '2019-08-10 07:41:36', '2019-08-10 07:41:36'),
(61, 2, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 07:55:39', '2019-08-10 07:55:39'),
(62, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 08:06:08', '2019-08-10 08:06:08'),
(63, 9, 'Solicitud de Asesoria', 'Prueba', '2019-08-10 08:08:15', '2019-08-10 08:08:15'),
(64, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-09-20 00:00:00', '2019-08-10 08:12:40', '2019-08-10 08:12:40'),
(65, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 18:27:44', '2019-08-10 18:27:44'),
(66, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 19:54:58', '2019-08-10 19:54:58'),
(67, 9, 'Solicitud de Asesoria', 'hshshjs', '2019-08-10 19:55:37', '2019-08-10 19:55:37'),
(68, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-10-10 00:00:00', '2019-08-10 19:56:55', '2019-08-10 19:56:55'),
(69, 9, 'Deposito', 'Ingreso de deposito por 300$, el10/08/19', '2019-08-10 19:57:49', '2019-08-10 19:57:49'),
(70, 2, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 19:58:09', '2019-08-10 19:58:09'),
(71, 9, 'Deposito', 'Deposito 00000001 Aprobado', '2019-08-10 19:59:21', '2019-08-10 19:59:21'),
(72, 9, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 19:59:40', '2019-08-10 19:59:40'),
(73, 9, 'Solicitud de Asesoria', NULL, '2019-08-10 20:01:03', '2019-08-10 20:01:03'),
(74, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-08-11 00:00:00', '2019-08-10 20:01:31', '2019-08-10 20:01:31'),
(75, 2, 'Inicio de sesión', 'Inicio de Sesión el 10/08/19', '2019-08-10 20:07:06', '2019-08-10 20:07:06'),
(76, 9, 'Asesoria', 'Asesoria Nueva Prueba: Aprobada', '2019-08-10 20:09:32', '2019-08-10 20:09:32'),
(77, 9, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-10 20:09:42', '2019-08-10 20:09:42'),
(78, 2, 'Inicio de sesión', 'Inicio de Sesión el 11/08/19', '2019-08-11 08:48:16', '2019-08-11 08:48:16'),
(79, 2, 'Inicio de sesión', 'Inicio de Sesión el 13/08/19', '2019-08-13 10:27:10', '2019-08-13 10:27:10'),
(80, 9, 'Inicio de sesión', 'Inicio de Sesión el 13/08/19', '2019-08-14 03:41:39', '2019-08-14 03:41:39'),
(81, 9, 'Deposito', 'Ingreso de deposito por 200000$, el14/08/19', '2019-08-14 04:37:19', '2019-08-14 04:37:19'),
(82, 2, 'Inicio de sesión', 'Inicio de Sesión el 14/08/19', '2019-08-14 04:37:59', '2019-08-14 04:37:59'),
(83, 9, 'Deposito', 'Deposito 2388398298289298 Aprobado', '2019-08-14 04:38:15', '2019-08-14 04:38:15'),
(84, 9, 'Inicio de sesión', 'Inicio de Sesión el 14/08/19', '2019-08-14 04:39:01', '2019-08-14 04:39:01'),
(85, 9, 'Solicitud de Asesoria', 'Prueba de contador de la hora', '2019-08-14 04:40:38', '2019-08-14 04:40:38'),
(86, 9, 'Solicitud de Asesoria', 'Hola', '2019-08-14 04:47:27', '2019-08-14 04:47:27'),
(87, 9, 'Inicio de sesión', 'Inicio de Sesión el 14/08/19', '2019-08-14 08:28:23', '2019-08-14 08:28:23'),
(88, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 04:27:50', '2019-08-15 04:27:50'),
(89, 9, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 06:57:49', '2019-08-15 06:57:49'),
(90, 9, 'Actualización de Perfil', 'Modificacion de la informacion de perfil de usuario el 15/08/19', '2019-08-15 06:59:51', '2019-08-15 06:59:51'),
(91, 10, 'Registro', 'Registro de usuario', '2019-08-15 07:17:44', '2019-08-15 07:17:44'),
(92, 10, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 07:17:58', '2019-08-15 07:17:58'),
(93, 10, 'Deposito', 'Ingreso de deposito por 1000000$, el15/08/19', '2019-08-15 07:20:00', '2019-08-15 07:20:00'),
(94, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 07:20:17', '2019-08-15 07:20:17'),
(95, 10, 'Deposito', 'Deposito 109920111 Aprobado', '2019-08-15 07:20:25', '2019-08-15 07:20:25'),
(96, 10, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 07:20:38', '2019-08-15 07:20:38'),
(97, 10, 'Solicitud de Asesoria', 'Nueva PRueba con nuevo Usuario', '2019-08-15 07:21:37', '2019-08-15 07:21:37'),
(98, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 07:23:32', '2019-08-15 07:23:32'),
(99, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 09:06:45', '2019-08-15 09:06:45'),
(100, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 09:08:42', '2019-08-15 09:08:42'),
(101, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 09:09:42', '2019-08-15 09:09:42'),
(102, 9, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-15 09:20:04', '2019-08-15 09:20:04'),
(103, 2, 'Inicio de sesión', 'Inicio de Sesión el 15/08/19', '2019-08-16 02:36:38', '2019-08-16 02:36:38'),
(104, 9, 'Asesoria', 'Asesoria Prueba Validando Presupuesto: Aprobada', '2019-08-16 06:04:48', '2019-08-16 06:04:48'),
(105, 9, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-16 06:06:20', '2019-08-16 06:06:20'),
(106, 9, 'Asesoria', 'Asesoria Pureb: Aprobada', '2019-08-16 06:08:12', '2019-08-16 06:08:12'),
(107, 9, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:11:19', '2019-08-16 06:11:19'),
(108, 9, 'Solicitud de Asesoria', 'Prueba', '2019-08-16 06:21:59', '2019-08-16 06:21:59'),
(109, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 1970-01-01 12:00:00', '2019-08-16 06:40:34', '2019-08-16 06:40:34'),
(110, 9, 'Cierre de Asesoria.', 'Cierre de una asesoria para el dia 1970-01-01 12:00:00', '2019-08-16 06:43:09', '2019-08-16 06:43:09'),
(111, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-10-10 00:00:00', '2019-08-16 06:53:03', '2019-08-16 06:53:03'),
(112, 9, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:54:27', '2019-08-16 06:54:27'),
(113, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-10-10 00:00:00', '2019-08-16 06:54:48', '2019-08-16 06:54:48'),
(114, 9, 'Asesoria', 'Asesoria Prueba Formato: Aprobada', '2019-08-16 06:55:42', '2019-08-16 06:55:42'),
(115, 9, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 06:56:30', '2019-08-16 06:56:30'),
(116, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-10-10 00:00:00', '2019-08-16 06:56:59', '2019-08-16 06:56:59'),
(117, 9, 'Cancelacion de Asesoria.', 'Cancelo una solicitud de asesoria para el dia 2019-08-15 00:00:00', '2019-08-16 06:58:23', '2019-08-16 06:58:23'),
(118, 9, 'Asesoria', 'Asesoria Prueba: Aprobada', '2019-08-16 06:59:47', '2019-08-16 06:59:47'),
(119, 9, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:00:07', '2019-08-16 07:00:07'),
(120, 10, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:00:42', '2019-08-16 07:00:42'),
(121, 10, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:01:15', '2019-08-16 07:01:15'),
(122, 10, 'Asesoria', 'Asesoria Highcharts Demo: Aprobada', '2019-08-16 07:02:23', '2019-08-16 07:02:23'),
(123, 10, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:02:40', '2019-08-16 07:02:40'),
(124, 10, 'Cierre de Asesoria.', 'Cierre de una asesoria para el dia 2019-08-19 00:00:00', '2019-08-16 07:03:48', '2019-08-16 07:03:48'),
(125, 2, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:24:17', '2019-08-16 07:24:17'),
(126, 2, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 07:36:53', '2019-08-16 07:36:53'),
(127, 2, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 09:00:43', '2019-08-16 09:00:43'),
(128, 2, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 09:03:09', '2019-08-16 09:03:09'),
(129, 2, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 09:28:30', '2019-08-16 09:28:30'),
(130, 9, 'Inicio de sesión', 'Inicio de Sesión el 16/08/19', '2019-08-16 09:51:28', '2019-08-16 09:51:28'),
(131, 9, 'Inicio de sesión', 'Inicio de Sesión el 14/10/19', '2019-10-14 18:18:52', '2019-10-14 18:18:52'),
(132, 11, 'Registro', 'Registro de usuario', '2019-10-15 03:44:25', '2019-10-15 03:44:25'),
(133, 12, 'Registro', 'Registro de usuario', '2019-10-15 03:47:12', '2019-10-15 03:47:12'),
(134, 13, 'Registro', 'Registro de usuario', '2019-10-15 04:27:52', '2019-10-15 04:27:52'),
(135, 2, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 05:38:22', '2019-10-22 05:38:22'),
(136, 9, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 06:41:52', '2019-10-22 06:41:52'),
(137, 9, 'Deposito', 'Ingreso de deposito por 100000$, el22/10/19', '2019-10-22 07:16:23', '2019-10-22 07:16:23'),
(138, 2, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 07:33:08', '2019-10-22 07:33:08'),
(139, 9, 'Deposito', 'Deposito 34344500 Aprobado', '2019-10-22 07:35:56', '2019-10-22 07:35:56'),
(140, 2, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 07:58:14', '2019-10-22 07:58:14'),
(141, 9, 'Inicio de sesión', 'Inicio de Sesión el 22/10/19', '2019-10-22 08:02:24', '2019-10-22 08:02:24'),
(142, 9, 'Inicio de sesión', 'Inicio de Sesión el 23/10/19', '2019-10-23 04:34:12', '2019-10-23 04:34:12'),
(143, 2, 'Inicio de sesión', 'Inicio de Sesión el 23/10/19', '2019-10-23 04:38:57', '2019-10-23 04:38:57'),
(144, 9, 'Inicio de sesión', 'Inicio de Sesión el 23/10/19', '2019-10-23 06:20:42', '2019-10-23 06:20:42'),
(145, 9, 'Inicio de sesión', 'Inicio de Sesión el 29/10/19', '2019-10-29 08:33:07', '2019-10-29 08:33:07'),
(146, 9, 'Inicio de sesión', 'Inicio de Sesión el 30/10/19', '2019-10-31 03:49:01', '2019-10-31 03:49:01'),
(147, 2, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:37:01', '2019-10-31 05:37:01'),
(148, 2, 'Inicio de sesión', 'Inicio de Sesión el 31/10/19', '2019-10-31 05:49:13', '2019-10-31 05:49:13'),
(149, 9, 'Asesoria', 'Asesoria Note: Aprobada', '2019-10-31 05:55:14', '2019-10-31 05:55:14'),
(150, 2, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 08:00:13', '2019-11-01 08:00:13'),
(151, 2, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 09:57:56', '2019-11-01 09:57:56'),
(152, 2, 'Inicio de sesión', 'Inicio de Sesión el 01/11/19', '2019-11-01 10:14:26', '2019-11-01 10:14:26'),
(153, 2, 'Inicio de sesión', 'Inicio de Sesión el 04/11/19', '2019-11-05 02:32:34', '2019-11-05 02:32:34'),
(154, 2, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 05:30:20', '2019-11-06 05:30:20'),
(155, 2, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 06:35:00', '2019-11-06 06:35:00'),
(156, 2, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 06:35:02', '2019-11-06 06:35:02'),
(157, 2, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 06:48:58', '2019-11-06 06:48:58'),
(158, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 06:50:46', '2019-11-06 06:50:46'),
(159, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 06:59:12', '2019-11-06 06:59:12'),
(160, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 07:03:51', '2019-11-06 07:03:51'),
(161, 9, 'Inicio de sesión', 'Inicio de Sesión el 06/11/19', '2019-11-06 07:30:40', '2019-11-06 07:30:40'),
(162, 9, 'Inicio de sesión', 'Inicio de Sesión el 07/11/19', '2019-11-08 00:59:10', '2019-11-08 00:59:10'),
(163, 9, 'Solicitud de Asesoria', 'asdasd', '2019-11-08 01:18:17', '2019-11-08 01:18:17'),
(164, 2, 'Inicio de sesión', 'Inicio de Sesión el 07/11/19', '2019-11-08 01:20:18', '2019-11-08 01:20:18'),
(165, 9, 'Inicio de sesión', 'Inicio de Sesión el 07/11/19', '2019-11-08 01:25:19', '2019-11-08 01:25:19'),
(166, 9, 'Solicitud de Asesoria', 'ASFD', '2019-11-08 01:36:21', '2019-11-08 01:36:21'),
(167, 2, 'Inicio de sesión', 'Inicio de Sesión el 07/11/19', '2019-11-08 02:24:04', '2019-11-08 02:24:04'),
(168, 9, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-11 13:07:57', '2019-11-11 13:07:57'),
(169, 9, 'Enlace Caido', 'El usuario no ha podido entrar a la sala de conferencia.', '2019-11-11 14:36:21', '2019-11-11 14:36:21'),
(170, 9, 'Entrada a sala de conferencia', 'El usuario ha entrado al link de sala de conferencia, pare recibir su asesoria.', '2019-11-11 14:37:37', '2019-11-11 14:37:37'),
(171, 2, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-11 14:39:25', '2019-11-11 14:39:25'),
(172, 2, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-11 14:47:20', '2019-11-11 14:47:20'),
(173, 11, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-11 15:19:17', '2019-11-11 15:19:17'),
(174, 2, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-12 01:02:23', '2019-11-12 01:02:23'),
(175, 9, 'Inicio de sesión', 'Inicio de Sesión el 11/11/19', '2019-11-12 03:11:36', '2019-11-12 03:11:36'),
(176, 12, 'Inicio de sesión', 'Inicio de Sesión el 14/11/19', '2019-11-14 23:00:01', '2019-11-14 23:00:01'),
(177, 9, 'Inicio de sesión', 'Inicio de Sesión el 14/11/19', '2019-11-14 23:19:06', '2019-11-14 23:19:06'),
(178, 9, 'Inicio de sesión', 'Inicio de Sesión el 25/11/19', '2019-11-26 01:23:47', '2019-11-26 01:23:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_22_154324_create_test', 1),
(4, '2019_06_22_161644_create_roles', 1),
(5, '2019_06_22_161719_create_activity_logs', 1),
(6, '2019_06_22_162857_create_datings', 1),
(7, '2019_06_22_164627_create_consultants', 1),
(8, '2019_06_22_164644_create_careers', 1),
(9, '2019_06_22_212933_create_career_consultant', 1),
(10, '2019_06_22_214212_create_user_role', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parameters`
--

CREATE TABLE `parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `parameters`
--

INSERT INTO `parameters` (`id`, `name`, `description`, `value`, `created_at`, `updated_at`) VALUES
(2, 'Salario_Asesores', 'Honorario por hora para los asesores', '40000', '2019-08-13 10:57:10', '2019-08-13 10:57:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `dating_id` int(10) UNSIGNED DEFAULT NULL,
  `dating_amount` decimal(10,0) DEFAULT NULL,
  `payment_status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `payments`
--

INSERT INTO `payments` (`id`, `dating_id`, `dating_amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 14, '40', 'P', '2019-08-10 08:08:13', '2019-08-10 08:08:13'),
(2, 15, '20', 'A', '2019-08-10 19:55:37', '2019-08-10 19:56:55'),
(3, 16, '20', 'A', '2019-08-10 20:01:03', '2019-08-10 20:01:31'),
(4, 17, '120000', 'P', '2019-08-14 04:40:37', '2019-08-14 04:40:37'),
(5, 18, '40000', 'A', '2019-08-14 04:47:27', '2019-08-16 06:56:59'),
(6, 19, '40000', 'PG', '2019-08-15 07:21:37', '2019-08-16 07:03:48'),
(7, 20, '40000', 'P', '2019-08-16 06:21:59', '2019-08-16 06:21:59'),
(8, 21, '80000', 'P', '2019-11-08 01:18:17', '2019-11-08 01:18:17'),
(9, 22, '40000', 'P', '2019-11-08 01:36:21', '2019-11-08 01:36:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `retirement`
--

CREATE TABLE `retirement` (
  `id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `retirement_status` varchar(100) DEFAULT NULL,
  `bank_to` varchar(200) DEFAULT NULL,
  `referenceno` varchar(100) DEFAULT NULL,
  `document` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `retirement`
--

INSERT INTO `retirement` (`id`, `consultant_id`, `amount`, `retirement_status`, `bank_to`, `referenceno`, `document`, `created_at`, `updated_at`) VALUES
(1, 17, '1000', 'R', 'Banesco', NULL, NULL, '2019-08-11 08:25:58', '2019-08-16 08:33:13'),
(2, 17, '100', 'A', 'Banco Provincial', '123455', '1 pago trasnferencia1608162019424.PNG', '2019-08-11 08:31:17', '2019-08-16 08:24:55'),
(3, 17, '10000', 'A', 'Banco Provincial, S.A. Banco Universal', '1234344', '45671271_10217093662964123_3732994851365453824_n3110312019137.jpg', '2019-10-22 07:32:48', '2019-10-31 05:37:28'),
(4, 17, '10000', 'A', 'Banco Provincial, S.A. Banco Universal', '00000001', '45671271_10217093662964123_3732994851365453824_n3110312019152.jpg', '2019-10-31 05:48:56', '2019-10-31 05:52:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 'AD', '2019-06-23 02:34:28', '2019-06-23 02:34:28'),
(2, 'Usuario', 'US', '2019-06-23 02:35:23', '2019-06-23 02:35:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tests`
--

CREATE TABLE `tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transactions_user`
--

CREATE TABLE `transactions_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_type` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `movement_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `transactions_user`
--

INSERT INTO `transactions_user` (`id`, `user_id`, `transaction_type`, `movement_id`, `created_at`, `updated_at`) VALUES
(1, 9, 'Pago', 5, '2019-07-24 18:27:16', '2019-07-24 18:27:16'),
(2, 9, 'Deposito', 6, '2019-07-27 18:32:32', '2019-07-27 18:32:32'),
(3, 9, 'Deposito', 7, '2019-08-09 05:41:00', '2019-08-09 05:41:00'),
(4, 9, 'Deposito', 8, '2019-08-09 05:43:28', '2019-08-09 05:43:28'),
(5, 9, 'Deposito', 9, '2019-08-09 05:44:46', '2019-08-09 05:44:46'),
(6, 9, 'Deposito', 10, '2019-08-10 19:57:49', '2019-08-10 19:57:49'),
(7, 9, 'Deposito', 11, '2019-08-14 04:37:20', '2019-08-14 04:37:20'),
(8, 10, 'Deposito', 12, '2019-08-15 07:20:00', '2019-08-15 07:20:00'),
(9, 9, 'Deposito', 13, '2019-10-22 07:16:23', '2019-10-22 07:16:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `identification_document` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach_document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `identification_document`, `name`, `lastname`, `birthdate`, `phone_number`, `attach_document`, `state`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123456', 'Josue', 'Martinez', '1010-10-10', '299930', NULL, 'Carabobo', 'jmartinezm@intelix.biz', '1234', NULL, '2019-07-15 01:32:35', '2019-07-15 01:32:35'),
(2, '1000000', 'Administrador', 'Administrador', '2019-07-14', NULL, NULL, 'Aragua', 'admin', 'admin', NULL, NULL, '2019-08-15 09:16:40'),
(6, '1234555', 'Nuevo', 'Usuario', '1000-10-10', '10290192', NULL, 'Carabobo', 'nuevo@mail.com', '1234', NULL, '2019-07-19 07:50:46', '2019-07-19 07:50:46'),
(9, '24537817', 'Josue', 'Martinez', '1010-10-10', '0292019', NULL, 'Apure', 'pruabuser@mail.com', '1234', NULL, '2019-07-19 08:10:14', '2019-07-19 08:10:14'),
(10, '1788299', 'Andres', 'Lopez', '1995-10-10', '1034-1829038', NULL, 'Anzoátegui', 'alopez@mail.com', '1234', NULL, '2019-08-15 07:17:43', '2019-08-15 07:17:43'),
(11, 'asdasd', 'asd', 'asd', '2018-10-29', '04124310425', NULL, 'Distrito Capital', 'pruabuseddr@mail.com', '1234', NULL, '2019-10-15 03:44:24', '2019-10-15 03:44:24'),
(12, 'sadasd', 'Jose', 'Bolivar', '2019-10-01', '12341234567', NULL, 'Carabobo', 'pruabusedr@mail.com', '1234', NULL, '2019-10-15 03:47:12', '2019-10-15 03:47:12'),
(13, 'asdasdasd', 'dfgfdg', 'dfgfdg', '2019-10-15', '04124310425', NULL, 'Guárico', 'pruaddbusedr@mail.com', '1234', NULL, '2019-10-15 04:27:52', '2019-10-15 04:27:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-07-15 01:32:36', '2019-07-15 01:32:36'),
(2, 1, '2019-07-14 04:00:00', '2019-07-14 04:00:00'),
(6, 2, '2019-07-19 07:50:50', '2019-07-19 07:50:50'),
(9, 2, '2019-07-19 08:10:17', '2019-07-19 08:10:17'),
(10, 2, '2019-08-15 07:17:43', '2019-08-15 07:17:43'),
(11, 2, '2019-10-15 03:44:25', '2019-10-15 03:44:25'),
(12, 2, '2019-10-15 03:47:12', '2019-10-15 03:47:12'),
(13, 2, '2019-10-15 04:27:52', '2019-10-15 04:27:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `account_consultants`
--
ALTER TABLE `account_consultants`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `advisory_report`
--
ALTER TABLE `advisory_report`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `attached`
--
ALTER TABLE `attached`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `balance_consultants`
--
ALTER TABLE `balance_consultants`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `balance_users`
--
ALTER TABLE `balance_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `bug_report`
--
ALTER TABLE `bug_report`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `careers_name_unique` (`name`);

--
-- Indices de la tabla `career_consultant`
--
ALTER TABLE `career_consultant`
  ADD KEY `career_consultant_career_id_foreign` (`career_id`),
  ADD KEY `career_consultant_consultant_id_foreign` (`consultant_id`);

--
-- Indices de la tabla `consultants`
--
ALTER TABLE `consultants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consultants_email_unique` (`email`);

--
-- Indices de la tabla `consultant_history`
--
ALTER TABLE `consultant_history`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datings`
--
ALTER TABLE `datings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `error_reports`
--
ALTER TABLE `error_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `history_user`
--
ALTER TABLE `history_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `retirement`
--
ALTER TABLE `retirement`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `transactions_user`
--
ALTER TABLE `transactions_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `user_role_role_id_foreign` (`role_id`),
  ADD KEY `user_role_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `account_consultants`
--
ALTER TABLE `account_consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `advisory_report`
--
ALTER TABLE `advisory_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `attached`
--
ALTER TABLE `attached`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `balance_consultants`
--
ALTER TABLE `balance_consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `balance_users`
--
ALTER TABLE `balance_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bug_report`
--
ALTER TABLE `bug_report`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `consultants`
--
ALTER TABLE `consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `consultant_history`
--
ALTER TABLE `consultant_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `datings`
--
ALTER TABLE `datings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `error_reports`
--
ALTER TABLE `error_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `history_user`
--
ALTER TABLE `history_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `retirement`
--
ALTER TABLE `retirement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tests`
--
ALTER TABLE `tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transactions_user`
--
ALTER TABLE `transactions_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `career_consultant`
--
ALTER TABLE `career_consultant`
  ADD CONSTRAINT `career_consultant_career_id_foreign` FOREIGN KEY (`career_id`) REFERENCES `careers` (`id`),
  ADD CONSTRAINT `career_consultant_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `consultants` (`id`);

--
-- Filtros para la tabla `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
