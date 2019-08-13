-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-08-2019 a las 09:12:08
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
(1, 17, '2132434535', 'Banco Industrial de Venezuela, C.A. Banco Universal', '0', '2019-08-10 18:54:30', '2019-08-11 03:01:20'),
(2, 17, '02929292038933', 'Banco Provincial, S.A. Banco Universal', '0', '2019-08-10 20:03:52', '2019-08-11 03:01:30');

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
(1, 17, '0', '2019-07-19 07:53:58', '2019-07-19 07:53:58'),
(2, 18, '0', '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(3, 15, '0', '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(4, 19, '0', '2019-08-04 08:01:50', '2019-08-04 08:01:50');

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
(4, 9, '1330', '2019-07-19 08:10:19', '2019-08-10 20:01:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banks`
--

CREATE TABLE `banks` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 19, '2019-08-04 08:01:50', '2019-08-04 08:01:50');

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
  `price_per_hour` varchar(999) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `office_hours_from` time DEFAULT NULL,
  `office_hours_to` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultants`
--

INSERT INTO `consultants` (`id`, `identification_document`, `name`, `lastname`, `birthdate`, `phone_number`, `email`, `password`, `attach_document`, `attach_certification`, `validate`, `price_per_hour`, `office_hours_from`, `office_hours_to`, `created_at`, `updated_at`) VALUES
(15, '2918291', 'Armando', 'Mercado', '1991-06-09', '04124310425', 'amercado@a.net', '123', NULL, NULL, 'N', NULL, NULL, NULL, '2019-06-30 07:40:33', '2019-08-10 04:15:30'),
(17, '100201001', 'Jesus', 'Mora', '1980-10-19', '1002-100234', 'consulnew@mail.com', '1234', NULL, NULL, 'Y', '10', '10:00:00', '20:00:00', '2019-07-19 07:53:53', '2019-08-10 04:14:45'),
(18, '2892982', 'Nuev', 'Pruob', '1029-10-10', '1029290', 'purbea@nueva.com', '1234', NULL, NULL, 'N', NULL, NULL, NULL, '2019-07-19 09:29:49', '2019-07-19 09:29:49'),
(19, '100000000', 'Jose', 'Perez', '1980-10-10', '1234-9892992', 'jperez@mail.com', '1234', NULL, NULL, 'N', '15', '08:00:00', '18:00:00', '2019-08-04 08:01:49', '2019-08-04 08:01:49');

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
(44, 17, 'Retiro', 'Solicitud de Retiro', '2019-08-11 08:31:17', '2019-08-11 08:31:17');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datings`
--

INSERT INTO `datings` (`id`, `user_id`, `consultant_id`, `for_date`, `time_from`, `time_up`, `title`, `summary`, `price`, `dating_status`, `created_at`, `updated_at`) VALUES
(1, 9, 15, '2019-10-11 02:00:00', '22:00', '23:00', 'Prueba 1', 'Pruebsa 1', '0', 'Rechazada', '2019-07-25 02:03:27', '2019-08-01 08:59:49'),
(2, 9, 17, '2019-10-11 02:10:00', '22:00', '23:00', 'Prueba 2', 'Prueba 2', '0', 'Cancelada', '2019-07-25 02:22:34', '2019-08-07 07:39:26'),
(3, 9, 17, '2019-08-24 15:00:00', '22:00', '23:00', 'Solicitud de Asesoria', 'Necesito una asesoria.', '0', 'Cancelada', '2019-07-25 02:26:38', '2019-08-07 07:37:18'),
(4, 9, 15, '1970-01-01 16:00:00', '22:00', '23:00', 'Hola', 'Que', '1000', 'Aprobada', '2019-07-27 15:56:58', '2019-08-01 08:54:23'),
(5, 9, 17, '2019-07-29 14:00:00', '22:00', '23:00', 'Note', 'Cita de Prueba', '0', 'Cancelada', '2019-07-27 18:30:05', '2019-08-07 07:38:56'),
(6, 9, 15, '2019-08-10 04:00:00', '10:00', '11:10', 'Highcharts Demo', 'Test test', '1000', 'Cancelada', '2019-08-01 08:01:47', '2019-08-10 08:11:31'),
(7, NULL, 15, '2019-08-08 04:00:00', '10:00', '12:00', 'Prueba Remota', 'Hola esta es una prueba remota', '1000', 'Solicitado', '2019-08-02 06:16:16', '2019-08-02 06:16:16'),
(8, NULL, 17, '2019-08-13 04:00:00', '13:00', '15:00', 'Prueba de Consulta', 'Presupuesto Automatico', '20', 'Solicitado', '2019-08-07 07:56:39', '2019-08-07 07:56:39'),
(9, 9, 17, '2019-10-10 04:00:00', '10:00', '15:00', 'Nueva Prueba', 'Otra pureba de consulta', '50', 'Aprobada', '2019-08-07 07:59:14', '2019-08-10 20:09:32'),
(10, 9, 17, '2019-08-15 04:00:00', '10:00', '15:00', 'Prueba Validando Presupuesto', 'Hola', '50', 'Solicitado', '2019-08-10 07:36:40', '2019-08-10 07:36:40'),
(11, 9, 17, '2019-09-20 04:00:00', '10:00', '11:00', 'Segunda Prueba hoy', 'Hola', '10', 'Cancelada', '2019-08-10 07:41:36', '2019-08-10 08:12:35'),
(12, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Aprobada', '2019-08-10 08:06:44', '2019-08-10 20:09:42'),
(13, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Solicitado', '2019-08-10 08:07:29', '2019-08-10 08:07:29'),
(14, 9, 17, '2019-10-10 04:00:00', '10:00', '14:00', 'Pureb', 'Prueba', '40', 'Solicitado', '2019-08-10 08:08:11', '2019-08-10 08:08:11'),
(15, 9, 17, '2019-10-10 04:00:00', '10:00', '12:00', 'Group', 'hshshjs', '20', 'Cancelada', '2019-08-10 19:55:37', '2019-08-10 19:56:49'),
(16, 9, 17, '2019-08-11 04:00:00', '10:00', '12:00', NULL, NULL, '20', 'Cancelada', '2019-08-10 20:01:03', '2019-08-10 20:01:31');

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
(10, 9, '300', 'DR__153243929656710081020191557.jpeg', '00000001', 'Pago Movil', 'Banco Provincial, S.A. Banco Universal', 'A', '2019-08-10 19:57:48', '2019-08-10 19:59:20');

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
(79, 2, 'Inicio de sesión', 'Inicio de Sesión el 13/08/19', '2019-08-13 10:27:10', '2019-08-13 10:27:10');

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
(3, 16, '20', 'A', '2019-08-10 20:01:03', '2019-08-10 20:01:31');

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
(1, 17, '1000', 'P', 'acct.bank', NULL, NULL, '2019-08-11 08:25:58', '2019-08-11 08:25:58'),
(2, 17, '100', 'P', 'acct.bank', NULL, NULL, '2019-08-11 08:31:17', '2019-08-11 08:31:17');

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
(6, 9, 'Deposito', 10, '2019-08-10 19:57:49', '2019-08-10 19:57:49');

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
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `identification_document`, `name`, `lastname`, `birthdate`, `phone_number`, `attach_document`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123456', 'Josue', 'Martinez', '1010-10-10', '299930', NULL, 'jmartinezm@intelix.biz', '1234', NULL, '2019-07-15 01:32:35', '2019-07-15 01:32:35'),
(2, '1000000', 'Administrador', 'Administrador', '2019-07-14', NULL, NULL, 'admin', 'admin', NULL, NULL, NULL),
(6, '1234555', 'Nuevo', 'Usuario', '1000-10-10', '10290192', NULL, 'nuevo@mail.com', '1234', NULL, '2019-07-19 07:50:46', '2019-07-19 07:50:46'),
(9, '24537817', 'Josue', 'Martinez', '1010-10-10', '0292019', NULL, 'pruabuser@mail.com', '1234', NULL, '2019-07-19 08:10:14', '2019-07-19 08:10:14');

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
(9, 2, '2019-07-19 08:10:17', '2019-07-19 08:10:17');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `balance_consultants`
--
ALTER TABLE `balance_consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `balance_users`
--
ALTER TABLE `balance_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `consultants`
--
ALTER TABLE `consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `consultant_history`
--
ALTER TABLE `consultant_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `datings`
--
ALTER TABLE `datings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `history_user`
--
ALTER TABLE `history_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `retirement`
--
ALTER TABLE `retirement`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
