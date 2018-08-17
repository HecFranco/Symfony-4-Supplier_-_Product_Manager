-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-08-2018 a las 18:18:29
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_contents`
--

INSERT INTO `list_contents` (`id`, `name`, `list_sections_id`, `created_on`) VALUES
(1, 'sign_in_to_admin', 1, '2018-07-30 11:51:49'),
(2, 'remember_me', 1, '2018-07-30 11:51:49');

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
(1, 'male', 1, '2018-07-26 06:54:49'),
(4, 'femme', 1, '2018-07-26 07:29:36');

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
-- Estructura de tabla para la tabla `list_products_categories`
--

DROP TABLE IF EXISTS `list_products_categories`;
CREATE TABLE IF NOT EXISTS `list_products_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list_products_categories`
--

INSERT INTO `list_products_categories` (`id`, `name`, `user_id`, `created_on`) VALUES
(1, 'Siliconas', 1, '2018-08-07 12:18:36'),
(2, 'Cremas', 1, '2018-08-07 12:21:35'),
(3, 'Productos de Gel', 1, '2018-08-07 12:21:35'),
(4, 'Fieltros y Moleskines', 1, '2018-08-07 12:21:35'),
(5, 'Vendajes y Apósitos', 1, '2018-08-07 12:21:35'),
(6, 'Desechables', 1, '2018-08-07 12:21:35'),
(7, 'Cirugía', 1, '2018-08-07 12:24:53'),
(8, 'Equipamiento', 1, '2018-08-07 12:24:53'),
(9, 'Esterilización', 1, '2018-08-07 12:24:53'),
(10, 'Desinfección y Químicos', 1, '2018-08-07 12:24:53'),
(11, 'Fresas', 1, '2018-08-07 12:24:53'),
(12, 'Instrumental', 1, '2018-08-07 12:24:53'),
(13, 'Micromotores', 1, '2018-08-07 12:24:53'),
(14, 'Tratamiento Piel y Uñas', 1, '2018-08-07 12:24:53'),
(15, 'Materiales Ortopodología', 1, '2018-08-07 12:24:53'),
(16, 'Plantillas Kit', 1, '2018-08-07 12:24:53'),
(17, 'Plantillas Planas Fusionadas', 1, '2018-08-07 12:24:53'),
(18, 'Plantillas Termoformadas', 1, '2018-08-07 12:24:53'),
(19, 'Diagnóstico y Consulta', 1, '2018-08-07 12:24:53'),
(20, 'Vestuario Sanitario', 1, '2018-08-07 12:24:53'),
(21, 'Novedades', 1, '2018-08-07 12:24:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_products_subcategory`
--

DROP TABLE IF EXISTS `list_products_subcategory`;
CREATE TABLE IF NOT EXISTS `list_products_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `products_categories_id` int(11) NOT NULL,
  `order_weight` smallint(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `products_categories` (`products_categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `list_products_subcategory`
--

INSERT INTO `list_products_subcategory` (`id`, `name`, `products_categories_id`, `order_weight`, `user_id`, `created_on`) VALUES
(1, 'Siliconas de policonde', 1, 1, 1, '2018-08-07 12:28:26'),
(2, 'Siliconas bicomponentes', 1, 2, 1, '2018-08-07 12:28:26'),
(3, 'Siliconas Fluidas', 1, 3, 1, '2018-08-07 12:28:26'),
(4, 'Catalizadores', 1, 4, 1, '2018-08-07 12:28:26'),
(5, 'Accesorios Siliconas', 1, 5, 1, '2018-08-07 12:28:26'),
(6, 'Versil', 1, 6, 1, '2018-08-07 12:28:26'),
(7, 'Cremas Podoline', 2, 7, 1, '2018-08-07 12:35:41'),
(8, 'Linea Planticlean', 2, 8, 1, '2018-08-07 12:35:41'),
(9, 'Callusan Espuma', 2, 9, 1, '2018-08-07 12:35:41'),
(10, 'Gel Polímero', 3, 10, 1, '2018-08-07 12:37:01'),
(11, 'Plantillas y taloneras', 3, 11, 1, '2018-08-07 12:37:01'),
(12, 'Corrector nocturno', 3, 12, 1, '2018-08-07 12:37:01'),
(13, 'Fieltros', 4, 13, 1, '2018-08-07 12:38:02'),
(14, 'Moleskines', 4, 14, 1, '2018-08-07 12:38:02'),
(15, 'Fleecy Web', 4, 15, 1, '2018-08-07 12:38:02'),
(16, 'Espumas', 4, 16, 1, '2018-08-07 12:38:02'),
(17, 'Parches y Apósitos', 4, 17, 1, '2018-08-07 12:38:02'),
(18, 'Tubofoam', 4, 18, 1, '2018-08-07 12:38:02'),
(19, 'Esparadrapos y fijación', 5, 19, 1, '2018-08-07 13:14:56'),
(20, 'Vendas elásticas adhesivas', 5, 20, 1, '2018-08-07 13:14:56'),
(21, 'Prevendaje', 5, 21, 1, '2018-08-07 13:14:56'),
(22, 'Vendas elásticas cohesivas', 5, 22, 1, '2018-08-07 13:14:56'),
(23, 'Vendas gasa y crepé', 5, 23, 1, '2018-08-07 13:14:56'),
(24, 'Apósitos', 5, 24, 1, '2018-08-07 13:14:56'),
(25, 'Vendas de yeso', 5, 25, 1, '2018-08-07 13:14:56'),
(26, 'Vendas tubulares', 5, 26, 1, '2018-08-07 13:14:56'),
(27, 'Cierre de heridas', 5, 27, 1, '2018-08-07 13:14:56'),
(28, 'Vendajes funcionales', 5, 28, 1, '2018-08-07 13:19:34'),
(29, 'Guantes', 6, 29, 1, '2018-08-07 13:08:25'),
(30, 'Tallas y paños', 6, 30, 1, '2018-08-07 13:21:26'),
(31, 'Mascarillas', 6, 31, 1, '2018-08-07 13:23:42'),
(32, 'Gasas', 6, 32, 1, '2018-08-07 13:23:42'),
(33, 'Vestuario un solo uso', 6, 33, 1, '2018-08-07 13:23:42'),
(34, 'Torundas y Algodón', 6, 34, 1, '2018-08-07 13:23:42'),
(35, 'Rollos papel', 6, 35, 1, '2018-08-07 13:23:42'),
(36, 'Jeringas y agujas', 6, 36, 1, '2018-08-07 13:23:42'),
(37, 'Suturas', 6, 37, 1, '2018-08-07 13:23:42'),
(38, 'Protección ocular', 6, 38, 1, '2018-08-07 13:23:42'),
(39, 'Contenedores', 6, 39, 1, '2018-08-07 13:23:42'),
(40, 'Fresas cirugía', 7, 40, 1, '2018-08-07 13:54:28'),
(41, 'Hojas bisturí cirugía', 7, 41, 1, '2018-08-07 13:54:28'),
(42, 'Sets Cirugía', 7, 42, 1, '2018-08-07 13:54:28'),
(43, 'Torniquetes', 7, 43, 1, '2018-08-07 13:54:28'),
(44, 'Calzado Postoperatorio', 7, 44, 1, '2018-08-07 13:54:28'),
(45, 'Micromotor Surgic Pro', 7, 45, 1, '2018-08-07 13:54:28'),
(46, 'Piezas de mano y micro sierras', 7, 46, 1, '2018-08-07 13:54:28'),
(47, 'Varios cirugía', 7, 47, 1, '2018-08-07 13:54:28'),
(48, 'Equipos podología', 8, 48, 1, '2018-08-07 13:56:17'),
(49, 'Sistemas de Aspiración', 8, 49, 1, '2018-08-07 13:56:17'),
(50, 'Pulidoras', 8, 50, 1, '2018-08-07 13:56:17'),
(51, 'Taburetes', 8, 51, 1, '2018-08-07 13:56:17'),
(52, 'Camillas', 8, 52, 1, '2018-08-07 13:56:17'),
(53, 'Rollos y bolsas de esterilización', 9, 53, 1, '2018-08-07 13:58:28'),
(54, 'Indicadores de esterilización', 9, 54, 1, '2018-08-07 13:58:28'),
(55, 'Aparatología', 9, 55, 1, '2018-08-07 13:58:28'),
(56, 'Recambios equipos esterilización', 9, 56, 1, '2018-08-07 13:58:28'),
(57, 'Ácidos y químicos', 10, 57, 1, '2018-08-07 13:58:28'),
(58, 'Desinfección de instrumental', 10, 58, 1, '2018-08-07 14:00:37'),
(59, 'Desinfección de superficies', 10, 59, 1, '2018-08-07 14:00:37'),
(60, 'Limpieza y desinfección de manos', 10, 60, 1, '2018-08-07 14:00:37'),
(61, 'Limpieza y desinfección de piel sana', 10, 61, 1, '2018-08-07 14:00:37'),
(62, 'Lubricación instrumentos', 10, 62, 1, '2018-08-07 14:00:37'),
(63, 'Cubetas de desinfección', 10, 63, 1, '2018-08-07 14:00:37'),
(64, 'Abrasivos', 11, 64, 1, '2018-08-07 15:42:57'),
(65, 'Cerámica', 11, 65, 1, '2018-08-07 15:42:57'),
(66, 'Carburo Tungsteno Cruzado', 11, 66, 1, '2018-08-07 15:42:57'),
(67, 'Carburo Tungsteno Transversal', 11, 67, 1, '2018-08-07 15:42:57'),
(68, 'Carburo Tungsteno Simple', 11, 68, 1, '2018-08-07 15:42:57'),
(69, 'Diamante', 10, 69, 1, '2018-08-07 15:42:57'),
(70, 'Titanio', 11, 70, 1, '2018-08-07 15:42:57'),
(71, 'Acero', 11, 71, 1, '2018-08-07 15:42:57'),
(72, 'Fresas para Zurdos', 11, 72, 1, '2018-08-07 15:42:57'),
(73, 'Pulido', 11, 73, 1, '2018-08-07 15:42:57'),
(74, 'Accesorios', 11, 74, 1, '2018-08-07 15:42:57'),
(75, 'Hojas de bisturí', 12, 75, 1, '2018-08-07 16:17:36'),
(76, 'Mangos bisturí ', 12, 76, 1, '2018-08-07 16:17:36'),
(77, 'Mangos bisturí Aesculap', 12, 77, 1, '2018-08-07 16:17:36'),
(78, 'Extracción de bisturís', 12, 78, 1, '2018-08-07 16:17:36'),
(79, 'Alicates', 12, 79, 1, '2018-08-07 16:17:36'),
(80, 'Alicates Ultra Titanium ', 12, 80, 1, '2018-08-07 16:17:36'),
(81, 'Alicates Aesculap', 12, 81, 1, '2018-08-07 16:17:36'),
(82, 'Gubias', 12, 82, 1, '2018-08-07 16:17:36'),
(83, 'Gubias fijas', 12, 83, 1, '2018-08-07 16:17:36'),
(84, 'Gubias fijas Aesculap', 12, 84, 1, '2018-08-07 16:17:36'),
(85, 'Mangos para Gubias', 12, 85, 1, '2018-08-07 16:17:36'),
(86, 'Tijeras', 12, 86, 1, '2018-08-07 16:17:36'),
(87, 'Tijeras Aesculap', 12, 87, 1, '2018-08-07 16:17:36'),
(88, 'Pinzas ', 12, 88, 1, '2018-08-07 16:17:36'),
(89, 'Pinzas Aesculap', 12, 89, 1, '2018-08-07 16:17:36'),
(90, 'Jeringas y agujas', 12, 90, 1, '2018-08-07 16:17:36'),
(91, 'Porta agujas Aesculap', 12, 91, 1, '2018-08-07 16:17:36'),
(92, 'Porta agujas ', 12, 92, 1, '2018-08-07 16:17:36'),
(93, 'Instrumental', 12, 93, 1, '2018-08-07 16:17:36'),
(94, 'Bandejas instrumental', 12, 94, 1, '2018-08-07 16:17:36'),
(95, 'Soporte alicates', 12, 95, 1, '2018-08-07 16:17:36'),
(96, 'Protección canales', 12, 96, 1, '2018-08-07 16:17:36'),
(97, 'Micromotores portátiles', 13, 97, 1, '2018-08-07 16:19:05'),
(98, 'Maletín Podoasist', 13, 98, 1, '2018-08-07 16:19:05'),
(99, 'Piezas de Mano', 13, 99, 1, '2018-08-07 16:19:05'),
(100, 'Mantenimiento', 13, 100, 1, '2018-08-07 16:19:05'),
(101, 'Resinas técnicas', 15, 101, 1, '2018-08-07 16:59:11'),
(102, 'Revestimientos confort', 15, 102, 1, '2018-08-07 16:59:11'),
(103, 'Corrección y estabilización', 15, 103, 1, '2018-08-07 16:59:11'),
(104, 'Revestimientos Dinámicos', 15, 104, 1, '2018-08-07 13:10:02');

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
  `name` varchar(255) NOT NULL,
  `description` text,
  `reference` varchar(100) NOT NULL,
  `price` float DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  `suitable` tinyint(1) NOT NULL,
  `products_subcategory_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  KEY `user_id` (`user_id`),
  KEY `products_subcategory` (`products_subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `reference`, `price`, `provider_id`, `suitable`, `products_subcategory_id`, `user_id`, `created_on`) VALUES
(1, 'GUANTES De Nitrilo Sin Polvo (Caja 100 U.) extra pequeña', NULL, '007017', 5.95, 1, 1, 29, 1, '2018-08-07 12:47:53'),
(2, 'POLIFOAM SANITIZED Perf. Gris 2,5 Mm. 750 X 1000 Mm.', NULL, '009065', 12.95, 1, 0, 104, 1, '2018-08-07 13:06:51'),
(3, 'Alicate Triple Articulación A/Inox. 15 Cm. Aesculap (HF250R)', NULL, '006301', 56.95, 1, 1, 79, 1, '2018-08-07 13:26:34'),
(4, 'ALICATE TRIPLE ARTICULACION AESCULAP HF250R 15 CM', NULL, '4110.01', 56.95, 2, 1, 79, 1, '2018-08-07 13:26:34'),
(5, 'FRESA TITANIO Cruzado Medio D. 45', NULL, '170790', 17.95, 1, 1, 70, 1, '2018-08-07 17:05:07'),
(6, 'ROLLO PAPEL CAMILLA doble capa prec. 2 m.50 m. x 60', NULL, '007061', 6.95, 1, 1, 35, 1, '2018-08-07 17:06:32'),
(7, 'Hojas Bisturí SWANN MORTON nº 15 Caja 100 Unidades', NULL, '006015', 10.9, 1, 1, 75, 1, '2018-08-07 17:10:18'),
(8, 'Hojas Bisturí Aesculap nº10', NULL, '006054', 9.15, 1, 1, 75, 1, '2018-08-07 17:12:21'),
(9, 'PODOTIL EXTRA HARD Rojo 4mm. 850 X 700 Mm. ', NULL, '009040', 29.5, 1, 1, 103, 1, '2018-08-07 17:14:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `brand_name`, `business_name`, `address`, `CIF`, `phone`, `fax`, `email`, `user_id`, `created_on`) VALUES
(1, 'Podo Service', 'Clinitec 2002 S.L.', 'C/ Drets Humans, 17-19', 'B61547881', 900147147, NULL, 'info@podoservice.es', 1, '2018-08-07 12:44:15'),
(2, 'GlobalPODO', '	ILERGLOBAL PRODUCTOS CLINICOS, S.L.', 'Av/ Sant Ruf 5, local 1, 25004 Lleida  (España)', 'B25736851', 973989115, NULL, 'globalpodo@globalpodo.com', 1, '2018-08-07 12:45:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(13, 'a09fd2483c377dfe0cfeb759da7b283ef7521cd5ca1b0688c859ed7e0db0a5a7c84a663f3282dd9ee7e7334b163a65f14fd1d0fb6c7a6c0b646529fc25a172cd', '1@1.com', '2018-08-08 07:02:39'),
(14, 'dbad51ddfcb6c671c2ad88cee9a1bc5a82babce435e57fe3726900ed51fbeadde85ae8e45e1c509f50b3cb674e558bbe696b2cdb4f892ee5d3a55d8f6515c65c', '1test@tes.com', '2018-08-08 09:53:19'),
(15, '3d966a57f64089f4ab538f4f0631ba8c44926c9660e04f6b645e207a1f5e2a7f0159d2234109698fe8f8f8db72b644caff2e63f5d0f0cec64c4b8ba554a1ab30', '2test@tes.com', '2018-08-08 09:55:16'),
(16, '717acbbc3ad8be948f65a1e5b35f3add9bdbdd21b886a45b0db9356893c99643335ee06e0543678dc1bf26b36ca07ee0bbb65551a0160e7f48a0d4153446f888', '12@1.com', '2018-08-08 11:20:37'),
(17, 'e24a7f1afb02d354a5e18e1ef637262edf6050c3c4e9478291fee52a513e7a3d0d3ba6e74f8eb3cee5a161f8f1a8dcadf368b822784622a07c38fd3b88150e8c', 'test@tes.com', '2018-08-31 12:17:55'),
(18, 'c47ffcf1d3441b7a6d100fdd585a0c92af22079038dfa464e80d09e84b980d3b39dce05b48204e6645c649197b527339c31cb623bc219865bdaabe5861deb46d', 'test@tes.com', '2018-08-31 12:40:37'),
(19, 'e080646dcc96a6e873fbafe268acd0e1364164609f384086c66c39d463a9af618b62bac34439176298a4922870b498b8e6aa32c3ec6e08336696fb4ad9681c0f', 'test@tes.com', '2018-08-31 13:07:32'),
(20, 'a0a3fd2b8e2f5182af56d6fda56d11a37268644be070df50a50b52ac13e426c748fef3a03e69b4e78e58d1bb26ae9aabca788d982efb0bd77bf324b019ffa9b2', 'test@tes.com', '2018-08-31 13:15:00'),
(21, 'f612e5f9c77c47433837b6e58674ebfc6d4802876f125598840fa0cf237fbfd5867ff508336ddfef8cf9885c01643463789924d5df1100dd0f55160e6a27b09b', 'test@tes.com', '2018-08-31 13:16:52');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `name`, `description`, `value`, `auth`, `modified_on`, `created_on`) VALUES
(1, 'name_app', NULL, 'unnamed', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54'),
(2, 'url_img_logo_vertical', NULL, '/assets/images/logo_only_without_background.png', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54'),
(3, 'url_img_logo_horizontal', NULL, '/assets/images/logo.png', 0, '2018-07-26 14:18:54', '2018-07-26 14:18:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `translation`, `list_language_id`, `list_content_id`) VALUES
(1, 'Recuérdame', 1, 2),
(2, 'Remember me', 2, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `gender`, `image`, `username`, `email`, `password`, `plain_password`, `first_name`, `last_name`, `address`, `postal_code`, `phone`, `phone2`, `birthdate`, `year_of_birth`, `timezone`, `is_active`, `disabled_on`, `last_modified_on`, `created_on`) VALUES
(1, NULL, NULL, 'admin@admin.com', 'admin@admin.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-25 14:47:05', '2018-07-25 14:47:05'),
(10, NULL, NULL, 'test1@tes.com', 'test1@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 08:58:51', '2018-07-30 08:58:51'),
(11, NULL, NULL, 'test2@tes.com', 'test2@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 09:59:34', '2018-07-30 09:59:34'),
(12, NULL, NULL, '1@1.com', '1@1.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'hector', 'hector', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 07:02:39', '2018-08-01 07:02:39'),
(13, NULL, NULL, '1test@tes.com', '1test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 09:53:18', '2018-08-01 09:53:18'),
(14, NULL, NULL, '2test@tes.com', '2test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 09:55:16', '2018-08-01 09:55:16'),
(15, NULL, NULL, '12@1.com', '12@1.com', '2lvfiXzaiUo6+gNw9kDrll6kLBSS3nt7bbmhnC+gV2BORS9QKK0YLbIOcYcOffUTo3Xf3LMQw+R8kEBW7uS/4g==', '1aA_', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 11:20:37', '2018-08-01 11:20:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`id`, `role_id`, `user_id`) VALUES
(1, 3, 1),
(10, 6, 11),
(11, 6, 12),
(12, 6, 13),
(13, 6, 14),
(14, 6, 15);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `list_contents`
--
ALTER TABLE `list_contents`
  ADD CONSTRAINT `sections_from_contents` FOREIGN KEY (`list_sections_id`) REFERENCES `list_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `list_genders`
--
ALTER TABLE `list_genders`
  ADD CONSTRAINT `user_from_genders` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `list_products_categories`
--
ALTER TABLE `list_products_categories`
  ADD CONSTRAINT `user_from_products_categories` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `list_products_subcategory`
--
ALTER TABLE `list_products_subcategory`
  ADD CONSTRAINT `products_categories_from_products_subcategory` FOREIGN KEY (`products_categories_id`) REFERENCES `list_products_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_from_products_subcategory` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `list_roles`
--
ALTER TABLE `list_roles`
  ADD CONSTRAINT `user_from_roles` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_subcategory_from_products` FOREIGN KEY (`products_subcategory_id`) REFERENCES `list_products_subcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provider_from_products` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_from_products` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `user_from_providers` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `contents_from_translations` FOREIGN KEY (`list_content_id`) REFERENCES `list_contents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `language_from_translations` FOREIGN KEY (`list_language_id`) REFERENCES `list_languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `genders_from_user` FOREIGN KEY (`gender`) REFERENCES `list_genders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `role_from_user_roles` FOREIGN KEY (`role_id`) REFERENCES `list_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_from_user_roles` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
