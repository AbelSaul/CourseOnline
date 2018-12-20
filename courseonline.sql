-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-07-2018 a las 20:11:22
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `courseonline`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Backend ', 'Backend ', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contents_courses`
--

CREATE TABLE `contents_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contents_courses`
--

INSERT INTO `contents_courses` (`id`, `title`, `description`, `url_video`, `course_id`, `created_at`, `updated_at`) VALUES
(1, '1. Install Xampp', 'Install Xampp', 'https://www.youtube.com/watch?v=xdvVKywGlc0', 1, NULL, NULL),
(2, '2. Hello world', 'Hello world', 'https://www.youtube.com/watch?v=tsPyurOQgsQ', 1, NULL, NULL),
(3, 'Install Ruby', 'Install Ruby', 'https://www.youtube.com/watch?v=WJlfVjGt6Hg', 2, NULL, NULL),
(4, 'Hello world ruby', 'Hello world ruby', 'https://www.youtube.com/watch?v=7QvSPBRCMco', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `author`, `description`, `duration`, `url_img`, `category_id`) VALUES
(1, 'Expert PHP', 'Duilio palacios', 'Expert PHP', '4 hours', 'https://lh3.googleusercontent.com/-AnIeswqqcfo/Wr_G6b61Y9I/AAAAAAAAAwU/4stJsuD9mUsKWNpQFkPlRzpeZvKYn6tHACLcBGAs/s640/c69f5015794a2b3a4a2013d9c1f8dc0ae90d6a07.jpg', 1),
(2, 'Expert Ruby', 'K M Rakibul Islam', 'Expert Ruby', '6 hours', 'http://www.devpenguin.co/uploads/post_image/source/32/531360_06c4.jpg', 1),
(3, 'Expert Node', 'Abel Saul', 'Expert Node', '10 hours', 'https://www.matrixmarketers.com/wp-content/uploads/2016/12/nodejs-380x246.png', 1);

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
(3, '2018_05_27_200640_create_tasks_table', 1),
(4, '2018_07_16_134338_create_categories_table', 1),
(5, '2018_07_16_134526_create_courses_table', 1),
(6, '2018_07_16_134553_create_contents_courses_table', 1),
(7, '2018_07_16_134833_create_users_courses_table', 1),
(8, '2018_07_18_014622_add_state_to_users', 2);

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
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `user_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Trabajo de integracion', 1, 'Trabajo de integracion', '2018-07-16 21:16:25', '2018-07-16 21:16:25'),
(3, 'Hacer trabajo de integracion', 2, 'Trabajo de integracion', '2018-07-18 00:42:32', '2018-07-18 00:42:32'),
(4, 'Descansar', 1, 'a full', '2018-07-19 22:22:44', '2018-07-19 22:22:44'),
(5, 'Aprnder laravel', 10, 'Ser full desarrollador', '2018-07-20 01:13:28', '2018-07-20 01:13:28'),
(6, 'ff', 1, 'ffdfd', '2018-07-20 06:40:35', '2018-07-20 06:40:35'),
(7, 'ff', 1, 'ffdfd', '2018-07-20 06:40:37', '2018-07-20 06:40:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `state`) VALUES
(1, 'AbelSaul', 'abelmiraval@gmail.com', '$2y$10$8zKKQoiUFTErZ3eWriEsXO1pBUj6oHDOsNOUqWMqX9p5gUi8PesAK', '1GQmIaUNnqYpbbw4r12EqLDbllkGnWjgi8kIpb1OC2yBpza0NA74gFglP22H', '2018-07-16 21:11:50', '2018-07-16 21:11:50', '1'),
(2, 'Juan', 'juan@gmail.com', '$2y$10$CFVbRCoNkgZsfAIHruz98OA6wy6DnHKBxcmenb322FFzVaWWegMDu', 'Nkor7tom3Lo2cbTtExlfQ1jZlRClbomYcjwWJhO8tINuE7vOOq3EMnHCqDWd', '2018-07-17 18:11:25', '2018-07-17 18:11:25', '1'),
(3, 'Abel', 'abel@gmail.com', '$2y$10$BWXMcwIa0zhI9P6Hi.nvbOKACZ/HW32lYwipQ9zMnrP.XG5MzJrnK', 'CTEkq8ZZ5pYIXXSnOfQlNRtMAxYdm4ilXnb74l5oEaS6YFxf4lMliMY2fdcf', '2018-07-18 08:12:25', '2018-07-18 08:12:25', '1'),
(4, 'Abel Demo', 'abeldemo@gmail.com', '$2y$10$hmCnW95SC3X6DbFDu0LS4OCZJHOYVX8C5sjbX/6vT8cPhj2DDqMQG', 'uTJpopVWMGKyMpUypDsDmWvQCuKWSacj4ywxMEhDObBvYnXqXK0WilQDiGIV', '2018-07-18 08:14:22', '2018-07-18 08:14:22', '1'),
(5, 'usuario1', 'usuario1@gmail.com', '$2y$10$WN3KBjOJOZlOA2RYVjRHD.yNYfeeRlLog9.LvS.gl6gYhB3Xhd9.S', 'R1Lnx5mELwe8mjN9WKJ2YD85MmVGJTegeE7Yb1mIm4U7lggd6ppUqh0stisD', '2018-07-18 08:15:19', '2018-07-18 08:15:19', '1'),
(6, 'Usuario 2', 'usuario2@gmail.com', '$2y$10$Io2ig5cKsrYc4KydEjneeuVBIwiyAb8be8DAHMP5bgXtidyugaihe', 'xOHKnAd3XU3zPdwuNol1sgKoWKYlgxbLFHSxznM8veCeewT0DTkKSsPNLD9A', '2018-07-18 08:29:43', '2018-07-18 08:29:43', '1'),
(7, 'Usuario 3', 'usuario3@gmail.com', '$2y$10$WmU.Ru2Js3lQwFcfNGy1ruuxEq5fPCBvljWZK7zjVqCIwydtjo9zS', 'r6W2CvwRm0p95jU9V8AOD2GrOrZhE1tAu1RZ5dibe98w09D3fCBgCZQxlN9F', '2018-07-18 08:33:13', '2018-07-18 08:33:13', '0'),
(8, 'Saul', 'saul@gmail.com', '$2y$10$wXY3oALRxI2UIV/6eMemeOHUZ4KQveI.Hc0ikf4qoaDW4fJ31NXza', 'WfvszeqEnKGmyiCCrkUAW9aLeEJPb65ElkJuhj00dryRVEaOheUZSyhgSJgb', '2018-07-19 00:53:15', '2018-07-19 00:54:15', '1'),
(9, 'Joe', 'joe@example.com', '$2y$10$kSU6Ehy0/4AdjIqAfx8p..T2YZrFnyLoBig3JhNI5J5X4yjb.3AVG', NULL, '2018-07-20 01:02:37', '2018-07-20 01:02:37', '0'),
(10, 'Luis', 'luis@gmail.com', '$2y$10$QT.uxDxAscHvjqoaExrVHeFOFhiRXH7xJXzhJoyNGAAgnYTRlCj.u', 'kTL8AR1i0ay0JhfZDQbczjc6Fh8w6UIyZoESAVjGPJKnqQiAAA2P12iOvEqQ', '2018-07-20 01:12:41', '2018-07-20 01:12:42', '1'),
(11, 'donal', 'donal@gmail.com', '$2y$10$Y0PfEh7cYXfJt9G4qVMWOeCwsnCRAYcWr9wbDGgnSSqbDGIQolng2', 'BWhHg4WaaXZ4bSSO0ErfcUjBxXP6s6fTbxq9Q7kyHbTyt7rqz4dwMBtcTmif', '2018-07-20 02:30:51', '2018-07-20 02:30:51', '1'),
(12, 'chinin', 'chinin@gmail.com', '$2y$10$gg6II3pXH1ksh9YpYts4G.C5q2ONEpnjTSl4kqaRrdntkVJlivEFa', 'AzyDnXLYFDYUQTvPG9uACWuG6OMXWnrmf36dRpSRZVNbuUJiZQjvWjZqlZru', '2018-07-20 02:32:37', '2018-07-20 02:33:20', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_courses`
--

CREATE TABLE `users_courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users_courses`
--

INSERT INTO `users_courses` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(15, 1, 1, '2018-07-18 03:01:23', '2018-07-18 03:01:23'),
(16, 2, 2, '2018-07-18 06:04:17', '2018-07-18 06:04:17'),
(17, 2, 3, '2018-07-18 06:56:50', '2018-07-18 06:56:50'),
(18, 1, 3, '2018-07-18 07:57:21', '2018-07-18 07:57:21'),
(19, 3, 1, '2018-07-18 08:12:53', '2018-07-18 08:12:53'),
(20, 3, 2, '2018-07-18 08:12:54', '2018-07-18 08:12:54'),
(21, 3, 3, '2018-07-18 08:12:54', '2018-07-18 08:12:54'),
(22, 1, 2, '2018-07-18 09:37:01', '2018-07-18 09:37:01'),
(23, 10, 1, '2018-07-20 01:12:55', '2018-07-20 01:12:55'),
(24, 10, 2, '2018-07-20 01:12:59', '2018-07-20 01:12:59'),
(25, 10, 3, '2018-07-20 01:13:00', '2018-07-20 01:13:00'),
(26, 12, 1, '2018-07-20 02:33:30', '2018-07-20 02:33:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contents_courses`
--
ALTER TABLE `contents_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contents_courses_course_id_foreign` (`course_id`);

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

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
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `users_courses`
--
ALTER TABLE `users_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_courses_user_id_foreign` (`user_id`),
  ADD KEY `users_courses_course_id_foreign` (`course_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contents_courses`
--
ALTER TABLE `contents_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `users_courses`
--
ALTER TABLE `users_courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contents_courses`
--
ALTER TABLE `contents_courses`
  ADD CONSTRAINT `contents_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `users_courses`
--
ALTER TABLE `users_courses`
  ADD CONSTRAINT `users_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `users_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
