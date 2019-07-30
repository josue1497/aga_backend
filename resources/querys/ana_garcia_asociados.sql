-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-07-2019 a las 05:48:01
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
(3, 15, '0', '2019-07-19 09:29:49', '2019-07-19 09:29:49');

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
(4, 9, '0', '2019-07-19 08:10:19', '2019-07-19 08:10:19');

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
(2, 18, '2019-07-19 09:29:49', '2019-07-19 09:29:49');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultants`
--

INSERT INTO `consultants` (`id`, `identification_document`, `name`, `lastname`, `birthdate`, `phone_number`, `email`, `password`, `attach_document`, `attach_certification`, `validate`, `created_at`, `updated_at`) VALUES
(15, '111', 'Lunesas', 'MaS', '2019-06-09', '04124310425', 'amercado@a.net', '123', NULL, NULL, 'N', '2019-06-30 07:40:33', '2019-06-30 07:40:33'),
(17, '100201001', 'Jesus', 'Mora', '1980-10-19', '1002-100234', 'consulnew@mail.com', '1234', NULL, NULL, 'N', '2019-07-19 07:53:53', '2019-07-19 07:53:53'),
(18, '2892982', 'Nuev', 'Pruob', '1029-10-10', '1029290', 'purbea@nueva.com', '1234', NULL, NULL, 'N', '2019-07-19 09:29:49', '2019-07-19 09:29:49');

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
(9, 17, 'Inicio de sesión', 'Inicio de Sesión el 30/07/19', '2019-07-30 04:06:15', '2019-07-30 04:06:15');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `datings`
--

INSERT INTO `datings` (`id`, `user_id`, `consultant_id`, `for_date`, `time_from`, `time_up`, `title`, `summary`, `price`, `created_at`, `updated_at`) VALUES
(1, 9, 15, '2019-10-11 02:00:00', '22:00', '23:00', 'Prueba 1', 'Pruebsa 1', '0', '2019-07-25 02:03:27', '2019-07-25 02:03:27'),
(2, 9, 17, '2019-10-11 02:10:00', '22:00', '23:00', 'Prueba 2', 'Prueba 2', '0', '2019-07-25 02:22:34', '2019-07-25 02:22:34'),
(3, 9, 17, '2019-08-24 15:00:00', '22:00', '23:00', 'Solicitud de Asesoria', 'Necesito una asesoria.', '0', '2019-07-25 02:26:38', '2019-07-25 02:26:38'),
(4, NULL, 15, '1970-01-01 16:00:00', '22:00', '23:00', 'Hola', 'Que', '0', '2019-07-27 15:56:58', '2019-07-27 15:56:58'),
(5, 9, 17, '2019-07-29 14:00:00', '22:00', '23:00', 'Note', 'Cita de Prueba', '0', '2019-07-27 18:30:05', '2019-07-27 18:30:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deposits`
--

CREATE TABLE `deposits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `document` varchar(256) DEFAULT NULL,
  `deposit_status` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `amount`, `document`, `deposit_status`, `created_at`, `updated_at`) VALUES
(1, 9, '100', 'nexus2cee_unnamed-11523072320191900.png', 'P', '2019-07-23 23:00:42', '2019-07-23 23:00:42'),
(2, 9, '100', '1 cuenta josue24072420191422.PNG', 'P', '2019-07-24 18:22:38', '2019-07-24 18:22:38'),
(3, 9, '100', '1 pago trasnferencia24072420191423.PNG', 'P', '2019-07-24 18:23:21', '2019-07-24 18:23:21'),
(4, 9, '100', '1 cuenta josue24072420191423.PNG', 'P', '2019-07-24 18:23:52', '2019-07-24 18:23:52'),
(5, 9, '100', '1 cuenta josue24072420191427.PNG', 'P', '2019-07-24 18:27:13', '2019-07-24 18:27:13'),
(6, 9, '100', '1 cuenta josue27072720191432.PNG', 'P', '2019-07-27 18:32:31', '2019-07-27 18:32:31');

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
(13, 9, 'Inicio de sesión', 'Inicio de Sesión el 27/07/19', '2019-07-27 18:32:04', '2019-07-27 18:32:04');

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
(2, 9, 'Deposito', 6, '2019-07-27 18:32:32', '2019-07-27 18:32:32');

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
(9, '39393993', 'Josue', 'Martinez', '1010-10-10', '0292019', NULL, 'pruabuser@mail.com', '1234', NULL, '2019-07-19 08:10:14', '2019-07-19 08:10:14');

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
-- AUTO_INCREMENT de la tabla `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `balance_consultants`
--
ALTER TABLE `balance_consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `balance_users`
--
ALTER TABLE `balance_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `consultants`
--
ALTER TABLE `consultants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `consultant_history`
--
ALTER TABLE `consultant_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `datings`
--
ALTER TABLE `datings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `history_user`
--
ALTER TABLE `history_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
