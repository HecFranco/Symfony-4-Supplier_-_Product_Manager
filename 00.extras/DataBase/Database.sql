-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-08-2018 a las 06:59:17
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
-- Estructura de tabla para la tabla `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `brand_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CIF` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `business`
--

INSERT INTO `business` (`id`, `image`, `user_id`, `brand_name`, `business_name`, `address`, `CIF`, `phone`, `fax`, `email`, `created_on`) VALUES
(1, '1', 1, 'Podo Service', 'Clinitec 2002 S.L.', 'C/ Drets Humans, 17-19', 'B61547881', 900147147, NULL, 'info@podoservice.es', '2018-08-07 12:44:15'),
(2, '1', 1, 'GlobalPODO', '	ILERGLOBAL PRODUCTOS CLINICOS, S.L.', 'Av/ Sant Ruf 5, local 1, 25004 Lleida  (España)', 'B25736851', 973989115, NULL, 'globalpodo@globalpodo.com', '2018-08-07 12:45:38'),
(3, '/files/business/3/logo.png', 1, 'Podología Priego', NULL, 'Av. América, 15', NULL, NULL, NULL, NULL, '2018-08-14 15:24:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_address_ccaa`
--

DROP TABLE IF EXISTS `list_address_ccaa`;
CREATE TABLE IF NOT EXISTS `list_address_ccaa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccaa` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_address_city`
--

DROP TABLE IF EXISTS `list_address_city`;
CREATE TABLE IF NOT EXISTS `list_address_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` int(11) DEFAULT NULL,
  `cp` int(11) DEFAULT NULL,
  `city` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `address_province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_address_province`
--

DROP TABLE IF EXISTS `list_address_province`;
CREATE TABLE IF NOT EXISTS `list_address_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ccaa` int(11) DEFAULT NULL,
  `province` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ccaa` (`ccaa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_contents`
--

DROP TABLE IF EXISTS `list_contents`;
CREATE TABLE IF NOT EXISTS `list_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `section` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `list_translations_sections_id` (`section`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_contents`
--

INSERT INTO `list_contents` (`id`, `name`, `section`, `created_on`) VALUES
(1, 'sign_in_to_admin', 1, '2018-08-20 16:00:11'),
(2, 'remember_me', 1, '2018-08-20 16:00:11'),
(3, 'forget_password', 1, '2018-08-20 16:00:11'),
(4, 'sign_in', 1, '2018-08-20 16:00:11'),
(5, 'dont_have_an_account_yet', 1, '2018-08-20 16:00:11'),
(6, 'sign_up', 1, '2018-08-20 16:00:11'),
(7, 'enter_your_details_to_create_your_account', 1, '2018-08-20 16:00:11'),
(8, 'i_agree_the', 1, '2018-08-20 16:00:11'),
(9, 'terms_and_conditions', 1, '2018-08-20 16:00:11'),
(10, 'cancel', 1, '2018-08-20 16:00:11'),
(11, 'enter_your_email_to_reset_your_password', 1, '2018-08-20 16:00:11'),
(12, 'request', 1, '2018-08-20 16:00:11'),
(13, 'app_manager', 1, '2018-08-20 16:00:12'),
(14, 'supplier_and_product_manager', 1, '2018-08-20 16:00:12'),
(15, 'logout', 2, '2018-08-20 16:00:12'),
(16, 'my_profile', 2, '2018-08-20 16:00:12'),
(17, 'title', 3, '2018-08-20 16:00:12'),
(18, 'update_profile', 3, '2018-08-20 16:00:12'),
(19, 'settings', 3, '2018-08-20 16:00:12'),
(20, 'personal_details', 3, '2018-08-20 16:00:12'),
(21, 'first_name', 3, '2018-08-20 16:00:12'),
(22, 'last_name', 3, '2018-08-20 16:00:12'),
(23, 'email', 3, '2018-08-20 16:00:13'),
(24, 'password', 3, '2018-08-20 16:00:13'),
(25, 'save_changes', 3, '2018-08-20 16:00:13'),
(26, 'cancel', 3, '2018-08-20 16:00:13'),
(27, 'string_required', 4, '2018-08-20 16:00:13'),
(28, 'email_required', 4, '2018-08-20 16:00:13'),
(29, 'password_required', 4, '2018-08-20 16:00:13'),
(30, 'password_confirmation_confirmed', 4, '2018-08-20 16:00:13'),
(31, 'processing', 5, '2018-08-20 16:00:14'),
(32, 'form_submitted', 6, '2018-08-23 18:43:52'),
(33, 'user_updated', 6, '2018-08-23 18:43:52'),
(34, 'error_with_api', 6, '2018-08-23 18:43:52'),
(35, 'birthdate', 3, '2018-08-23 19:13:03'),
(36, 'select_language', 2, '2018-08-23 20:25:22');

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
  `image` varchar(150) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_languages`
--

INSERT INTO `list_languages` (`id`, `name`, `image`, `created_on`) VALUES
(1, 'es-ES', 'assets/images/languages/es-ES.jpg', '2018-08-20 14:36:33'),
(2, 'en', 'assets/images/languages/en.jpg', '2018-08-20 14:36:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list_permissions`
--

DROP TABLE IF EXISTS `list_permissions`;
CREATE TABLE IF NOT EXISTS `list_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_permissions`
--

INSERT INTO `list_permissions` (`id`, `name`, `description`, `created_on`) VALUES
(1, 'see_complete_company_information', 'ver información completa de empresa', '2018-08-20 16:18:26'),
(2, 'edit_company_information', 'editar información completa de empresa', '2018-08-20 16:18:26'),
(3, 'edit_company_see_complete_user_informationinformation', 'ver información completa de usuario', '2018-08-20 16:18:26'),
(6, 'edit_user_information', 'editar información completa de usuario', '2018-08-20 16:21:51');

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
  `products_categories_id` int(11) DEFAULT NULL,
  `order_weight` smallint(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `products_categories` (`products_categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list_sections`
--

INSERT INTO `list_sections` (`id`, `name`, `created_on`) VALUES
(1, 'authentication', '2018-08-20 14:36:33'),
(2, 'navigation', '2018-08-20 14:36:34'),
(3, 'my_profile', '2018-08-20 14:36:34'),
(4, 'errors_form', '2018-08-20 14:36:35'),
(5, 'messages', '2018-08-20 14:36:36'),
(6, 'notifications', '2018-08-23 18:43:52');

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
  `provider_id` int(11) DEFAULT NULL,
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
  `business_id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `business_id`, `user_id`, `created_on`) VALUES
(1, 3, 1, '2018-08-07 12:44:15'),
(2, 1, 1, '2018-08-07 12:45:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(21, 'f612e5f9c77c47433837b6e58674ebfc6d4802876f125598840fa0cf237fbfd5867ff508336ddfef8cf9885c01643463789924d5df1100dd0f55160e6a27b09b', 'test@tes.com', '2018-08-31 13:16:52'),
(22, '1afe9a7873e1b15c3ee422642876ea4aa3b5123ab051028fa318b8e9642279adb60f5e2def134f0cfd2d8ea5a7c9c1fb2e175d5105ce9cbbe65fc38fc0e578f2', 'test@tes.com', '2018-08-14 18:40:20'),
(23, 'e6846185039ae4dc82e6140832cb4cc6d7e40d8fbcd5c81f8b69b894b39bb8cfea240e52a6926f9123bd529eefc0d486efab6db2f7a48e7f84f7b986661c8fc0', 'test@tes.com', '2018-09-06 18:40:29'),
(24, '5a604b75c7ec09644a16775dd3cd39b9bbe2a9a00255e3fd8d774dd3ba8d683d85dd4b6def1136e3dac97fd1dd40fa9097f8b355d91f5d6553b90e1d9f1a6b2c', 'admin@admin.com', '2018-09-06 18:56:31'),
(25, '0cae3db786c76b1d3f7129ce55e23b37e345e01feba11b2137b0335727209f94bb7046a0155f72739b7797355b8ef740b0451ad2ea1a0f09ca199821301d9241', 'admin@admin.com', '2018-09-07 21:25:51'),
(26, '2c19dc588ed15570181bfeb7e79f70d95064c2e00613a7e64b69883808efd12fa940857679ced830246ef4634bb0f6d0f905dc6109b4d2c40395dea019f60531', 'admin@admin.com', '2018-09-07 21:27:37'),
(27, '36a76e833b75fb404aa629c3826b20fbc7488367d49925b2092e996200d5b38f4ecda3e34242d422163195496be87962a909de5c7c2aed396328425f09dce918', 'admin@admin.com', '2018-09-07 21:29:52'),
(28, '53dc8b1bbece67e40b371796ed6858db19ad98d7b7cf12dd9e2553fa6234de84971b87e3efd55e3298070f3cd9bcc07a11cd9e4e9245a7033e7a6930cc359093', 'admin@admin.com', '2018-09-07 21:30:26'),
(29, 'dc6d146f15e8c62751dd8024a9aba2fa4206b77ecabf914c29af7c8b5b9c581a5654b57a0bd1698251a5e669e6c0452328127473eb80958e502616dc92290dea', 'admin@admin.com', '2018-09-07 21:31:17'),
(30, '2a6f02223cc93dffa9e1eb06183a9ebff3f9e46731303567a2cfda5677cde653a9b7579a15f38f8692bab571094d3676e44029ce9c79509491f1f4c0b642b59a', 'admin@admin.com', '2018-09-07 21:31:53'),
(31, '64f13d81a4599d1260c771cc12fe1072bec099bbfef613e0be124ca8ed879ef6b7e468be9792af9fe11d0b5c5846a9d974b1f939e27ecc27e83edff2dca1e85f', 'admin@admin.com', '2018-09-07 21:33:43'),
(32, '9ffeb8619773c0496a73b816048ebdab89abbcedd16138ff1f785c3ab40a9a3abd1277b36f887e75d8f84a5ffa57120239f373ea04d8f37a37930b5848369945', 'admin@admin.com', '2018-09-07 21:34:44'),
(33, 'f3cff0c8d21ebcc0ead2380969c1914859349e2fa878916ed543ec2dcd3650389c9385ffa671bc729c962209247f4053abeef2dce370794b140bb40703b94fd1', 'admin@admin.com', '2018-09-07 21:36:28'),
(34, '1ed403163e511e7139b5be67091dd8af7c05a291ad66a7316019b990af5945adb463c7c5a31f5e85f099af6764a400916b07b94e14f7b41d289080fbcfc2a77f', 'admin@admin.com', '2018-09-08 17:56:46'),
(35, '05ee85cc389780322c95f67663ce7acb36a7b435f9e018b8ed7386d8a13b0b88a7a49aec16fc893a0198421a1eb482b473e6becc90de0fed83b4f267cfcbb37b', 'admin@admin.com', '2018-09-08 18:05:57'),
(36, '55d389d8591f3625f24dd4aa6f136a9c1b0a35fe2fd5aed125242279c63da2e26d708a23fde54bf599472658080a489fa79da8f532e1c1856aeced6be37d0f43', 'admin@admin.com', '2018-09-08 18:22:28'),
(37, '66cb4ec8628668563463be2f4e165517ad51b011b8752ab2ad621b8b3dcaffe35e90a6ed39219ea265d4595835945294a6b88b7d1cf7cef8fda8bcc716932af0', 'admin@admin.com', '2018-09-08 19:15:52'),
(38, '2cebf7a900c23aff15426066a14c54fe096abd1bcbe0a88ce3335fa253c1107b2a3a3f33e849fca24b215b2556e644c1c37a1b937c3ad8bcb9a4bf5362d020f9', 'admin@admin.com', '2018-09-08 19:16:40'),
(39, '160a986880d75844595387f6483c2fd33527d33745ab0b388ff19ae554762aad296dc5dae35d6cf6cf60546770a538c129a053bf0bc624f46e3fd6c003872a21', 'admin@admin.com', '2018-09-08 19:17:30'),
(40, '8de61c84ce55d48029220dcaa277e312c90b05b79289631cf3989bcb9022179ac1bb300571b5fb89f477d7a1dfbfd7087a822b7a29f83a74c925ba80c25742ab', 'admin@admin.com', '2018-09-08 19:21:51'),
(41, 'f4601934e93e30e795ca03e154ac0770aa48bb23938d590e27b5373ad3396b057168595ccd7a23eb367e2a93399e1be51b02b42004def53e16c8441a5f818c47', 'admin@admin.com', '2018-09-08 19:24:59'),
(42, 'b4164fa3b807a19f4463cf42dbaaa9b4e043f846a6caaccf945eb4ee366662f397f0ff20418f133fd57478f37394842db6bfada1701f3db56d41b2e5fb1506f4', 'admin@admin.com', '2018-09-08 19:26:41'),
(43, 'b1a33ff880bff926e3cdc5222d4ce92165cf0786489e7704cc8db249fcb7127ce76344b70036d1edc42ce49c46f96a43ba6a417e4c5f121e85a8ad4a361a8cb0', 'admin@admin.com', '2018-09-08 19:27:40'),
(44, '62ade9fc74a42405914ab4ad860bade5b78522b3683592972f12c01d37e38ce2a64475d89fd55e0feeadbc13fe20185729249b23f31c0997a3d6eea69ed5312c', 'admin@admin.com', '2018-09-08 19:29:43'),
(45, '6ee205f7c11c7ab4a5c63ae7b64f9be14d80a0c842fb36d454ab8e534c6811a3ac41299b75a52f52fa8e16d33321e295cf695373c85d721281dad70ec03b62b6', 'admin@admin.com', '2018-09-08 19:32:24'),
(46, 'efa38f1f2f62b012a6d0f3819376ea6e9b83d1379434c5e87c2fa354c41f204cb7dc99e07089288f437e38bef0bc6ae2c3753f4d9c8a1a7f6adaa41caa645189', 'admin@admin.com', '2018-09-08 19:34:27'),
(47, '4be8412680b16739b833763668353ad4c3045fb7df775c2678566756547febc60368528ef136d94ccc570caacd72478b1a3d662083ca754590286e8e54c5960d', 'admin@admin.com', '2018-09-08 19:39:01'),
(48, 'f74b687ef5b98f37d91ca0dafcb7047ab69c3fabd58a643837b5a8f93b5ecaf43c1440fe99860fc7b001f07d9fe83276da3aaba06af1e867ae605efb7a7a40f9', 'admin@admin.com', '2018-09-08 19:40:06'),
(49, '5837afc267ceff06d5e85a5a4779b47b366277d33e11ef702d5135998ac58b2d78d6adb5b6057cb8e593f53003500a559a01d04c4a6a2a5997d5b33732fd8e8c', 'admin@admin.com', '2018-09-08 19:48:59'),
(50, 'd52b72d29ebdf75a087e584f17cc4e645f3454a497689ca4450b323acbc14c6f96fc1157a9b2c0e8f2a7642e126b5950e40ccc45872efd9faa33473f0fa09212', 'admin@admin.com', '2018-09-08 19:52:19'),
(51, '20a8c7f4b43868ec748c12a9441851bad634b0dda9d418e7beca0ff4969a9f43b82ea48fbf00fc5634207cf6a99d7f2ab824f2ab8a6d573be418d0ca593579b0', 'admin@admin.com', '2018-09-08 19:53:32'),
(52, '278770f04915c60dae001daed50db6d8f32043f0cb6fb118c8f18735e873d5e1fabe279210566a7e1bcc79c4def5409a0f98f33a54e94c37f74953799e5b0838', 'admin@admin.com', '2018-09-08 19:59:57'),
(53, 'ca18390c7555c716ebccfd3dffae436152349d8be0e4edfb59eaccffe2820e4984f4cbf7adde862e7dfb540a4712d29ec22e295b190f285e2035d5ca411e77ce', 'admin@admin.com', '2018-09-08 20:02:20'),
(54, 'b0fc5fee883dc009814b48074bd93eb130ffb6343339729ef8ae1d94a91a764a38a423fad7402b7a37c6dbe2b75564b05ebb0794bba6fdedb3a8f062ec438323', 'admin@admin.com', '2018-09-08 20:08:30'),
(55, '9cedfd76626afc4dcf58f8bf719d2b9a4ebe28401a8ea14c33eb20fe18fd854d59957dcf2e3fcdced52a1fe3051baba18ca67529547e174023215c4fd433ac5f', 'admin@admin.com', '2018-09-08 20:08:34'),
(56, 'cd0996d564c47c342af51811943dcb3c6e8e12fc54207c7fe1619999aec343bfcdda642914b30fe9942bede2d3b0c8ad79f48df257e767922d5c5f2f519ac5d9', 'admin@admin.com', '2018-09-08 20:08:36'),
(57, '11de79cb745482de583bdd2e9cfaa1323551c4750d30e96aaf3541bd63a9d0c0f445940e1016163842eb2a4458f86792bf41918b0977d274250c4fd57998f71e', 'admin@admin.com', '2018-09-08 20:08:38'),
(58, 'a7263e385ff6fcdac427acf6293589d91a473a0c697ed236dff2e3cf9436af5e93eef936a7993d61b67becc6922736b59ef543d37c328fe288e674c3d1303b2b', 'admin@admin.com', '2018-09-08 20:08:46'),
(59, '6883c1daf855dae2fccf90563197fbba490a866d84587722fb70db552c28a544200172a9d9f2748a12131ec894cc7c940ee8d75dfb17bd897e35c02c4dbd9ffb', 'admin@admin.com', '2018-09-08 20:18:08'),
(60, '869145f814855c9ace4f980398daabac56fb55322a985970fff6e3583399443cf5b0548b7aec7bf677911ee5fc39f39e1246ea0e2306386352f4b304310718b2', 'admin@admin.com', '2018-09-08 20:20:13'),
(61, 'a08edc3ecab47d614294b4f0d415922bc55c9692b67b2acbc97c90544bf99c8d55e660bf2c26c12215ae816a32fb03329ea2398120d3689ad3157454521438b1', 'admin@admin.com', '2018-09-08 20:22:08'),
(62, '6c9b51f5cf706db0104f232726a0eeb6f3f3d71a520f534f798bde18d07375cc49a6a8c9d7b054bfc4451df5b8bb0f9f44541b3d9c876b7503f3edabfce204b8', 'admin@admin.com', '2018-09-08 20:28:08'),
(63, '8be97a5d3539270f165771c5b7d0b91e446c7cb4e761b936811b71a84926ebeff550564d230e1590b0df2a853c61bdb871e1293ba96160d6abfd264a68090564', 'admin@admin.com', '2018-09-08 20:29:31'),
(64, '502b1b2ea534c99ccabb5fe9c34154ebf542e6f4cdc81aba7b6d48c5ae20d368e7e16a091076b4507ab588a1418ec452a50c0f1a4d7d2d90386683af3f916c9d', 'admin@admin.com', '2018-09-08 20:34:21'),
(65, '4ffd6ebec61137f298f8e36bdd35673bebb2177b62ae46c7f87b094f996ce9f7ed5a15ac94ae4178fd650b8eaddf59c9a1fb9aa2ec635434c9a80818f745609d', 'admin@admin.com', '2018-09-08 20:35:03'),
(66, 'd78c442328b65c81ed9431360275ed68b7ac1f16846832ef22c76a30c59e76191c15364c1c3f682a94da2ea26658dbcd1bb9d1ee4a3d0ff4e89731f0e6bc26c5', 'admin@admin.com', '2018-09-08 20:36:12'),
(67, '526a400a5007b3643ed56e3d32c4a40e70d9c20ad4e8a6a2f8bf285a2928cd5a129e04e5cd7815e0c7a11d32a141f2bdc9ecc6236340c8e88947b356c3eac6c8', 'admin@admin.com', '2018-09-08 20:38:06'),
(68, 'de934380087a49b37cc955555221d08bab2cc6a680fb400805e56b5ac684c3f20e3b3c4c05f3ce303b70d622c545d1f94a03e6ca5225f3739642c1f6bc688d75', 'admin@admin.com', '2018-09-08 20:39:18'),
(69, 'c818c6daeb7f75daccac39ec18727eab91f6efeb7bb11b5634103db4cdf511a63f2e98af71e97bb12468563b5e0306dcbd63abf5137a1d5fa6a2ea4641a90eaa', 'admin@admin.com', '2018-09-08 20:59:57'),
(70, 'a7683f593a5c698662409d4800ea78a660c04104db963d879c660685034f3cb63af5b13a281a8624321b98a79693993c730ff8e51ec44bb2490867a895d102ec', 'admin@admin.com', '2018-09-08 21:01:00'),
(71, 'ec7eb615351c908e6846e89e0563a3b685635191c61b85ccaf1027ae692183179967ffb1300ac7068d43baa56550f1313a022fd3ce3edfb3e1731d85f1e8f1f1', 'admin@admin.com', '2018-09-08 21:02:51'),
(72, '0577663ad7f470555a7b6cd1eae2a3ab97963429ed7dbafd07a1e812fac2478dee2b1a82accfbb3d8b20b0f40670100c89401074376ebcdb8b619b90f29e29e3', 'admin@admin.com', '2018-09-08 21:03:23'),
(73, 'a1372a2179971209eb5e79a9bfcad0bba6bc548f12948ee04aa5d7357a12c59c0b7ffc436c11f6753596ab9356d1572aa537e3b06215aaec77c1616662dceb94', 'admin@admin.com', '2018-09-08 21:03:58'),
(74, 'f6ef871464cfa969aa7a76c2e92b9e289be3e7294712bb2b0c754a7974bc3d8c3805be10d00f93922a5abb8b79b5b7af20acf8489f5ab5c110ab91c3955fbd96', 'admin@admin.com', '2018-09-08 21:04:18'),
(75, '9d621fd2c98b74dca4a9dcc11cd3aa3b12a8ac2264a67adcb31f903d1636d12fe526786d006a3998c90cc0c52ac87aa6f874e78a5a274b162cf8f20996802628', 'admin@admin.com', '2018-09-08 21:05:16'),
(76, 'ea05627f108d136b348dde5d0368f3712bcc636ab0e7e3e280a5a9fb73de08112a330393219cf84714cb693c514c50aafeb33dc4b67057eccf8b8bccedf80749', 'admin@admin.com', '2018-09-08 21:08:18'),
(77, '49b69d8492f6aa0ebdaf3ae9af0f83849d212f9c384826998bbf91ce9d26394d6560ce6bef6aa4aa0bbaea79dea1aceb9ad4d3dc4a131713d7f6afbdd26ce9bc', 'admin@admin.com', '2018-09-08 21:14:50'),
(78, '52e779aced59a2dc476547466ba01f7d6791c53b2fbb26812496297030000d153c7f8659c221ba868f8477df078bd066aaf2e9b580125146b7e77e0d50ad97ed', 'admin@admin.com', '2018-09-08 21:15:29'),
(79, 'b0005c764d4df6c5f9ef3da32e2135bec66fe98ba3aa2c140154eaa2b35a55126f26770f31d03cddce729863d9f848f8fbafa291e7846c7e20a1fb5699b4b467', 'admin@admin.com', '2018-09-08 21:17:06'),
(80, '202b520145aa0bdcef7cfa6a352ecd1ea6db4ed04738657eb35f46be5fdb89088216452cd8d9c8754c73bf4724b2f56d7ed9c9194a1bfac99f618e3dc0ca125b', 'admin@admin.com', '2018-09-08 21:17:47'),
(81, '6b9244d22d2db67d4375870ca85159a85805ad9dc98fdd474af3fe4f68ce4fabbe275c28944ee19ece5ce24832759414bf22f38418c911c0160d09311b89f720', 'admin@admin.com', '2018-09-08 21:22:38'),
(82, 'cd257db02055a6574a35f28b03a6835bbf9123f7437881979616fc522b275424b62f8c43a54ef79aa1c908a8547b495a266a45251d0863a862e9e0a16f7922e6', 'admin@admin.com', '2018-09-08 21:23:57'),
(83, '7862ff5a8380a49b43ea80cab0bc5119787528b0f20bf175c7d3e3bd6bf523ca9282bb611bdb51497bd50fbd0d9c1828d0e8a2cab935e47481a79ddcb64ba659', 'admin@admin.com', '2018-09-08 21:25:07'),
(84, '2422593a2d04970f088b74c2fa303aa78b7b37eb5a04201b98ede4c19a71862f1cef00894bef7f5acec0fece15286eb56f718bd4990cf5b51fc8f2c6618d5e74', 'admin@admin.com', '2018-09-08 21:25:49'),
(85, '53bea43dd1d0f6b3e48d16f0d48b87c0dab4216512655ab0e036aaceb615897d9175bd834f888afae87c1f818573647054ce24afba570eb02fddb8c0eaf58100', 'admin@admin.com', '2018-09-08 21:27:01'),
(86, '64afeb65512cbdb13a68cd4c0fdf148d3f2ea134af101c035c1d6e02a52072db6eaacde203a4349314e5d051e8a180b1a4490b4400840aac38aa2241832fd772', 'admin@admin.com', '2018-09-08 21:47:27'),
(87, 'b6bf2b2c5286d87b02fe2726cd4a58b4b50349a59fb82bc81f24164982ee2088df8396429562e3bb304809bc89972ce47883295354b27906dd939b5ceb58c03b', 'admin@admin.com', '2018-09-08 21:49:28'),
(88, 'aa3ec1807e2926e2f7073a4bc6c82cfca6c3abc9cb22a3b563634aa652f6530ca7ddb6ddce1cd92f49dce2a390b027572011c0ce5250a52d283c59c08093d43a', 'admin@admin.com', '2018-09-10 08:10:09'),
(89, 'ca616e31cfa0b59952343a0bffb7e2d2b71dd9c73f0e78b279dc32630585795580fa8d2475d90263bae5c6fb7ebe1c13b2c584f8b8d9fad57db1b7482a862025', 'admin@admin.com', '2018-09-10 08:17:24'),
(90, 'b551620faefc600e951c8b09995be8e3f9515f43de202c2ae3036e9e6c50dae0f4a3486a6077c187d14d0bfd2594067f01932c3c694e4d463f7fe9def896858c', 'admin@admin2.com', '2018-08-18 09:56:02'),
(91, 'be87776ae89d70c592521325a865eadd4fba33955e5860ea01b16af94d30e0a49035d68ac77a5a25950ea69f43af92eb37e193911f8297d1702af7a1747c1ce5', 'admin@admin3.com', '2018-08-18 09:59:59'),
(92, 'd9d5a871a075ec1356634d54d25186506afe57b8173204d07c22292693eba433f7df930ad3787372c107d672d4a63525d8013f6474e947e72d0ee19662c9cafe', 'admin@admin1.com', '2018-08-18 10:01:18'),
(93, 'eafb7ea9491da9d780f335c73b8ba6cb6cc57e9aae284cabad98c2bae7847552dde964a0e2bce6b781aacc995003c1ef23e9bdf2d18e8224028ba6d72240a7f0', 'admin@admin2.com', '2018-08-18 10:02:42'),
(94, 'd092971c4b633d3a90869f50f4473984514e25fda97fa859d4d9914de0b3aa44bcc66aa72a3fdeee58df58e34b51236af83ddc1b49eccc573de3a852bb3c31f9', 'admin@admin3.com', '2018-08-18 10:03:42'),
(95, '1d3979e5ef7e810f2b8bde6ebde1a2e19fe9f59ce0b4d16d3028ea4f2436b2e3dab7b7fa2547f6484128170b5d15ac393799149871d5eda8b9f9b82c6821dd9a', 'Admin@admin4.com', '2018-08-18 10:08:13'),
(96, '82a952c34c977486e2bde99a8aa8d3724356c71f002f16ab85fd6e9c1fbc64ca19a1e4de2238791edf4cab95a45ca91c80a12b76428f631a07fada2fd0a8c9ed', 'admin@admin.it', '2018-08-18 10:09:59'),
(97, 'de35002e8ff4976d8e42d9fa1c2f4517ce085135a2ad7c9368cc5a9efd50131a798ade4ed6bc14ea9fb3a3e0d866c45a050bf188490d1b4dc8e0871fc136266f', 'admin1@2.com', '2018-08-18 10:12:33'),
(98, '8138e751d5036dd54f1ac9de1c51f19b6a347d12860e4cde0dcbdfafe4f981b82df9e640bcb0323c92fd776fa6b2a6a541e499198091ac93de7fa7a9d3048f69', 'admin@admin.com', '2018-09-10 10:15:40'),
(99, '436dff679739c1a858b73b5b96d9300d8f1fe48b89203881e8dc904f6ccd5872b79632f74acc163e2316134a0f0969c2664ba243b0b4bc587844cd5224c7bd99', 'admin@admin.com', '2018-09-10 10:16:00'),
(100, '976e5c99d2030ff2592fbce2eb46811398e0e31b05023a8e9da2f7e4d2f21b6a961019b23c2f8d88c0b653591bf0d81d37e240a10a797d9a307e320cb9d37e40', 'admin@admin.com', '2018-09-10 15:47:40'),
(101, 'f1bb961865a769d1d2e1fec8afb03e55b023a27be4bb8ebe32d958b5993a340c84048525c7631d9f0c17a2b6c693f82d6773c1603d10473f319c84402128cb00', 'admin@admin.com', '2018-09-15 12:27:21'),
(102, 'e619848717dd9cfe543ba1152dc21116d33f9b69c8b14d2c26e8d12be7150fbbd4b62b21f6436dcce74ecaa3b3fdf85f49680f73402ca4f95838c490c03db232', 'admin@admin.com', '2018-09-15 14:54:43'),
(103, '1887a2cbba266250cb25bb606d65567f169326e7003e76d036178be3f245804f3557367940fb6c65bd5ed00ae70e8341884cf22cb853b5a7016e11b143fcfb0c', 'admin@admin.com', '2018-09-15 15:40:13'),
(104, '98c32ca00dc720406ce3afc1158895b1a9d447de210deb60572c24e2a1bde56187a6c739760de708bcda11a82a801be114ac0ed615be91af6030fe9fa398c3cb', 'admin@admin.com', '2018-09-15 17:02:53'),
(105, '34ff665d012b16430c79c988c8ccf14c5651137a18b61ede51965adfe9648d9a77b2ef7407cf7860393a4dcef757d87aa78acdc0a244d3f53567a000f5c129f6', 'admin@admin.com', '2018-09-15 17:34:44'),
(106, '726854f7357933eed9ce43ad3784daa54a201d93ae7608d385431ad4b3b94460d0b18060cfdaa2521548abbdfe1f98b6339a90d8c84f6f97ef05312ce5cc03a6', 'admin@admin.com', '2018-09-16 09:14:52'),
(107, '7e4c12d96849d04449efc0a9517adcf332912a3279a845826b45897ae90158023b54df616a6cbf73ef6bbab351e04a601ababb9d25d218a156fd56ef77e03166', 'admin@admin.com', '2018-09-16 15:58:03'),
(108, '80f9f8e57e292c71af0e42eebfb9acc8273d59ed5d5e974d63c4d3a5b3d619b970c860bed900303814bea7d934b616a090e5b456cb3df7bbede5a2aaf935e2f9', 'admin@admin.com', '2018-09-18 12:12:04'),
(109, '77622082dd80dc8938ba79b7cd2c973178f59155e413d29510654697e0dd363b57ccc1673b12f0a399610532b4125f5ffe603a3f3e150d1e813f65bf20312b5d', 'admin@admin.com', '2018-09-18 16:38:52'),
(110, 'e13cb5863ea977993656ef4b58f2f9a80d7c9f22850897010e76aa48f0d37ad7c77aba427a783e775a252a8f8b37fcd0acdd7b09cddf6045a01f85c1d5fe78a2', 'admin@admin.com', '2018-09-19 17:34:47'),
(111, 'b4273d2d0394e328420638f59382fdf7b4fdb30596f5113f3b28930d6303e9380f39fe22097540b915c3fe134c633e7d402409d56d240398f549280b5484d8fd', 'admin@admin.com', '2018-09-19 19:28:07'),
(112, '00785f22d54c75ad4981d1db90ba0ad9247cad86185dde5c76ee45766deb86c08b388f60d64457d1147f848ffe76113841786db2161fe2e562f5ce3c4776df06', 'admin@admin.com', '2018-09-19 19:39:11'),
(113, 'db71b54546b5199eb24e6c30751eb1efa679289200796921bbcb3331ee50fa69fc8faf9d8d12eb552d576187f29f2c372e73a5085614175d70ffe1cb453ca712', 'admin@admin.com', '2018-09-20 19:13:53'),
(114, 'f6788ba8f661b0e5ee4029a36807a8c4c404f572df13785a2d944b83fe0eeaff7e7388511ff6edfb62932f638ca928a1085171434132ab132a82995d4aad105c', 'admin@admin.com', '2018-09-20 20:15:58'),
(115, '4fb4a309f746e026739fce11a57410c9a7c38b934d2bdebae31c891dc78f52004a2552e521f4aec9f1d5cf455304dd743c34660a467b666fa49061c1481ab3d8', 'admin@admin.com', '2018-09-21 18:15:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `permission` (`permission`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles_permissions`
--

INSERT INTO `roles_permissions` (`id`, `role`, `permission`, `value`, `created_on`) VALUES
(1, 3, 1, 1, '2018-08-20 16:47:22'),
(2, 6, 1, 1, '2018-08-20 16:47:22'),
(3, 3, 2, 1, '2018-08-20 16:47:22'),
(4, 6, 2, 1, '2018-08-20 16:47:22'),
(5, 3, 3, 1, '2018-08-20 16:47:22'),
(6, 6, 3, 1, '2018-08-20 16:47:22'),
(7, 3, 6, 1, '2018-08-20 16:47:23'),
(8, 6, 6, 1, '2018-08-20 16:47:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `name`, `description`, `value`, `auth`, `modified_on`, `created_on`) VALUES
(9, 'name_app', NULL, 'unnamed', 0, '2018-08-20 15:45:00', '2018-08-20 15:45:00'),
(10, 'url_img_logo_vertical', NULL, '/assets/images/logo/main_logo.jpg', 0, '2018-08-20 15:45:00', '2018-08-20 15:45:00'),
(11, 'url_img_logo_horizontal', NULL, '/assets/images/logo_default_dark.png', 0, '2018-08-20 15:45:00', '2018-08-20 15:45:00'),
(12, 'dismiss_secs_alerts', NULL, '10', 0, '2018-08-20 15:45:00', '2018-08-20 15:45:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translation` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `language` int(11) DEFAULT NULL,
  `content` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_translations_content` (`content`),
  KEY `list_translations_languages` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `translation`, `language`, `content`) VALUES
(1, 'Iniciar sesión en el Administrador', 1, 1),
(2, 'Recuérdame', 1, 2),
(3, '¿Olvidáste tu Password?', 1, 3),
(4, 'Iniciar sesión', 1, 4),
(5, '¿No tienes cuenta todavía?', 1, 5),
(6, 'Regístrate', 1, 6),
(7, 'Introduzca los datos para crear su cuenta:', 1, 7),
(8, 'Estoy de acuerdo con los', 1, 8),
(9, 'términos y condiciones', 1, 9),
(10, 'Cancelar', 1, 10),
(11, 'Introduzca su email para restaurar su password:', 1, 11),
(12, 'Solicitar', 1, 12),
(13, 'Administrador de aplicaciones', 1, 13),
(14, 'Proveedor y Gerente de Productos - %{controller}', 1, 14),
(15, 'Salir', 1, 15),
(16, 'Mi Perfil', 1, 16),
(17, 'Mi Perfil', 1, 17),
(18, 'Actualizar Perfil', 1, 18),
(19, 'Configuración', 1, 19),
(20, 'Detalles Personales', 1, 20),
(21, 'Nombe', 1, 21),
(22, 'Apellidos', 1, 22),
(23, 'Email', 1, 23),
(24, 'Password', 1, 24),
(25, 'Guadar cambios', 1, 25),
(26, 'Cancelar', 1, 26),
(27, 'Campo de texto requerido', 1, 27),
(28, 'Campo de email requerido', 1, 28),
(29, 'Campo password requerido', 1, 29),
(30, 'El password no coincide', 1, 30),
(31, 'Procesando datos...', 1, 31),
(32, 'Sign In To Admin', 2, 1),
(33, 'Remember me', 2, 2),
(34, 'Forget Password?', 2, 3),
(35, 'Sign In', 2, 4),
(36, 'Don\'t have an account yet ?', 2, 5),
(37, 'Sign Up', 2, 6),
(38, 'Enter your details to create your account:', 2, 7),
(39, 'I Agree the', 2, 8),
(40, 'terms and conditions', 2, 9),
(41, 'Cancel', 2, 10),
(42, 'Enter your email to reset your password:', 2, 11),
(43, 'Request', 2, 12),
(44, 'App Manager', 2, 13),
(45, 'Supplier & Product Manager', 2, 14),
(46, 'Logout', 2, 15),
(47, 'My Profile', 2, 16),
(48, 'My Profile', 2, 17),
(49, 'Update Profile', 2, 18),
(50, 'Settings', 2, 19),
(51, 'Personal Details', 2, 20),
(52, 'First Name', 2, 21),
(53, 'Last Name', 2, 22),
(54, 'Email', 2, 23),
(55, 'Password', 2, 24),
(56, 'Save changes', 2, 25),
(57, 'Cancel', 2, 26),
(58, 'Text field required', 2, 27),
(59, 'Email field required', 2, 28),
(60, 'Password field required', 2, 29),
(61, 'The password does not match', 2, 30),
(62, 'Processing data...', 2, 31),
(63, 'Formulario enviado', 1, 32),
(64, 'Usuario actualizado!', 1, 33),
(65, 'Error con la API', 1, 34),
(66, 'Form Submitted!', 2, 32),
(67, 'User updated!', 2, 33),
(68, 'Error with API', 2, 34),
(69, 'Cumpleaños', 1, 35),
(70, 'Bithdate', 2, 35),
(71, 'Seleccione un Lenguaje', 1, 36),
(72, 'Select language', 2, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plain_password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  KEY `gender` (`gender`),
  KEY `business_id` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `business_id`, `gender`, `image`, `username`, `email`, `password`, `plain_password`, `firstname`, `lastname`, `address`, `postal_code`, `phone`, `phone2`, `birthdate`, `year_of_birth`, `timezone`, `is_active`, `disabled_on`, `last_modified_on`, `created_on`) VALUES
(1, 3, NULL, '/files/business/3/users/1/avatar.jpg', 'admin@admin.com', 'admin@admin.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Pepe', 'Botilo Fernández', NULL, NULL, NULL, NULL, '2018-08-08', NULL, NULL, 1, NULL, '2018-07-25 14:47:05', '2018-07-25 14:47:05'),
(10, NULL, NULL, NULL, 'test1@tes.com', 'test1@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 08:58:51', '2018-07-30 08:58:51'),
(11, NULL, NULL, NULL, 'test2@tes.com', 'test2@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-07-30 09:59:34', '2018-07-30 09:59:34'),
(12, NULL, NULL, NULL, '1@1.com', '1@1.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'hector', 'hector', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 07:02:39', '2018-08-01 07:02:39'),
(13, NULL, NULL, NULL, '1test@tes.com', '1test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 09:53:18', '2018-08-01 09:53:18'),
(14, NULL, NULL, NULL, '2test@tes.com', '2test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 09:55:16', '2018-08-01 09:55:16'),
(15, NULL, NULL, NULL, '12@1.com', '12@1.com', '2lvfiXzaiUo6+gNw9kDrll6kLBSS3nt7bbmhnC+gV2BORS9QKK0YLbIOcYcOffUTo3Xf3LMQw+R8kEBW7uS/4g==', '1aA_', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-01 11:20:37', '2018-08-01 11:20:37'),
(16, NULL, NULL, NULL, 'test@tes.com', 'test@tes.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Jhon', 'Marshall', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-07 18:40:20', '2018-08-07 18:40:20'),
(19, NULL, NULL, NULL, 'admin@admin1.com', 'admin@admin1.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:01:18', '2018-08-11 10:01:18'),
(20, NULL, NULL, NULL, 'admin@admin2.com', 'admin@admin2.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:02:41', '2018-08-11 10:02:41'),
(21, NULL, NULL, NULL, 'admin@admin3.com', 'admin@admin3.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:03:41', '2018-08-11 10:03:41'),
(22, NULL, NULL, NULL, 'Admin@admin4.com', 'Admin@admin4.com', '+7U9/kK4Kz74XJbOAVFFmeFB1gKDT613sJN120QBN3RivSEQn5H4d8cIyGvECLdOZmu4xEjibOMjEelsCLZFaw==', 'aA1234', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:08:13', '2018-08-11 10:08:13'),
(23, NULL, NULL, NULL, 'admin@admin.it', 'admin@admin.it', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'admin', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:09:59', '2018-08-11 10:09:59'),
(24, NULL, NULL, NULL, 'admin1@2.com', 'admin1@2.com', '99NVsHFzGM2tU3TwLxIWTdWfbjzHqfg+FrUVgVZPN1myP30dSb2i6FYBsCMYMOPRPVOrWgBhJvEmisKXAmwUig==', 'aA123', 'Admin', 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2018-08-11 10:12:33', '2018-08-11 10:12:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users_roles`
--

INSERT INTO `users_roles` (`id`, `role_id`, `user_id`) VALUES
(1, 3, 1),
(10, 6, 11),
(11, 6, 12),
(12, 6, 13),
(13, 6, 14),
(14, 6, 15),
(15, 6, 16),
(18, 6, 19),
(19, 6, 20),
(20, 6, 21),
(21, 6, 22),
(22, 6, 23),
(23, 6, 24);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `FK_8D36E38A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_address_city`
--
ALTER TABLE `list_address_city`
  ADD CONSTRAINT `FK_2AF237C44ADAD40B` FOREIGN KEY (`province`) REFERENCES `list_address_province` (`id`);

--
-- Filtros para la tabla `list_address_province`
--
ALTER TABLE `list_address_province`
  ADD CONSTRAINT `FK_FBD77D4415F9A0` FOREIGN KEY (`ccaa`) REFERENCES `list_address_ccaa` (`id`);

--
-- Filtros para la tabla `list_contents`
--
ALTER TABLE `list_contents`
  ADD CONSTRAINT `FK_CA972217D8C6B56F` FOREIGN KEY (`section`) REFERENCES `list_sections` (`id`);

--
-- Filtros para la tabla `list_genders`
--
ALTER TABLE `list_genders`
  ADD CONSTRAINT `FK_5F5475B0A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_products_categories`
--
ALTER TABLE `list_products_categories`
  ADD CONSTRAINT `FK_2F4AF424A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_products_subcategory`
--
ALTER TABLE `list_products_subcategory`
  ADD CONSTRAINT `FK_72A31041931BBDCF` FOREIGN KEY (`products_categories_id`) REFERENCES `list_products_categories` (`id`),
  ADD CONSTRAINT `FK_72A31041A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `list_roles`
--
ALTER TABLE `list_roles`
  ADD CONSTRAINT `FK_6FADBAC4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_B3BA5A5A3290EF0` FOREIGN KEY (`products_subcategory_id`) REFERENCES `list_products_subcategory` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5AA53A8AA` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`),
  ADD CONSTRAINT `FK_B3BA5A5AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `FK_E225D417A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `roles_permissions_ibfk_1` FOREIGN KEY (`permission`) REFERENCES `list_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roles_permissions_ibfk_2` FOREIGN KEY (`role`) REFERENCES `list_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `translations`
--
ALTER TABLE `translations`
  ADD CONSTRAINT `FK_C6B7DA875E8DD731` FOREIGN KEY (`content`) REFERENCES `list_contents` (`id`),
  ADD CONSTRAINT `FK_C6B7DA87D4E097F` FOREIGN KEY (`language`) REFERENCES `list_languages` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_1483A5E9A89DB457` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`),
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
