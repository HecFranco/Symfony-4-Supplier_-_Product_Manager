-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-08-2018 a las 10:46:47
-- Versión del servidor: 5.7.19
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `symfony-4-supplier-&-product-manager`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_categories`
--

DROP TABLE IF EXISTS `list_categories`;
CREATE TABLE IF NOT EXISTS `list_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_contents`
--

DROP TABLE IF EXISTS `list_contents`;
CREATE TABLE IF NOT EXISTS `list_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `list_sections_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `list_translations_sections_id` (`list_sections_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_contents`
--

INSERT INTO `list_contents` (`id`, `name`, `list_sections_id`, `created_on`) VALUES
(1, 'sign_in_to_admin', 1, '2018-07-30 11:51:49'),
(2, 'remember_me', 1, '2018-07-30 11:51:49'),
(3, 'forget_password', 1, '2018-07-30 21:55:02'),
(4, 'sign_in', 1, '2018-07-30 21:55:02'),
(5, 'dont_have_an_account_yet', 1, '2018-07-30 21:55:16'),
(6, 'sign_up', 1, '2018-07-30 21:55:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_genders`
--

DROP TABLE IF EXISTS `list_genders`;
CREATE TABLE IF NOT EXISTS `list_genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list_genders`
--

INSERT INTO `list_genders` (`id`, `name`, `user_id`, `created_on`) VALUES
(1, 'male', NULL, '2018-07-26 06:54:49'),
(4, 'femme', NULL, '2018-07-26 07:29:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_languages`
--

DROP TABLE IF EXISTS `list_languages`;
CREATE TABLE IF NOT EXISTS `list_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_languages`
--

INSERT INTO `list_languages` (`id`, `name`, `created_on`) VALUES
(1, 'es', '2018-07-30 09:44:59'),
(2, 'en', '2018-07-30 09:44:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_roles`
--

DROP TABLE IF EXISTS `list_roles`;
CREATE TABLE IF NOT EXISTS `list_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list_roles`
--

INSERT INTO `list_roles` (`id`, `role`, `user_id`, `created_on`) VALUES
(3, 'ROLE_ADMIN', NULL, '2018-07-26 07:11:53'),
(6, 'ROLE_USER', NULL, '2018-07-26 07:16:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_sections`
--

DROP TABLE IF EXISTS `list_sections`;
CREATE TABLE IF NOT EXISTS `list_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_sections`
--

INSERT INTO `list_sections` (`id`, `name`, `created_on`) VALUES
(1, 'authentication', '2018-07-30 09:47:52'),
(2, 'navigation', '2018-07-30 09:47:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_categories`
--

DROP TABLE IF EXISTS `products_categories`;
CREATE TABLE IF NOT EXISTS `products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

DROP TABLE IF EXISTS `providers`;
CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CIF` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(9) DEFAULT NULL,
  `fax` int(9) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers_products`
--

DROP TABLE IF EXISTS `providers_products`;
CREATE TABLE IF NOT EXISTS `providers_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `units` int(10) DEFAULT NULL,
  `surface_area` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `length` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `products_id` (`product_id`),
  KEY `provider_id` (`provider_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
CREATE TABLE IF NOT EXISTS `refresh_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9BACE7E1C74F2195` (`refresh_token`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `refresh_tokens`
--

INSERT INTO `refresh_tokens` (`id`, `refresh_token`, `username`, `valid`) VALUES
(6, '52612fd6d1760597d50d068ba6355223944775745a77e0526709fdd46ece46b09d160c7617100c45c9584f7e828a0cefac503a850ca849821b7f7a7789852f80', 'test@tes.com', '2018-08-01 14:47:05'),
(7, '1d14cf0ec5799427fd66e1f019fe35682797ce3fc44f88aead18266178f9b4722c12580de22fcae69a982c70bac7cf94fe11ef599b40e3f9f1fbfc8f5420c8ce', 'test@tes.com', '2018-08-24 14:48:51'),
(8, 'd09ee19570ef53f79acecd48dc38379032116806b32826b614b924bc15cd96c100280c166feaabba35393b5764bb56e618ef62561270e1591eabd6f7673f31c7', 'test@tes.com', '2018-08-25 14:45:47'),
(9, '5da28ab8fb7926b2d1cb47df1272ec93485d3164c9ef0b66462baa8f6eab616392d101e370fbe32ee28e033655d6b9d5eb2948574b3736e50c824a8dbb286f27', 'test1@tes.com', '2018-08-06 08:58:51'),
(10, '59e29ee188aa03e036d2396535dad5d852e13e63d45bb92ad333cbccd81f8950983985ae6a9a7001e556272a5ae087fe2ef308f80080444c55cd27d95c736372', 'test@tes.com', '2018-08-29 08:59:00'),
(11, '89a7bdfaf34d05c30bcadd7df1dc73f67f687b055833d290b3cfb2bfa7df5305b3f8b4eb36d013398f7bae9ac808b2ed09a3ec4f7a723febfe2534f80ec55d86', 'test2@tes.com', '2018-08-06 09:59:34'),
(12, '6c31b6f53cecfd36d099d66350ceeb593f79bfd2c5608845f9acdb4420f8a0505812f2bbc5592a7cd538f573077c3f986728a6939e8df9ea49d481badf5f40b9', 'test@tes.com', '2018-08-29 09:59:38'),
(13, '4bc342af35dbc29f6974b6a47d1820d33bf787f85f69e2bc066a5186ce2795a54cb4dfb48738a5f4ff48b848fc4cabf2d6051246d72b02c9520a42efbbe1589c', 'test@tes.com', '2018-09-01 09:33:12'),
(14, '93a284740e0c731fad32dcaf0594b80dce46eea650ceda0a9ed2609e2aa443ad09bb0013b5653f038b9842292dcadce04d083526fa176da4ac76d175f2450712', 'test@tes.com', '2018-09-01 09:44:22'),
(15, '34e1d2e9bed322e8c4c928ca53e501d1208bcddae2839d26d931c3aeab417f0b242a5fceb15f24b636c4281956aefe1dac838dd14fb846b06a296bb44070c985', 'test@tes.com', '2018-09-01 10:01:58'),
(16, '9d53f524d5de9d3b8fec90c7b933fc14b747b210b62ee33a3b424132694a2e9aa07a5260561f8fed712a9a56d61a0cdbe6f06a7008afd1132b986f06aab05f39', 'test@tes.com', '2018-09-01 10:04:03'),
(17, 'cd530e3d4d63fa79eb6af3a31bf4ce9b2befcc54e14053a93fc2cf73b1f1b49a21c4fa3330aab6904dc541dfb2e4b8ade52b573cb0e9984d5b5bfac923bc65c5', 'test@tes.com', '2018-09-01 10:05:00'),
(18, '68c8af86e78bb2e8848442c758315f94a211b93b5be8c8ec6bd6cf9e2b430ffe4a25688249018cf1d92284128100425e48b3ca3d21002be61e80c149e128e1e8', 'test@tes.com', '2018-09-01 10:08:25'),
(19, '71402a704417d7e565741deb1b85a435422c8ac6b43857356090a8648b2087893b28d284f83c1bafbfbb2736cf8187e94e3d6a8d8762b55ba45b8496769d4292', 'test@tes.com', '2018-09-01 10:09:01'),
(20, '0c6700b8d4f12b469d47985580504d7a7185835ca27676b1be7298e02d8d58368c223f383b898fd2e276960033b8df506da51dc4df65d22ef3de4a91ca8f2ac2', 'test@tes.com', '2018-09-01 10:12:03'),
(21, 'fa418726f2fa94b5626f8b8460440ff4ad4ea814d93d6a324caf555817b2c402a2503306666f55a3fac2116f4153d9fd76751500b5475be77234b9934dffa2c1', 'test@tes.com', '2018-09-01 10:18:44'),
(22, '8d1cb0113a332b8c86f52a70e63bea952b73fd0af5d64c3cf14606e87ae502a42fbbb63df5a235e1749d62d5870862d69f4085f6a323924658346a60a8511fcf', 'test@tes.com', '2018-09-01 10:21:20'),
(23, '17af041e2afdcefd72cebc28d5c69a108acc0842e6c8802edfe47b58ba73c899fb35d8b39f8bad82a52187cb18c1caf9e68bbb2f4ac9dc6f9d1eda1905c85478', 'test@tes.com', '2018-09-01 10:31:58'),
(24, 'e298c7cd5b1fac2d5270c213acf1a5218d36021c2fc46cdd8a8b4ae03eb070a9d0b616e1fada5f98c38ef87b06f381337a74ab5289fcec0899955e38ddc2911e', 'test@tes.com', '2018-09-01 10:33:54'),
(25, 'e0b79b62bb7a197f04013ae88d7b17169f4815b89500b49292868525e70c59f32fa9cc4db3399b2066e4e92eed43fa33957dfe9c0c2b19ed236f0bd227f0add8', 'test@tes.com', '2018-09-01 10:35:15'),
(26, 'c16c3cb4b8b2fa78185a1e9128c445f944fdcc24d6723bf75a5e2ecf6cf1b8f47b68a9f15cbd26ce7c98f8a88a4ede6029e606982c9e924c1d116b21a6001b02', 'test@tes.com', '2018-09-02 07:56:39'),
(27, 'd1b7be04f5248f34bcc2e0df536be1c194afaf30dd8c0e4bb00d108e713c865130586d3fd655f8d1ce4822a1311c6784d250bc815319e26a999eec829dc42f45', 'test@tes.com', '2018-09-02 10:19:55'),
(28, '0bf771282609f2a64e64fe820513b539108cc801f856f25f4fdd7c48b0b0d90a46f383d77be65c61dc03c1e243f4bc2f1a6d17b38d2a582fc38b7d45bbc4c7ef', 'test@tes.com', '2018-09-02 10:21:08'),
(29, 'c73526fce52e060041ce44b345b249a8a6872469510e731f8487454d0cc30ad567479e50bd9204947f451495b1c427538d23ca6d5d14f8a64cb4b1658b5a4efa', 'test@tes.com', '2018-09-02 10:25:29'),
(30, 'c748302f0bccfb3e1cc430055dbb8255f3593d33fb044e6a1192c3ea1ad45c182f755a6c3d54ce1e34d0e709767124b7266652758c2af223e3c00ecc6e274461', 'test@tes.com', '2018-09-02 10:40:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4,
  `value` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `auth` tinyint(1) NOT NULL DEFAULT '1',
  `modified_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `name`, `description`, `value`, `auth`, `modified_on`, `created_on`) VALUES
(1, 'name_app', NULL, 'unnamed', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54'),
(2, 'url_img_logo_vertical', NULL, '/assets/images/logo/logo_only_without_background.png', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54'),
(3, 'url_img_logo_horizontal', NULL, '/assets/images/logo/logo_horizontal_plus_white_without_background.png', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54'),
(5, 'dismiss_secs_alerts', NULL, '5', 0, '2018-08-02 16:52:46', '2018-08-02 16:52:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translation` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `list_language_id` int(11) DEFAULT NULL,
  `list_content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_translations_content` (`list_content_id`),
  KEY `list_translations_languages` (`list_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `translation`, `list_language_id`, `list_content_id`) VALUES
(1, 'Iniciar sesión en el Administrador', 1, 1),
(2, 'Recuérdame', 1, 2),
(3, '¿Olvidáste tu Password?', 1, 3),
(4, 'Iniciar sesión', 1, 4),
(5, '¿No tienes cuenta todavía?', 1, 5),
(6, 'Regístrate', 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gender` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plain_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `year_of_birth` int(11) DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `disabled_on` datetime DEFAULT NULL,
  `last_modified_on` datetime NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_uniques_fields` (`email`,`username`),
  KEY `gender` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `gender`, `image`, `username`, `email`, `password`, `plain_password`, `first_name`, `last_name`, `address`, `postal_code`, `phone`, `phone2`, `birthdate`, `year_of_birth`, `timezone`, `is_active`, `disabled_on`, `last_modified_on`, `created_on`) VALUES
(9, NULL, NULL, 'test@tes.com', 'test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-25 14:47:05', '2018-07-25 14:47:05'),
(10, NULL, NULL, 'test1@tes.com', 'test1@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 08:58:51', '2018-07-30 08:58:51'),
(11, NULL, NULL, 'test2@tes.com', 'test2@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 09:59:34', '2018-07-30 09:59:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`id`, `role_id`, `user_id`) VALUES
(9, 6, 10),
(10, 6, 11);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `list_categories`
--
ALTER TABLE `list_categories`
  ADD CONSTRAINT `FK_E0DE32B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_contents`
--
ALTER TABLE `list_contents`
  ADD CONSTRAINT `FK_33348F7CC832A1A1` FOREIGN KEY (`list_sections_id`) REFERENCES `list_sections` (`id`);

--
-- Filtros para la tabla `list_genders`
--
ALTER TABLE `list_genders`
  ADD CONSTRAINT `FK_5F5475B0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_roles`
--
ALTER TABLE `list_roles`
  ADD CONSTRAINT `FK_6FADBAC4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_CDD7693AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products_categories`
--
ALTER TABLE `products_categories`
  ADD CONSTRAINT `FK_2F4AF42412469DE2` FOREIGN KEY (`category_id`) REFERENCES `list_categories` (`id`),
  ADD CONSTRAINT `FK_2F4AF4244584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_2F4AF424A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `FK_E225D417A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `providers_products`
--
ALTER TABLE `providers_products`
  ADD CONSTRAINT `FK_1185E4D64584665A` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_1185E4D6A53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `FK_1185E4D6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `FK_BC523F9C8C23CB3` FOREIGN KEY (`list_language_id`) REFERENCES `list_languages` (`id`),
  ADD CONSTRAINT `FK_BC523F9CD2EF08F6` FOREIGN KEY (`list_content_id`) REFERENCES `list_contents` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_1483A5E9C7470A42` FOREIGN KEY (`gender`) REFERENCES `list_genders` (`id`);

--
-- Filtros para la tabla `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK_51498A8EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_51498A8ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `list_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
