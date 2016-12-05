-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-12-2016 a las 20:58:07
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fonjuprof`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amort_esp`
--

CREATE TABLE `amort_esp` (
  `PREST` int(11) DEFAULT NULL,
  `ID` decimal(10,0) NOT NULL,
  `INSTT` int(11) DEFAULT NULL,
  `MONTO` decimal(10,0) DEFAULT NULL,
  `TASA` decimal(10,0) DEFAULT NULL,
  `VENC` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PAGADA_EL` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CANC` decimal(10,0) DEFAULT NULL,
  `INT` decimal(10,0) DEFAULT NULL,
  `ABONO` decimal(10,0) DEFAULT NULL,
  `PAGO` decimal(10,0) DEFAULT NULL,
  `RESTA` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `amort_esp`
--

INSERT INTO `amort_esp` (`PREST`, `ID`, `INSTT`, `MONTO`, `TASA`, `VENC`, `PAGADA_EL`, `CANC`, `INT`, `ABONO`, `PAGO`, `RESTA`) VALUES
(3233, '1', NULL, '1222', '1', '31/07/2011', '18/10/2011', '1222', '974', '247', '247', '35183');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amort_nor`
--

CREATE TABLE `amort_nor` (
  `PREST` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `INSTT` int(11) DEFAULT NULL,
  `MONTO` int(11) DEFAULT NULL,
  `TASA` int(11) DEFAULT NULL,
  `VENC` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `PAGADA_EL` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CANC` int(11) DEFAULT NULL,
  `INT` int(11) DEFAULT NULL,
  `ABONO` int(11) DEFAULT NULL,
  `PAGO` int(11) DEFAULT NULL,
  `RESTA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asoc`
--

CREATE TABLE `asoc` (
  `INSTT` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `FRECUENCIA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `P_IR_SOL_PREST_X_VA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ORIGEN` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `CEDULA` varchar(14) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(35) COLLATE utf8_bin DEFAULT NULL,
  `TELEFONO` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CODIGO` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `CORREO` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `INGRESO` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `APT_PERS_CANC` int(11) DEFAULT NULL,
  `APT_PERS_PDT` int(11) DEFAULT NULL,
  `APT_PAT_CANC` int(11) DEFAULT NULL,
  `APT_PAT_PDT` int(11) DEFAULT NULL,
  `APT_VOL` int(11) DEFAULT NULL,
  `AHORRADO` int(11) DEFAULT NULL,
  `DEUDA` int(11) DEFAULT NULL,
  `FIANZAS` int(11) DEFAULT NULL,
  `CUOTAS_VENC` int(11) DEFAULT NULL,
  `DISP` int(11) DEFAULT NULL,
  `ULT_RET_80` int(11) DEFAULT NULL,
  `ULT_RET_50` int(11) DEFAULT NULL,
  `ULT_RET_25` int(11) DEFAULT NULL,
  `ULT_RET_20` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditar`
--

CREATE TABLE `auditar` (
  `id` int(11) NOT NULL,
  `CedulaEmp` int(11) NOT NULL,
  `CedulaPers` int(11) NOT NULL,
  `Contenido` text COLLATE utf8_unicode_ci NOT NULL,
  `Accion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Auditor Planilla';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carg_fam`
--

CREATE TABLE `carg_fam` (
  `ID` int(11) NOT NULL,
  `INSTT` int(11) DEFAULT NULL,
  `CEDULA_ASOC` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `P_IR_ASOCIADO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ASOC` int(11) DEFAULT NULL,
  `PARENTESCOS` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CEDULA` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FECHA_NAC` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `sid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `username` int(11) DEFAULT NULL,
  `Cedula` bigint(20) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `chat_sessions`
--

INSERT INTO `chat_sessions` (`sid`, `time`, `username`, `Cedula`, `status`) VALUES
('', 0, 9, 19191493, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_ciudad`
--

CREATE TABLE `c_ciudad` (
  `id` int(11) NOT NULL,
  `Ciudad` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ingresar Ciudades';

--
-- Volcado de datos para la tabla `c_ciudad`
--

INSERT INTO `c_ciudad` (`id`, `Ciudad`) VALUES
(1, 'Barinas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_estados`
--

CREATE TABLE `c_estados` (
  `id` int(11) NOT NULL,
  `idCiudad` int(11) NOT NULL,
  `Estado` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ingresar Estados';

--
-- Volcado de datos para la tabla `c_estados`
--

INSERT INTO `c_estados` (`id`, `idCiudad`, `Estado`) VALUES
(1, 1, 'DISTRITO CAPITAL'),
(2, 1, 'AMAZONAS'),
(3, 1, 'ANZOÁTEGUI'),
(4, 1, 'APURE'),
(5, 1, 'ARAGUA'),
(6, 1, 'BARINAS'),
(7, 1, 'BOLÍVAR'),
(8, 1, 'CARABOBO'),
(9, 1, 'COJEDES'),
(10, 1, 'DELTA AMACURO'),
(11, 1, 'FALCÓN'),
(12, 1, 'GUÁRICO'),
(13, 1, 'LARA'),
(14, 1, 'MÉRIDA'),
(15, 1, 'MIRANDA'),
(16, 1, 'MONAGAS'),
(17, 1, 'NUEVA ESPARTA'),
(18, 1, 'PORTUGUESA'),
(19, 1, 'SUCRE'),
(20, 1, 'TÁCHIRA'),
(21, 1, 'TRUJILLO'),
(22, 1, 'YARACUY'),
(23, 1, 'ZULIA'),
(24, 1, 'VARGAS'),
(25, 1, 'DEPENDENCIAS FEDERALES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_municipios`
--

CREATE TABLE `c_municipios` (
  `id` int(11) NOT NULL,
  `Municipio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ingresar Municipio';

--
-- Volcado de datos para la tabla `c_municipios`
--

INSERT INTO `c_municipios` (`id`, `Municipio`, `IdEstado`) VALUES
(1, 'Municipio Libertador', 1),
(2, 'Municipio Autónomo Alto Orinoco', 2),
(3, 'Municipio Autónomo Atabapo', 2),
(4, 'Municipio Autónomo Atures', 2),
(5, 'Municipio Autónomo Autana', 2),
(6, 'Municipio Autónomo Maroa', 2),
(7, 'Municipio Autónomo Manapiare', 2),
(8, 'Municipio Autónomo Río Negro', 2),
(9, 'Municipio Anaco', 3),
(10, 'Municipio Aragua', 3),
(11, 'Municipio Fernando de Peñalver', 3),
(12, 'Municipio Francisco del Carmen Carvajal', 3),
(13, 'Municipio Francisco de Miranda', 3),
(14, 'Municipio Guanta', 3),
(15, 'Municipio Independencia', 3),
(16, 'Municipio Juan Antonio Sotillo', 3),
(17, 'Municipio Juan Manuel Cajigal', 3),
(18, 'Municipio José Gregorio Monagas', 3),
(19, 'Municipio Libertad', 3),
(20, 'Municipio Manuel Ezequiel Bruzual', 3),
(21, 'Municipio Pedro María Freites', 3),
(22, 'Municipio Píritu', 3),
(23, 'Municipio San José de Guanipa', 3),
(24, 'Municipio San Juan de Capistrano', 3),
(25, 'Municipio Santa Ana', 3),
(26, 'Municipio Simón Bolívar', 3),
(27, 'Municipio Simón Rodríguez', 3),
(28, 'Municipio Sir Arthur Mc Gregor', 3),
(29, 'Municipio Turístico Diego Bautista Urbaneja', 3),
(30, 'Municipio Achaguas', 4),
(31, 'Municipio Biruaca', 4),
(32, 'Municipio Muñoz', 4),
(33, 'Municipio Páez', 4),
(34, 'Municipio Pedro Camejo', 4),
(35, 'Municipio Rómulo Gallegos', 4),
(36, 'Municipio San Fernando', 4),
(37, 'Municipio Bolívar', 5),
(38, 'Municipio Camatagua', 5),
(39, 'Municipio Girardot ', 5),
(40, 'Municipio José Angel Lamas', 5),
(41, 'Municipio José Félix Ribas', 5),
(42, 'Municipio José Rafael Revenga', 5),
(43, 'Municipio Libertador', 5),
(44, 'Municipio Mario Briceño Iragorry', 5),
(45, 'Municipio San Casimiro', 5),
(46, 'Municipio San Sebastián', 5),
(47, 'Municipio Santiago Mariño', 5),
(48, 'Municipio Santos Michelena', 5),
(49, 'Municipio Sucre', 5),
(50, 'Municipio Tovar', 5),
(51, 'Municipio Urdaneta', 5),
(52, 'Municipio Zamora', 5),
(53, 'Municipio Francisco Linares Alcántara', 5),
(54, 'Municipio Ocumare de La Costa de Oro', 5),
(55, 'Municipio Alberto Arvelo Torrealba', 6),
(56, 'Municipio Antonio José de Sucre', 6),
(57, 'Municipio Arismendi', 6),
(58, 'Municipio Barinas', 6),
(59, 'Municipio Bolívar', 6),
(60, 'Municipio Cruz Paredes', 6),
(61, 'Municipio Ezequiel Zamora', 6),
(62, 'Municipio Obispos', 6),
(63, 'Municipio Pedraza', 6),
(64, 'Municipio Rojas', 6),
(65, 'Municipio Sosa', 6),
(66, 'Municipio Andrés Eloy Blanco', 6),
(67, 'Municipio Caroní', 7),
(68, 'Municipio Cedeño', 7),
(69, 'Municipio El Callao', 7),
(70, 'Municipio Gran Sabana', 7),
(71, 'Municipio Heres', 7),
(72, 'Municipio Piar', 7),
(73, 'Municipio Raúl Leoni', 7),
(74, 'Municipio Roscio', 7),
(75, 'Municipio Sifontes', 7),
(76, 'Municipio Sucre', 7),
(77, 'Municipio Padre Pedro Chien', 7),
(78, 'Municipio Bejuma', 8),
(79, 'Municipio Carlos Arvelo', 8),
(80, 'Municipio Diego Ibarra', 8),
(81, 'Municipio Guacara', 8),
(82, 'Municipio Juan José Mora', 8),
(83, 'Municipio Libertador', 8),
(84, 'Municipio Los Guayos', 8),
(85, 'Municipio Miranda', 8),
(86, 'Municipio Montalbán', 8),
(87, 'Municipio Naguanagua', 8),
(88, 'Municipio Puerto Cabello', 8),
(89, 'Municipio San Diego', 8),
(90, 'Municipio San Joaquín', 8),
(91, 'Municipio Valencia', 8),
(92, 'Municipio Anzoátegui', 9),
(93, 'Municipio Falcón', 9),
(94, 'Municipio Girardot', 9),
(95, 'Municipio Lima Blanco', 9),
(96, 'Municipio Pao de San Juan Bautista', 9),
(97, 'Municipio Ricaurte', 9),
(98, 'Municipio Rómulo Gallegos', 9),
(99, 'Municipio San Carlos', 9),
(100, 'Municipio Tinaco', 9),
(101, 'Municipio Antonio Díaz', 10),
(102, 'Municipio Casacoima', 10),
(103, 'Municipio Pedernales', 10),
(104, 'Municipio Tucupita', 10),
(105, 'Municipio Acosta', 11),
(106, 'Municipio Bolívar', 11),
(107, 'Municipio Buchivacoa', 11),
(108, 'Municipio Cacique Manaure', 11),
(109, 'Municipio Carirubana', 11),
(110, 'Municipio Colina', 11),
(111, 'Municipio Dabajuro', 11),
(112, 'Municipio Democracia', 11),
(113, 'Municipio Falcón', 11),
(114, 'Municipio Federación', 11),
(115, 'Municipio Jacura', 11),
(116, 'Municipio Los Taques', 11),
(117, 'Municipio Mauroa', 11),
(118, 'Municipio Miranda', 11),
(119, 'Municipio Monseñor Iturriza', 11),
(120, 'Municipio Palmasola', 11),
(121, 'Municipio Petit', 11),
(122, 'Municipio Píritu', 11),
(123, 'Municipio San Francisco', 11),
(124, 'Municipio Silva', 11),
(125, 'Municipio Sucre', 11),
(126, 'Municipio Tocópero', 11),
(127, 'Municipio Unión', 11),
(128, 'Municipio Urumaco', 11),
(129, 'Municipio Zamora', 11),
(130, 'Municipio Camaguán', 12),
(131, 'Municipio Chaguaramas', 12),
(132, 'Municipio El Socorro', 12),
(133, 'Municipio San Gerónimo de Guayabal', 12),
(134, 'Municipio Leonardo Infante', 12),
(135, 'Municipio Las Mercedes', 12),
(136, 'Municipio Julián Mellado', 12),
(137, 'Municipio Francisco de Miranda', 12),
(138, 'Municipio José Tadeo Monagas', 12),
(139, 'Municipio Ortiz', 12),
(140, 'Municipio José Félix Ribas', 12),
(141, 'Municipio Juan Germán Roscio', 12),
(142, 'Municipio San José de Guaribe', 12),
(143, 'Municipio Santa María de Ipire', 12),
(144, 'Municipio Pedro Zaraza', 12),
(145, 'Municipio Andrés Eloy Blanco', 13),
(146, 'Municipio Crespo', 13),
(147, 'Municipio Iribarren', 13),
(148, 'Municipio Jiménez', 13),
(149, 'Municipio Morán', 13),
(150, 'Municipio Palavecino', 13),
(151, 'Municipio Simón Planas', 13),
(152, 'Municipio Torres', 13),
(153, 'Municipio Urdaneta', 13),
(154, 'Municipio Alberto Adriani ', 14),
(155, 'Municipio Andrés Bello', 14),
(156, 'Municipio Antonio Pinto Salinas', 14),
(157, 'Municipio Aricagua ', 14),
(158, 'Municipio Arzobispo Chacón', 14),
(159, 'Municipio Campo Elías ', 14),
(160, 'Municipio Caracciolo Parra Olmedo ', 14),
(161, 'Municipio Cardenal Quintero ', 14),
(162, 'Municipio Guaraque ', 14),
(163, 'Municipio Julio César Salas ', 14),
(164, 'Municipio Justo Briceño', 14),
(165, 'Municipio Libertador ', 14),
(166, 'Municipio Miranda', 14),
(167, 'Municipio Obispo Ramos de Lora ', 14),
(168, 'Municipio Padre Noguera ', 14),
(169, 'Municipio Pueblo Llano ', 14),
(170, 'Municipio Rangel', 14),
(171, 'Municipio Rivas Dávila', 14),
(172, 'Municipio Santos Marquina ', 14),
(173, 'Municipio Sucre', 14),
(174, 'Municipio Tovar', 14),
(175, 'Municipio Tulio Febres Cordero ', 14),
(176, 'Municipio Zea', 14),
(177, 'Municipio Acevedo', 15),
(178, 'Municipio Andrés Bello', 15),
(179, 'Municipio Baruta', 15),
(180, 'Municipio Brión', 15),
(181, 'Municipio Buroz', 15),
(182, 'Municipio Carrizal ', 15),
(183, 'Municipio Chacao', 15),
(184, 'Municipio Cristóbal Rojas', 15),
(185, 'Municipio El Hatillo', 15),
(186, 'Municipio Guaicaipuro', 15),
(187, 'Municipio Independencia', 15),
(188, 'Municipio Lander', 15),
(189, 'Municipio Los Salias', 15),
(190, 'Municipio Páez', 15),
(191, 'Municipio Paz Castillo', 15),
(192, 'Municipio Pedro Gual', 15),
(193, 'Municipio Plaza', 15),
(194, 'Municipio Simón Bolívar', 15),
(195, 'Municipio Sucre', 15),
(196, 'Municipio Urdaneta', 15),
(197, 'Municipio Zamora', 15),
(198, 'Municipio Acosta', 16),
(199, 'Municipio Aguasay', 16),
(200, 'Municipio Bolívar', 16),
(201, 'Municipio Caripe', 16),
(202, 'Municipio Cedeño', 16),
(203, 'Municipio Ezequiel Zamora', 16),
(204, 'Municipio Libertador', 16),
(205, 'Municipio Maturín', 16),
(206, 'Municipio Piar', 16),
(207, 'Municipio Punceres', 16),
(208, 'Municipio Santa Bárbara', 16),
(209, 'Municipio Sotillo', 16),
(210, 'Municipio Uracoa', 16),
(211, 'Municipio Antolín del Campo', 17),
(212, 'Municipio Arismendi', 17),
(213, 'Municipio Díaz', 17),
(214, 'Municipio García', 17),
(215, 'Municipio Gómez', 17),
(216, 'Municipio Maneiro', 17),
(217, 'Municipio Marcano', 17),
(218, 'Municipio Mariño', 17),
(219, 'Municipio Península de Macanao', 17),
(220, 'Municipio Tubores', 17),
(221, 'Municipio Villalba', 17),
(222, 'Municipio Agua Blanca', 18),
(223, 'Municipio Araure', 18),
(224, 'Municipio Esteller', 18),
(225, 'Municipio Guanare', 18),
(226, 'Municipio Guanarito', 18),
(227, 'Municipio Monseñor José Vicente de Unda', 18),
(228, 'Municipio Ospino', 18),
(229, 'Municipio Páez', 18),
(230, 'Municipio Papelón', 18),
(231, 'Municipio San Genaro de Boconoito', 18),
(232, 'Municipio San Rafael de Onoto', 18),
(233, 'Municipio Santa Rosalía', 18),
(234, 'Municipio Sucre', 18),
(235, 'Municipio Turén', 18),
(236, 'Municipio Andrés Eloy Blanco', 19),
(237, 'Municipio Andrés Mata', 19),
(238, 'Municipio Arismendi', 19),
(239, 'Municipio Benítez', 19),
(240, 'Municipio Bermúdez', 19),
(241, 'Municipio Bolívar', 19),
(242, 'Municipio Cajigal', 19),
(243, 'Municipio Cruz Salmerón Acosta', 19),
(244, 'Municipio Libertador', 19),
(245, 'Municipio Mariño', 19),
(246, 'Municipio Mejía', 19),
(247, 'Municipio Montes', 19),
(248, 'Municipio Ribero', 19),
(249, 'Municipio Sucre', 19),
(250, 'Municipio Valdez', 19),
(251, 'Municipio Andrés Bello', 20),
(252, 'Municipio Antonio Rómulo Costa', 20),
(253, 'Municipio Ayacucho', 20),
(254, 'Municipio Bolívar', 20),
(255, 'Municipio Cárdenas', 20),
(256, 'Municipio Córdoba', 20),
(257, 'Municipio Fernández Feo', 20),
(258, 'Municipio Francisco de Miranda', 20),
(259, 'Municipio García de Hevia', 20),
(260, 'Municipio Guásimos', 20),
(261, 'Municipio Independencia', 20),
(262, 'Municipio Jáuregui', 20),
(263, 'Municipio José María Vargas', 20),
(264, 'Municipio Junín', 20),
(265, 'Municipio Libertad', 20),
(266, 'Municipio Libertador', 20),
(267, 'Municipio Lobatera', 20),
(268, 'Municipio Michelena', 20),
(269, 'Municipio Panamericano', 20),
(270, 'Municipio Pedro María Ureña', 20),
(271, 'Municipio Rafael Urdaneta', 20),
(272, 'Municipio Samuel Darío Maldonado', 20),
(273, 'Municipio San Cristóbal', 20),
(274, 'Municipio Seboruco', 20),
(275, 'Municipio Simón Rodríguez', 20),
(276, 'Municipio Sucre', 20),
(277, 'Municipio Torbes', 20),
(278, 'Municipio Uribante', 20),
(279, 'Municipio San Judas Tadeo', 20),
(280, 'Municipio Andrés Bello', 21),
(281, 'Municipio Boconó', 21),
(282, 'Municipio Bolívar', 21),
(283, 'Municipio Candelaria', 21),
(284, 'Municipio Carache', 21),
(285, 'Municipio Escuque', 21),
(286, 'Municipio José Felipe Márquez Cañizales', 21),
(287, 'Municipio Juan Vicente Campo Elías', 21),
(288, 'Municipio La Ceiba', 21),
(289, 'Municipio Miranda', 21),
(290, 'Municipio Monte Carmelo', 21),
(291, 'Municipio Motatán', 21),
(292, 'Municipio Pampán', 21),
(293, 'Municipio Pampanito', 21),
(294, 'Municipio Rafael Rangel', 21),
(295, 'Municipio San Rafael de Carvajal', 21),
(296, 'Municipio Sucre', 21),
(297, 'Municipio Trujillo', 21),
(298, 'Municipio Urdaneta', 21),
(299, 'Municipio Valera', 21),
(300, 'Municipio Arístides Bastidas', 22),
(301, 'Municipio Bolívar', 22),
(302, 'Municipio Bruzual', 22),
(303, 'Municipio Cocorote', 22),
(304, 'Municipio Independencia', 22),
(305, 'Municipio José Antonio Páez', 22),
(306, 'Municipio La Trinidad', 22),
(307, 'Municipio Manuel Monge', 22),
(308, 'Municipio Nirgua', 22),
(309, 'Municipio Peña', 22),
(310, 'Municipio San Felipe', 22),
(311, 'Municipio Sucre', 22),
(312, 'Municipio Urachiche', 22),
(313, 'Municipio Veroes', 22),
(314, 'Municipio Almirante Padilla', 23),
(315, 'Municipio Baralt', 23),
(316, 'Municipio Cabimas', 23),
(317, 'Municipio Catatumbo', 23),
(318, 'Municipio Colón', 23),
(319, 'Municipio Francisco Javier Pulgar', 23),
(320, 'Municipio Jesús Enrique Lossada', 23),
(321, 'Municipio Jesús María Semprúm', 23),
(322, 'Municipio La Cañada de Urdaneta', 23),
(323, 'Municipio Lagunillas', 23),
(324, 'Municipio Machiques de Perijá', 23),
(325, 'Municipio Mara', 23),
(326, 'Municipio Maracaibo', 23),
(327, 'Municipio Miranda', 23),
(328, 'Municipio Páez', 23),
(329, 'Municipio Rosario de Perijá', 23),
(330, 'Municipio San Francisco', 23),
(331, 'Municipio Santa Rita', 23),
(332, 'Municipio Simón Bolívar', 23),
(333, 'Municipio Sucre', 23),
(334, 'Municipio Valmore Rodríguez', 23),
(335, 'Municipio Vargas', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_parroquia`
--

CREATE TABLE `c_parroquia` (
  `id` int(11) NOT NULL,
  `Parroquia` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `idMunicipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ingresar Parroquia';

--
-- Volcado de datos para la tabla `c_parroquia`
--

INSERT INTO `c_parroquia` (`id`, `Parroquia`, `idMunicipio`) VALUES
(1, 'Parroquia Altagracia', 1),
(2, 'Parroquia Antímano', 1),
(3, 'Parroquia Candelaria', 1),
(4, 'Parroquia Caricuao', 1),
(5, 'Parroquia Catedral', 1),
(6, 'Parroquia Coche', 1),
(7, 'Parroquia El Junquito', 1),
(8, 'Parroquia El Paraíso', 1),
(9, 'Parroquia El Recreo', 1),
(10, 'Parroquia El Valle', 1),
(11, 'Parroquia La Pastora', 1),
(12, 'Parroquia La Vega', 1),
(13, 'Parroquia Macarao', 1),
(14, 'Parroquia San Agustín', 1),
(15, 'Parroquia San Bernardino', 1),
(16, 'Parroquia San José', 1),
(17, 'Parroquia San Juan', 1),
(18, 'Parroquia San Pedro', 1),
(19, 'Parroquia Santa Rosalía', 1),
(20, 'Parroquia Santa Teresa', 1),
(21, 'Parroquia Sucre', 1),
(22, 'Parroquia 23 de Enero', 1),
(23, 'Parroquia Capital Alto Orinoco', 2),
(24, 'Parroquia Huachamacare', 2),
(25, 'Parroquia Marawaka', 2),
(26, 'Parroquia Mavaca', 2),
(27, 'Parroquia Sierra Parima', 2),
(28, 'Parroquia Ucata', 3),
(29, 'Parroquia Yapacana', 3),
(30, 'Parroquia Caname', 3),
(31, 'Parroquia Fernando Girón Tovar', 4),
(32, 'Parroquia Luis Alberto Gómez', 4),
(33, 'Parroquia Parhueña', 4),
(34, 'Parroquia Platanillal', 4),
(35, 'Parroquia Samariapo', 5),
(36, 'Parroquia Sipapo', 5),
(37, 'Parroquia Munduapo', 5),
(38, 'Parroquia Guayapo', 5),
(39, 'Parroquia Victorino', 6),
(40, 'Parroquia Comunidad', 6),
(41, 'Parroquia Alto Ventuari', 7),
(42, 'Parroquia Medio Ventuari', 7),
(43, 'Parroquia Bajo Ventuari', 7),
(44, 'Parroquia Capital Río Negro', 8),
(45, 'Parroquia Solano', 8),
(46, 'Parroquia Casiquiare', 8),
(47, 'Parroquia Cocuy', 8),
(48, 'Parroquia Capital Anaco ', 9),
(49, 'Parroquia San Joaquín', 9),
(50, 'Parroquia Capital Aragua', 10),
(51, 'Parroquia Cachipo', 10),
(52, 'Parroquia Capital Fernando de Peñalver', 11),
(53, 'Parroquia San Miguel', 11),
(54, 'Parroquia Sucre', 11),
(55, 'Parroquia Valle de Guanape', 12),
(56, 'Parroquia Santa Bárbara', 12),
(57, 'Parroquia Capital Francisco de Miranda', 13),
(58, 'Parroquia Atapirire', 13),
(59, 'Parroquia Boca del Pao', 13),
(60, 'Parroquia El Pao', 13),
(61, 'Parroquia Múcura', 13),
(62, 'Parroquia Guanta', 14),
(63, 'Parroquia Chorrerón', 14),
(64, 'Parroquia Capital Independencia', 15),
(65, 'Parroquia Mamo', 15),
(66, 'Parroquia Capital Puerto La Cruz', 16),
(67, 'Parroquia Pozuelos', 16),
(68, 'Parroquia Capital Onoto', 17),
(69, 'Parroquia San Pablo', 17),
(70, 'Parroquia Capital José Gregorio Monagas', 18),
(71, 'Parroquia Piar', 18),
(72, 'Parroquia San Diego de Cabrutica', 18),
(73, 'Parroquia Santa Clara', 18),
(74, 'Parroquia Uverito', 18),
(75, 'Parroquia Zuata', 18),
(76, 'Parroquia Capital Libertad', 19),
(77, 'Parroquia El Carito', 19),
(78, 'Parroquia Santa Inés', 19),
(79, 'Parroquia Capital Clarines', 20),
(80, 'Parroquia Guanape', 20),
(81, 'Parroquia Sabana de Uchire', 20),
(82, 'Parroquia Capital Pedro María Freites', 21),
(83, 'Parroquia Libertador', 21),
(84, 'Parroquia Santa Rosa', 21),
(85, 'Parroquia Urica', 21),
(86, 'Parroquia Capital Píritu', 22),
(87, 'Parroquia San Francisco', 22),
(88, 'Parroquia Capital San José de Guanipa', 23),
(89, 'Parroquia Capital Boca de Uchire', 24),
(90, 'Parroquia Boca de Chávez', 24),
(91, 'Parroquia Capital Santa Ana', 25),
(92, 'Parroquia Pueblo Nuevo', 25),
(93, 'Parroquia El Carmen', 26),
(94, 'Parroquia San Cristóbal', 26),
(95, 'Parroquia Bergantín', 26),
(96, 'Parroquia Caigua', 26),
(97, 'Parroquia El Pilar', 26),
(98, 'Parroquia Naricual', 26),
(99, 'Parroquia Edmundo Barrios', 27),
(100, 'Parroquia Miguel Otero Silva ', 27),
(101, 'Parroquia El Chaparro', 28),
(102, 'Parroquia Tomás Alfaro Calatrava', 28),
(103, 'Parroquia Lecherías', 29),
(104, 'Parroquia El Morro', 29),
(105, 'Parroquia Urbana Achaguas', 30),
(106, 'Parroquia Apurito', 30),
(107, 'Parroquia El Yagual', 30),
(108, 'Parroquia Guachara', 30),
(109, 'Parroquia Mucuritas', 30),
(110, 'Parroquia Queseras del Medio', 30),
(111, 'Parroquia Urbana Biruaca', 31),
(112, 'Parroquia Urbana Bruzual', 32),
(113, 'Parroquia Mantecal', 32),
(114, 'Parroquia Quintero', 32),
(115, 'Parroquia Rincón Hondo', 32),
(116, 'Parroquia San Vicente', 32),
(117, 'Parroquia Urbana Guasdualito', 33),
(118, 'Parroquia Aramendi', 33),
(119, 'Parroquia El Amparo', 33),
(120, 'Parroquia San Camilo', 33),
(121, 'Parroquia Urdaneta', 33),
(122, 'Parroquia Urbana San Juan de Payara', 34),
(123, 'Parroquia Codazzi', 34),
(124, 'Parroquia Cunaviche', 34),
(125, 'Parroquia Urbana Elorza', 35),
(126, 'Parroquia La Trinidad', 35),
(127, 'Parroquia Urbana San Fernando', 36),
(128, 'Parroquia El Recreo', 36),
(129, 'Parroquia Peñalver', 36),
(130, 'Parroquia San Rafael de Atamaica', 36),
(131, 'Parroquia Capital Bolívar', 37),
(132, 'Parroquia Capital Camatagua', 38),
(133, 'Parroquia No Urbana Carmen de Cura', 38),
(134, 'Parroquia No Urbana Choroní ', 39),
(135, 'Parroquia Urbana Las Delicias', 39),
(136, 'Parroquia Urbana Madre María de San José', 39),
(137, 'Parroquia Urbana Joaquín Crespo', 39),
(138, 'Parroquia Urbana Pedro José Ovalles', 39),
(139, 'Parroquia Urbana José Casanova Godoy', 39),
(140, 'Parroquia Urbana Andrés Eloy Blanco', 39),
(141, 'Parroquia Urbana Los Tacariguas', 39),
(142, 'Parroquia Capital José Angel Lamas', 40),
(143, 'Parroquia Capital José Félix Ribas', 41),
(144, 'Parroquia Castor Nieves Ríos', 41),
(145, 'Parroquia No Urbana Las Guacamayas', 41),
(146, 'Parroquia No Urbana Pao de Zárate', 41),
(147, 'Parroquia No Urbana Zuata', 41),
(148, 'Parroquia Capital José Rafael Revenga', 42),
(149, 'Parroquia Capital Libertador', 43),
(150, 'Parroquia No Urbana San Martín de Porres', 43),
(151, 'Parroquia Capital Mario Briceño Iragorry', 44),
(152, 'Parroquia Caña de Azúcar', 44),
(153, 'Parroquia Capital San Casimiro', 45),
(154, 'Parroquia No Urbana Güiripa', 45),
(155, 'Parroquia No Urbana Ollas de Caramacate', 45),
(156, 'Parroquia No Urbana Valle Morín', 45),
(157, 'Parroquia Capital San Sebastian', 46),
(158, 'Parroquia Capital Santiago Mariño', 47),
(159, 'Parroquia No Urbana Arévalo Aponte', 47),
(160, 'Parroquia No Urbana Chuao', 47),
(161, 'Parroquia No Urbana Samán de Güere', 47),
(162, 'Parroquia No Urbana Alfredo Pacheco Miranda', 47),
(163, 'Parroquia Capital Santos Michelena', 48),
(164, 'Parroquia No Urbana Tiara', 48),
(165, 'Parroquia Capital Sucre', 49),
(166, 'Parroquia No Urbana Bella Vista', 49),
(167, 'Parroquia Capital Tovar', 50),
(168, 'Parroquia Capital Urdaneta', 51),
(169, 'Parroquia No Urbana Las Peñitas', 51),
(170, 'Parroquia No Urbana San Francisco de Cara', 51),
(171, 'Parroquia No Urbana Taguay', 51),
(172, 'Parroquia Capital Zamora', 52),
(173, 'Parroquia No Urbana Magdaleno', 52),
(174, 'Parroquia No Urbana San Francisco de Asís', 52),
(175, 'Parroquia No Urbana Valles de Tucutunemo', 52),
(176, 'Parroquia No Urbana Augusto Mijares', 52),
(177, 'Parroquia Capital Francisco Linares Alcántara', 53),
(178, 'Parroquia No Urbana Francisco de Miranda', 53),
(179, 'Parroquia No Urbana Monseñor Feliciano González', 53),
(180, 'Parroquia Capital Ocumare de la Costa de Oro', 54),
(181, 'Parroquia Sabaneta', 55),
(182, 'Parroquia Rodríguez Domínguez', 55),
(183, 'Parroquia Ticoporo', 56),
(184, 'Parroquia Andrés Bello', 56),
(185, 'Parroquia Nicolás Pulido', 56),
(186, 'Parroquia Arismendi', 57),
(187, 'Parroquia Guadarrama', 57),
(188, 'Parroquia La Unión', 57),
(189, 'Parroquia San Antonio', 57),
(190, 'Parroquia Barinas', 58),
(191, 'Parroquia Alfredo Arvelo Larriva', 58),
(192, 'Parroquia San Silvestre', 58),
(193, 'Parroquia Santa Inés', 58),
(194, 'Parroquia Santa Lucía', 58),
(195, 'Parroquia Torunos', 58),
(196, 'Parroquia El Carmen', 58),
(197, 'Parroquia Rómulo Betancourt', 58),
(198, 'Parroquia Corazón de Jesús', 58),
(199, 'Parroquia Ramón Ignacio Méndez', 58),
(200, 'Parroquia Alto Barinas', 58),
(201, 'Parroquia Manuel Palacio Fajardo', 58),
(202, 'Parroquia Juan Antonio Rodríguez Domínguez', 58),
(203, 'Parroquia Dominga Ortiz de Páez', 58),
(204, 'Parroquia Barinitas', 59),
(205, 'Parroquia Altamira', 59),
(206, 'Parroquia Calderas', 59),
(207, 'Parroquia Barrancas', 60),
(208, 'Parroquia El Socorro', 60),
(209, 'Parroquia Masparrito', 60),
(210, 'Parroquia Santa Bárbara', 61),
(211, 'Parroquia José Ignacio Del Pumar', 61),
(212, 'Parroquia Pedro Briceño Méndez', 61),
(213, 'Parroquia Ramón Ignacio Méndez', 61),
(214, 'Parroquia Obispos', 62),
(215, 'Parroquia El Real', 62),
(216, 'Parroquia La Luz', 62),
(217, 'Parroquia Los Guasimitos', 62),
(218, 'Parroquia Ciudad Bolivia', 63),
(219, 'Parroquia Ignacio Briceño', 63),
(220, 'Parroquia José Félix Ribas', 63),
(221, 'Parroquia Libertad', 64),
(222, 'Parroquia Dolores', 64),
(223, 'Parroquia Palacios Fajardo', 64),
(224, 'Parroquia Santa Rosa', 64),
(225, 'Parroquia Ciudad de Nutrias', 65),
(226, 'Parroquia El Regalo', 65),
(227, 'Parroquia Puerto de Nutrias', 65),
(228, 'Parroquia Santa Catalina', 65),
(229, 'Parroquia El Cantón', 66),
(230, 'Parroquia Santa Cruz de Guacas', 66),
(231, 'Parroquia Puerto Vivas', 66),
(232, 'Parroquia Cachamay', 67),
(233, 'Parroquia Chirica', 67),
(234, 'Parroquia Dalla Costa', 67),
(235, 'Parroquia Once de Abril', 67),
(236, 'Parroquia Simón Bolívar', 67),
(237, 'Parroquia Unare', 67),
(238, 'Parroquia Universidad', 67),
(239, 'Parroquia Vista al Sol', 67),
(240, 'Parroquia Pozo Verde', 67),
(241, 'Parroquia Yocoima', 67),
(242, 'Sección Capital Cedeño', 68),
(243, 'Parroquia Altagracia', 68),
(244, 'Parroquia Ascensión Farreras', 68),
(245, 'Parroquia Guaniamo', 68),
(246, 'Parroquia La Urbana', 68),
(247, 'Parroquia Pijiguaos', 68),
(248, 'Parroquia Capital El Callao', 69),
(249, 'Sección Capital Gran Sabana', 70),
(250, 'Parroquia Ikabarú', 70),
(251, 'Parroquia Agua Salada', 71),
(252, 'Parroquia Catedral', 71),
(253, 'Parroquia José Antonio Páez', 71),
(254, 'Parroquia La Sabanita', 71),
(255, 'Parroquia Marhuanta', 71),
(256, 'Parroquia Vista Hermosa', 71),
(257, 'Parroquia Orinoco', 71),
(258, 'Parroquia Panapana', 71),
(259, 'Parroquia Zea', 71),
(260, 'Sección Capital Piar', 72),
(261, 'Parroquia Andrés Eloy Blanco', 72),
(262, 'Parroquia Pedro Cova', 72),
(263, 'Sección Capital Raúl Leoni', 73),
(264, 'Parroquia Barceloneta', 73),
(265, 'Parroquia San Francisco', 73),
(266, 'Parroquia Santa Bárbara', 73),
(267, 'Sección Capital Roscio', 74),
(268, 'Parroquia Salom', 74),
(269, 'Sección Capital Sifontes', 75),
(270, 'Parroquia Dalla Costa', 75),
(271, 'Parroquia San Isidro', 75),
(272, 'Sección Capital Sucre', 76),
(273, 'Parroquia Aripao', 76),
(274, 'Parroquia Guarataro', 76),
(275, 'Parroquia Las Majadas', 76),
(276, 'Parroquia Moitaco', 76),
(277, 'Parroquia Capital Padre Pedro Chien', 77),
(278, 'Parroquia Urbana Bejuma', 78),
(279, 'Parroquia No Urbana Canoabo', 78),
(280, 'Parroquia No Urbana Simón Bolívar', 78),
(281, 'Parroquia Urbana Güigüe', 79),
(282, 'Parroquia No Urbana Belén', 79),
(283, 'Parroquia No Urbana Tacarigua', 79),
(284, 'Parroquia Urbana Aguas Calientes', 80),
(285, 'Parroquia Urbana Mariara', 80),
(286, 'Parroquia Urbana Ciudad Alianza', 81),
(287, 'Parroquia Urbana Guacara', 81),
(288, 'Parroquia No Urbana Yagua', 81),
(289, 'Parroquia Urbana Morón', 82),
(290, 'Parroquia No Urbana Urama', 82),
(291, 'Parroquia Urbana Tocuyito', 83),
(292, 'Parroquia Urbana Independencia', 83),
(293, 'Parroquia Urbana Los Guayos', 84),
(294, 'Parroquia Urbana Miranda', 85),
(295, 'Parroquia Urbana Montalbán', 86),
(296, 'Parroquia Urbana Naguanagua', 87),
(297, 'Parroquia Urbana Bartolomé Salom', 88),
(298, 'Parroquia Urbana Democracia', 88),
(299, 'Parroquia Urbana Fraternidad', 88),
(300, 'Parroquia Urbana Goaigoaza', 88),
(301, 'Parroquia Urbana Juan José Flores', 88),
(302, 'Parroquia Urbana Unión', 88),
(303, 'Parroquia No Urbana Borburata', 88),
(304, 'Parroquia No Urbana Patanemo', 88),
(305, 'Parroquia Urbana San Diego', 89),
(306, 'Parroquia Urbana San Joaquín', 90),
(307, 'Parroquia Urbana Candelaria', 91),
(308, 'Parroquia Urbana Catedral', 91),
(309, 'Parroquia Urbana El Socorro', 91),
(310, 'Parroquia Urbana Miguel Peña', 91),
(311, 'Parroquia Urbana Rafael Urdaneta', 91),
(312, 'Parroquia Urbana San Blas', 91),
(313, 'Parroquia Urbana San José', 91),
(314, 'Parroquia Urbana Santa Rosa', 91),
(315, 'Parroquia No Urbana Negro Primero', 91),
(316, 'Parroquia Cojedes', 92),
(317, 'Parroquia Juan de Mata Suárez', 92),
(318, 'Parroquia Tinaquillo', 93),
(319, 'Parroquia El Baúl', 94),
(320, 'Parroquia Sucre', 94),
(321, 'Parroquia Macapo', 95),
(322, 'Parroquia La Aguadita', 95),
(323, 'Parroquia El Pao', 96),
(324, 'Parroquia Libertad de Cojedes', 97),
(325, 'Parroquia El Amparo', 97),
(326, 'Parroquia Rómulo Gallegos', 98),
(327, 'Parroquia San Carlos de Austria', 99),
(328, 'Parroquia Juan Angel Bravo', 99),
(329, 'Parroquia Manuel Manrique', 99),
(330, 'Parroquia General en Jefe José Laurencio Silva', 100),
(331, 'Parroquia Curiapo', 101),
(332, 'Parroquia Almirante Luis Brión', 101),
(333, 'Parroquia Francisco Aniceto Lugo', 101),
(334, 'Parroquia Manuel Renaud', 101),
(335, 'Parroquia Padre Barral', 101),
(336, 'Parroquia Santos de Abelgas', 101),
(337, 'Parroquia Imataca', 102),
(338, 'Parroquia Cinco de Julio', 102),
(339, 'Parroquia Juan Bautista Arismendi', 102),
(340, 'Parroquia Manuel Piar', 102),
(341, 'Parroquia Rómulo Gallegos', 102),
(342, 'Parroquia Pedernales', 103),
(343, 'Parroquia Luis Beltrán Prieto Figueroa', 103),
(344, 'Parroquia San José', 104),
(345, 'Parroquia José Vidal Marcano', 104),
(346, 'Parroquia Juan Millán', 104),
(347, 'Parroquia Leonardo Ruíz Pineda', 104),
(348, 'Parroquia Mariscal Antonio José de Sucre', 104),
(349, 'Parroquia Monseñor Argimiro García', 104),
(350, 'Parroquia San Rafael', 104),
(351, 'Parroquia Virgen del Valle', 104),
(352, 'Parroquia San Juan de los Cayos', 105),
(353, 'Parroquia Capadare', 105),
(354, 'Parroquia La Pastora', 105),
(355, 'Parroquia Libertador', 105),
(356, 'Parroquia San Luis', 106),
(357, 'Parroquia Aracua', 106),
(358, 'Parroquia La Peña', 106),
(359, 'Parroquia Capatárida', 107),
(360, 'Parroquia Bariro', 107),
(361, 'Parroquia Borojó', 107),
(362, 'Parroquia Guajiro', 107),
(363, 'Parroquia Seque', 107),
(364, 'Parroquia Zazárida', 107),
(365, 'Parroquia Capital Cacique Manaure', 108),
(366, 'Parroquia Carirubana', 109),
(367, 'Parroquia Norte', 109),
(368, 'Parroquia Punta Cardón', 109),
(369, 'Parroquia Santa Ana', 109),
(370, 'Parroquia La Vela de Coro', 110),
(371, 'Parroquia Acurigua', 110),
(372, 'Parroquia Guaibacoa', 110),
(373, 'Parroquia Las Calderas', 110),
(374, 'Parroquia Macoruca', 110),
(375, 'Parroquia Capital Dabarujo', 111),
(376, 'Parroquia Pedregal', 112),
(377, 'Parroquia Agua Clara', 112),
(378, 'Parroquia Avaria', 112),
(379, 'Parroquia Piedra Grande', 112),
(380, 'Parroquia Purureche', 112),
(381, 'Parroquia Pueblo Nuevo', 113),
(382, 'Parroquia Adícora', 113),
(383, 'Parroquia Baraived', 113),
(384, 'Parroquia Buena Vista', 113),
(385, 'Parroquia Jadacaquiva', 113),
(386, 'Parroquia Moruy', 113),
(387, 'Parroquia Adaure', 113),
(388, 'Parroquia El Hato', 113),
(389, 'Parroquia El Vínculo', 113),
(390, 'Parroquia Churuguara', 114),
(391, 'Parroquia Agua Larga', 114),
(392, 'Parroquia El Paují', 114),
(393, 'Parroquia Independencia', 114),
(394, 'Parroquia Mapararí', 114),
(395, 'Parroquia Jacura', 115),
(396, 'Parroquia Agua Linda', 115),
(397, 'Parroquia Araurima', 115),
(398, 'Parroquia Los Taques', 116),
(399, 'Parroquia Judibana', 116),
(400, 'Parroquia Mene de Mauroa', 117),
(401, 'Parroquia Casigua', 117),
(402, 'Parroquia San Félix', 117),
(403, 'Parroquia San Antonio', 118),
(404, 'Parroquia San Gabriel', 118),
(405, 'Parroquia Santa Ana', 118),
(406, 'Parroquia Guzmán Guillermo', 118),
(407, 'Parroquia Mitare', 118),
(408, 'Parroquia Río Seco', 118),
(409, 'Parroquia Sabaneta', 118),
(410, 'Parroquia Chichiriviche', 119),
(411, 'Parroquia Boca de Tocuyo', 119),
(412, 'Parroquia Tocuyo de la Costa', 119),
(413, 'Parroquia Capital Palmasola', 120),
(414, 'Parroquia Cabure', 121),
(415, 'Parroquia Colina', 121),
(416, 'Parroquia Curimagua', 121),
(417, 'Parroquia Píritu', 122),
(418, 'Parroquia San José de la Costa', 122),
(419, 'Parroquia Capital San Francisco', 123),
(420, 'Parroquia Tucacas', 124),
(421, 'Parroquia Boca de Aroa', 124),
(422, 'Parroquia Sucre', 125),
(423, 'Parroquia Pecaya', 125),
(424, 'Parroquia Capital Tocópero ', 126),
(425, 'Parroquia Santa Cruz de Bucaral', 127),
(426, 'Parroquia El Charal', 127),
(427, 'Parroquia Las Vegas del Tuy', 127),
(428, 'Parroquia Urumaco', 128),
(429, 'Parroquia Bruzual', 128),
(430, 'Parroquia Puerto Cumarebo', 129),
(431, 'Parroquia La Ciénaga', 129),
(432, 'Parroquia La Soledad', 129),
(433, 'Parroquia Pueblo Cumarebo', 129),
(434, 'Parroquia Zazárida', 129),
(435, 'Parroquia Capital Camaguán', 130),
(436, 'Parroquia Puerto Miranda', 130),
(437, 'Parroquia Uverito', 130),
(438, 'Parroquia Chaguaramas', 131),
(439, 'Parroquia El Socorro', 132),
(440, 'Parroquia Capital San Gerónimo de Guayabal', 133),
(441, 'Parroquia Cazorla', 133),
(442, 'Parroquia Capital Valle de La Pascua', 134),
(443, 'Parroquia Espino', 134),
(444, 'Parroquia Capital Las Mercedes', 135),
(445, 'Parroquia Cabruta', 135),
(446, 'Parroquia Santa Rita de Manapire', 135),
(447, 'Parroquia Capital El Sombrero', 136),
(448, 'Parroquia Sosa', 136),
(449, 'Parroquia Capital Calabozo', 137),
(450, 'Parroquia El Calvario', 137),
(451, 'Parroquia El Rastro', 137),
(452, 'Parroquia Guardatinajas', 137),
(453, 'Parroquia Capital Altagracia de Orituco', 138),
(454, 'Parroquia Lezama', 138),
(455, 'Parroquia Libertad de Orituco', 138),
(456, 'Parroquia Paso Real de Macaira', 138),
(457, 'Parroquia San Francisco de Macaira', 138),
(458, 'Parroquia San Rafael de Orituco', 138),
(459, 'Parroquia Soublette', 138),
(460, 'Parroquia Capital Ortiz', 139),
(461, 'Parroquia San Francisco de Tiznados', 139),
(462, 'Parroquia San José de Tiznados', 139),
(463, 'Parroquia San Lorenzo de Tiznados', 139),
(464, 'Parroquia Capital Tucupido', 140),
(465, 'Parroquia San Rafael de Laya', 140),
(466, 'Parroquia Capital San Juan de Los Morros', 141),
(467, 'Parroquia Cantagallo', 141),
(468, 'Parroquia Parapara', 141),
(469, 'Parroquia San José de Guaribe', 142),
(470, 'Parroquia Capital Santa María de Ipire', 143),
(471, 'Parroquia Altamira', 143),
(472, 'Parroquia Capital Zaraza', 144),
(473, 'Parroquia San José de Unare', 144),
(474, 'Parroquia Pío Tamayo', 145),
(475, 'Parroquia Quebrada Honda de Guache', 145),
(476, 'Parroquia Yacambú', 145),
(477, 'Parroquia Fréitez', 146),
(478, 'Parroquia José María Blanco', 146),
(479, 'Parroquia Catedral', 147),
(480, 'Parroquia Concepción', 147),
(481, 'Parroquia El Cují', 147),
(482, 'Parroquia Juan de Villegas', 147),
(483, 'Parroquia Santa Rosa', 147),
(484, 'Parroquia Tamaca', 147),
(485, 'Parroquia Unión', 147),
(486, 'Parroquia Aguedo Felipe Alvarado', 147),
(487, 'Parroquia Buena Vista', 147),
(488, 'Parroquia Juárez', 147),
(489, 'Parroquia Juan Bautista Rodríguez', 148),
(490, 'Parroquia Cuara', 148),
(491, 'Parroquia Diego de Lozada', 148),
(492, 'Parroquia Paraíso de San José', 148),
(493, 'Parroquia San Miguel', 148),
(494, 'Parroquia Tintorero', 148),
(495, 'Parroquia José Bernardo Dorante', 148),
(496, 'Parroquia Coronel Mariano Peraza', 148),
(497, 'Parroquia Bolívar', 149),
(498, 'Parroquia Anzoátegui', 149),
(499, 'Parroquia Guarico', 149),
(500, 'Parroquia Hilario Luna y Luna', 149),
(501, 'Parroquia Humocaro Alto', 149),
(502, 'Parroquia Humocaro Bajo', 149),
(503, 'Parroquia La Candelaria', 149),
(504, 'Parroquia Morán', 149),
(505, 'Parroquia Cabudare', 150),
(506, 'Parroquia José Gregorio Bastidas', 150),
(507, 'Parroquia Agua Viva', 150),
(508, 'Parroquia Sarare', 151),
(509, 'Parroquia Buría', 151),
(510, 'Parroquia Gustavo Vegas León', 151),
(511, 'Parroquia Trinidad Samuel', 152),
(512, 'Parroquia Antonio Díaz', 152),
(513, 'Parroquia Camacaro', 152),
(514, 'Parroquia Castañeda', 152),
(515, 'Parroquia Cecilio Zubillaga', 152),
(516, 'Parroquia Chiquinquirá', 152),
(517, 'Parroquia El Blanco', 152),
(518, 'Parroquia Espinoza de los Monteros', 152),
(519, 'Parroquia Lara', 152),
(520, 'Parroquia Las Mercedes', 152),
(521, 'Parroquia Manuel Morillo', 152),
(522, 'Parroquia Montaña Verde', 152),
(523, 'Parroquia Montes de Oca', 152),
(524, 'Parroquia Torres', 152),
(525, 'Parroquia Heriberto Arroyo', 152),
(526, 'Parroquia Reyes Vargas', 152),
(527, 'Parroquia Altagracia', 152),
(528, 'Parroquia Siquisique', 153),
(529, 'Parroquia Moroturo', 153),
(530, 'Parroquia San Miguel', 153),
(531, 'Parroquia Xaguas', 153),
(532, 'Parroquia Presidente Betancourt ', 154),
(533, 'Parroquia Presidente Páez  ', 154),
(534, 'Parroquia Presidente Rómulo Gallegos ', 154),
(535, 'Parroquia Gabriel Picón González', 154),
(536, 'Parroquia Héctor Amable Mora', 154),
(537, 'Parroquia José Nucete Sardi ', 154),
(538, 'Parroquia Pulido Méndez ', 154),
(539, 'Parroquia Capital Andrés Bello', 155),
(540, 'Parroquia Capital Antonio Pinto Salinas ', 156),
(541, 'Parroquia Mesa Bolívar', 156),
(542, 'Parroquia Mesa de Las Palmas', 156),
(543, 'Parroquia Capital Aricagua ', 157),
(544, 'Parroquia San Antonio ', 157),
(545, 'Parroquia Capital Arzobispo Chacón', 158),
(546, 'Parroquia Capurí ', 158),
(547, 'Parroquia Chacantá ', 158),
(548, 'Parroquia El Molino ', 158),
(549, 'Parroquia Guaimaral ', 158),
(550, 'Parroquia Mucutuy', 158),
(551, 'Parroquia Mucuchachí', 158),
(552, 'Parroquia Fernández Peña ', 159),
(553, 'Parroquia Matriz', 159),
(554, 'Parroquia Montalbán', 159),
(555, 'Parroquia Acequias', 159),
(556, 'Parroquia Jají', 159),
(557, 'Parroquia La Mesa', 159),
(558, 'Parroquia San José del Sur', 159),
(559, 'Parroquia Capital Caracciolo Parra Olmedo ', 160),
(560, 'Parroquia Florencio Ramírez ', 160),
(561, 'Parroquia Capital Cardenal Quintero ', 161),
(562, 'Parroquia Las Piedras', 161),
(563, 'Parroquia Capital Guaraque ', 162),
(564, 'Parroquia Mesa de Quintero ', 162),
(565, 'Parroquia Río Negro ', 162),
(566, 'Parroquia Capital Julio César Salas ', 163),
(567, 'Parroquia Palmira ', 163),
(568, 'Parroquia Capital Justo Briceño ', 164),
(569, 'Parroquia San Cristóbal de Torondoy', 164),
(570, 'Parroquia Antonio Spinetti Dini ', 165),
(571, 'Parroquia Arias', 165),
(572, 'Parroquia Caracciolo Parra Pérez ', 165),
(573, 'Parroquia Domingo Peña ', 165),
(574, 'Parroquia El Llano', 165),
(575, 'Parroquia Gonzalo Picón Febres ', 165),
(576, 'Parroquia Jacinto Plaza ', 165),
(577, 'Parroquia Juan Rodríguez Suárez', 165),
(578, 'Parroquia Lasso de la Vega ', 165),
(579, 'Parroquia Mariano Picón Salas ', 165),
(580, 'Parroquia Milla', 165),
(581, 'Parroquia Osuna Rodríguez ', 165),
(582, 'Parroquia Sagrario', 165),
(583, 'Parroquia El Morro', 165),
(584, 'Parroquia Los Nevados', 165),
(585, 'Parroquia Capital Miranda ', 166),
(586, 'Parroquia Andrés Eloy Blanco', 166),
(587, 'Parroquia La Venta', 166),
(588, 'Parroquia Piñango ', 166),
(589, 'Parroquia Capital Obispo Ramos de Lora ', 167),
(590, 'Parroquia Eloy Paredes', 167),
(591, 'Parroquia San Rafael de Alcázar', 167),
(592, 'Parroquia Capital Padre Noguera', 168),
(593, 'Parroquia Capital Pueblo Llano', 169),
(594, 'Parroquia Capital Rangel ', 170),
(595, 'Parroquia Cacute ', 170),
(596, 'Parroquia La Toma', 170),
(597, 'Parroquia Mucurubá', 170),
(598, 'Parroquia San Rafael', 170),
(599, 'Parroquia Capital Rivas Dávila ', 171),
(600, 'Parroquia Gerónimo Maldonado', 171),
(601, 'Parroquia Capital Santos Marquina ', 172),
(602, 'Parroquia Capital Sucre ', 173),
(603, 'Parroquia Chiguará', 173),
(604, 'Parroquia Estánquez', 173),
(605, 'Parroquia La Trampa', 173),
(606, 'Parroquia Pueblo Nuevo del Sur ', 173),
(607, 'Parroquia San Juan', 173),
(608, 'Parroquia El Amparo', 174),
(609, 'Parroquia El Llano', 174),
(610, 'Parroquia San Francisco', 174),
(611, 'Parroquia Tovar', 174),
(612, 'Parroquia Capital Tulio Febres Cordero ', 175),
(613, 'Parroquia Independencia', 175),
(614, 'Parroquia María de la Concepción Palacios Blanco', 175),
(615, 'Parroquia Santa Apolonia', 175),
(616, 'Parroquia Capital Zea ', 176),
(617, 'Parroquia Caño El Tigre', 176),
(618, 'Parroquia Caucagua', 177),
(619, 'Parroquia Aragüita', 177),
(620, 'Parroquia Arévalo González', 177),
(621, 'Parroquia Capaya', 177),
(622, 'Parroquia El Café', 177),
(623, 'Parroquia Marizapa', 177),
(624, 'Parroquia Panaquire', 177),
(625, 'Parroquia Ribas', 177),
(626, 'Parroquia San José de Barlovento', 178),
(627, 'Parroquia Cumbo', 178),
(628, 'Parroquia Baruta', 179),
(629, 'Parroquia El Cafetal', 179),
(630, 'Parroquia Las Minas de Baruta', 179),
(631, 'Parroquia Higuerote', 180),
(632, 'Parroquia Curiepe', 180),
(633, 'Parroquia Tacarigua', 180),
(634, 'Parroquia Mamporal', 181),
(635, 'Parroquia Carrizal', 182),
(636, 'Parroquia Chacao', 183),
(637, 'Parroquia Charallave', 184),
(638, 'Parroquia Las Brisas', 184),
(639, 'Parroquia El Hatillo', 185),
(640, 'Parroquia Los Teques', 186),
(641, 'Parroquia Altagracia de La Montaña', 186),
(642, 'Parroquia Cecilio Acosta', 186),
(643, 'Parroquia El Jarillo', 186),
(644, 'Parroquia Paracotos', 186),
(645, 'Parroquia San Pedro', 186),
(646, 'Parroquia Tácata', 186),
(647, 'Parroquia Santa Teresa del Tuy', 187),
(648, 'Parroquia El Cartanal', 187),
(649, 'Parroquia Ocumare del Tuy', 188),
(650, 'Parroquia La Democracia', 188),
(651, 'Parroquia Santa Bárbara', 188),
(652, 'Parroquia San Antonio de Los Altos', 189),
(653, 'Parroquia Río Chico', 190),
(654, 'Parroquia El Guapo', 190),
(655, 'Parroquia Tacarigua de La Laguna', 190),
(656, 'Parroquia Paparo', 190),
(657, 'Parroquia San Fernando del Guapo', 190),
(658, 'Parroquia Santa Lucía', 191),
(659, 'Parroquia Cúpira', 192),
(660, 'Parroquia Machurucuto', 192),
(661, 'Parroquia Guarenas', 193),
(662, 'Parroquia San Francisco de Yare', 194),
(663, 'Parroquia San Antonio de Yare', 194),
(664, 'Parroquia Petare', 195),
(665, 'Parroquia Caucagüita', 195),
(666, 'Parroquia Fila de Mariches', 195),
(667, 'Parroquia La Dolorita', 195),
(668, 'Parroquia Leoncio Martínez', 195),
(669, 'Parroquia Cúa', 196),
(670, 'Parroquia Nueva Cúa', 196),
(671, 'Parroquia Guatire', 197),
(672, 'Parroquia Bolívar', 197),
(673, 'Parroquia Capital Acosta', 198),
(674, 'Parroquia San Francisco', 198),
(675, 'Parroquia Capital Aguasay', 199),
(676, 'Parroquia Capital Bolívar', 200),
(677, 'Parroquia Capital Caripe', 201),
(678, 'Parroquia El Guácharo', 201),
(679, 'Parroquia La Guanota', 201),
(680, 'Parroquia Sabana de Piedra', 201),
(681, 'Parroquia San Agustín', 201),
(682, 'Parroquia Teresén', 201),
(683, 'Parroquia Capital Cedeño', 202),
(684, 'Parroquia Areo', 202),
(685, 'Parroquia San Félix', 202),
(686, 'Parroquia Viento Fresco', 202),
(687, 'Parroquia Capital Ezequiel Zamora', 203),
(688, 'Parroquia El Tejero', 203),
(689, 'Parroquia Capital Libertador', 204),
(690, 'Parroquia Chaguaramas', 204),
(691, 'Parroquia Las Alhuacas', 204),
(692, 'Parroquia Tabasca', 204),
(693, 'Parroquia Capital Maturín', 205),
(694, 'Parroquia Alto de los Godos', 205),
(695, 'Parroquia Boquerón', 205),
(696, 'Parroquia Las Cocuizas', 205),
(697, 'Parroquia San Simón', 205),
(698, 'Parroquia Santa Cruz', 205),
(699, 'Parroquia El Corozo', 205),
(700, 'Parroquia El Furrial', 205),
(701, 'Parroquia Jusepín', 205),
(702, 'Parroquia La Pica', 205),
(703, 'Parroquia San Vicente', 205),
(704, 'Parroquia Capital Piar', 206),
(705, 'Parroquia Aparicio', 206),
(706, 'Parroquia Chaguaramal', 206),
(707, 'Parroquia El Pinto', 206),
(708, 'Parroquia Guanaguana', 206),
(709, 'Parroquia La Toscana', 206),
(710, 'Parroquia Taguaya', 206),
(711, 'Parroquia Capital Punceres', 207),
(712, 'Parroquia Cachipo', 207),
(713, 'Parroquia Capital Santa Bárbara', 208),
(714, 'Parroquia Capital Sotillo', 209),
(715, 'Parroquia Los Barrancos de Fajardo', 209),
(716, 'Parroquia Capital Uracoa', 210),
(717, 'Parroquia Capital Antolín del Campo', 211),
(718, 'Parroquia Capital Arismendi', 212),
(719, 'Parroquia Capital Díaz', 213),
(720, 'Parroquia Zabala', 213),
(721, 'Parroquia Capital García', 214),
(722, 'Parroquia Francisco Fajardo', 214),
(723, 'Parroquia Capital Gómez', 215),
(724, 'Parroquia Bolívar', 215),
(725, 'Parroquia Guevara', 215),
(726, 'Parroquia Matasiete', 215),
(727, 'Parroquia Sucre', 215),
(728, 'Parroquia Capital Maneiro', 216),
(729, 'Parroquia Aguirre', 216),
(730, 'Parroquia Capital Marcano', 217),
(731, 'Parroquia Adrián', 217),
(732, 'Parroquia Capital Mariño', 218),
(733, 'Parroquia Capital Península de Macanao', 219),
(734, 'Parroquia San Francisco', 219),
(735, 'Parroquia Capital Tubores', 220),
(736, 'Parroquia Los Barales', 220),
(737, 'Parroquia Capital Villalba', 221),
(738, 'Parroquia Vicente Fuentes', 221),
(739, 'Parroquia Capital Agua Blanca ', 222),
(740, 'Parroquia Capital Araure ', 223),
(741, 'Parroquia Río Acarigua', 223),
(742, 'Parroquia Capital Esteller ', 224),
(743, 'Parroquia Uveral', 224),
(744, 'Parroquia Capital Guanare', 225),
(745, 'Parroquia Córdoba', 225),
(746, 'Parroquia San José de la Montaña', 225),
(747, 'Parroquia San Juan de Guanaguanare', 225),
(748, 'Parroquia Virgen de la Coromoto', 225),
(749, 'Parroquia Capital Guanarito ', 226),
(750, 'Parroquia Trinidad de la Capilla', 226),
(751, 'Parroquia Divina Pastora', 226),
(752, 'Parroquia Capital Monseñor José Vicente de Unda ', 227),
(753, 'Parroquia Peña Blanca', 227),
(754, 'Parroquia Capital Ospino ', 228),
(755, 'Parroquia Aparición', 228),
(756, 'Parroquia La Estación', 228),
(757, 'Parroquia Capital Páez ', 229),
(758, 'Parroquia Payara', 229),
(759, 'Parroquia Pimpinela', 229),
(760, 'Parroquia Ramón Peraza', 229),
(761, 'Parroquia Capital Papelón ', 230),
(762, 'Parroquia Caño Delgadito', 230),
(763, 'Parroquia Capital San Genaro de Boconoito ', 231),
(764, 'Parroquia Antolín Tovar', 231),
(765, 'Parroquia Capital San Rafael de Onoto', 232),
(766, 'Parroquia Santa Fe', 232),
(767, 'Parroquia Thermo Morles', 232),
(768, 'Parroquia Capital Santa Rosalía ', 233),
(769, 'Parroquia Florida', 233),
(770, 'Parroquia Capital Sucre ', 234),
(771, 'Parroquia Concepción', 234),
(772, 'Parroquia San Rafael de Palo Alzado', 234),
(773, 'Parroquia Uvencio Antonio Velásquez', 234),
(774, 'Parroquia San José de Saguaz', 234),
(775, 'Parroquia Villa Rosa', 234),
(776, 'Parroquia Capital Turén', 235),
(777, 'Parroquia Canelones', 235),
(778, 'Parroquia Santa Cruz', 235),
(779, 'Parroquia San Isidro Labrador', 235),
(780, 'Parroquia Mariño', 236),
(781, 'Parroquia Rómulo Gallegos', 236),
(782, 'Parroquia San José de Aerocuar', 237),
(783, 'Parroquia Tavera Acosta', 237),
(784, 'Parroquia Río Caribe', 238),
(785, 'Parroquia Antonio José de Sucre', 238),
(786, 'Parroquia El Morro de Puerto Santo', 238),
(787, 'Parroquia Puerto Santo', 238),
(788, 'Parroquia San Juan de Las Galdonas', 238),
(789, 'Parroquia El Pilar', 239),
(790, 'Parroquia El Rincón', 239),
(791, 'Parroquia General Francisco Antonio Vásquez', 239),
(792, 'Parroquia Guaraúnos', 239),
(793, 'Parroquia Tunapuicito', 239),
(794, 'Parroquia Unión', 239),
(795, 'Parroquia Bolívar ', 240),
(796, 'Parroquia Macarapana', 240),
(797, 'Parroquia Santa Catalina', 240),
(798, 'Parroquia Santa Rosa', 240),
(799, 'Parroquia Santa Teresa', 240),
(800, 'Parroquia Capital Bolívar', 241),
(801, 'Parroquia Yaguaraparo', 242),
(802, 'Parroquia El Paujil', 242),
(803, 'Parroquia Libertad', 242),
(804, 'Parroquia Araya', 243),
(805, 'Parroquia Chacopata', 243),
(806, 'Parroquia Manicuare', 243),
(807, 'Parroquia Tunapuy', 244),
(808, 'Parroquia Campo Elías', 244),
(809, 'Parroquia Irapa', 245),
(810, 'Parroquia Campo Claro', 245),
(811, 'Parroquia Marabal', 245),
(812, 'Parroquia San Antonio de Irapa', 245),
(813, 'Parroquia Soro', 245),
(814, 'Parroquia Capital Mejía', 246),
(815, 'Parroquia Cumanacoa', 247),
(816, 'Parroquia Arenas', 247),
(817, 'Parroquia Aricagua', 247),
(818, 'Parroquia Cocollar', 247),
(819, 'Parroquia San Fernando', 247),
(820, 'Parroquia San Lorenzo', 247),
(821, 'Parroquia Villa Frontado (Muelle de Cariaco)', 248),
(822, 'Parroquia Catuaro', 248),
(823, 'Parroquia Rendón', 248),
(824, 'Parroquia Santa Cruz', 248),
(825, 'Parroquia Santa María', 248),
(826, 'Parroquia Altagracia', 249),
(827, 'Parroquia Ayacucho', 249),
(828, 'Parroquia Santa Inés', 249),
(829, 'Parroquia Valentín Valiente', 249),
(830, 'Parroquia San Juan', 249),
(831, 'Parroquia Raúl Leoni', 249),
(832, 'Parroquia Gran Mariscal ', 249),
(833, 'Parroquia Güiria', 250),
(834, 'Parroquia Bideau', 250),
(835, 'Parroquia Cristóbal Colón', 250),
(836, 'Parroquia Punta de Piedras', 250),
(837, 'Parroquia Capital Andrés Bello ', 251),
(838, 'Parroquia Antonio Rómulo Costa', 252),
(839, 'Parroquia Ayacucho ', 253),
(840, 'Parroquia Rivas Berti', 253),
(841, 'Parroquia San Pedro del Río', 253),
(842, 'Parroquia Bolívar', 254),
(843, 'Parroquia Palotal', 254),
(844, 'Parroquia Juan Vicente Gómez', 254),
(845, 'Parroquia Isaías Medina Angarita', 254),
(846, 'Parroquia Cárdenas ', 255),
(847, 'Parroquia Amenodoro Rangel Lamús', 255),
(848, 'Parroquia La Florida', 255),
(849, 'Parroquia Capital Córdoba', 256),
(850, 'Parroquia Fernández Feo ', 257),
(851, 'Parroquia Alberto Adriani', 257),
(852, 'Parroquia Santo Domingo', 257),
(853, 'Parroquia Capital Francisco de Miranda', 258),
(854, 'Parroquia Capital García de Hevia ', 259),
(855, 'Parroquia Boca de Grita', 259),
(856, 'Parroquia José Antonio Páez', 259),
(857, 'Parroquia Capital Guásimos', 260),
(858, 'Parroquia Independencia ', 261),
(859, 'Parroquia Juan Germán Roscio ', 261),
(860, 'Parroquia Román Cárdenas', 261),
(861, 'Parroquia Jáuregui ', 262),
(862, 'Parroquia Emilio Constantino Guerrero', 262),
(863, 'Parroquia Monseñor Miguel Antonio Salas', 262),
(864, 'Parroquia Capital José María Vargas', 263),
(865, 'Parroquia Junín ', 264),
(866, 'Parroquia La Petrólea', 264),
(867, 'Parroquia Quinimarí', 264),
(868, 'Parroquia Bramón', 264),
(869, 'Parroquia Libertad ', 265),
(870, 'Parroquia Cipriano Castro', 265),
(871, 'Parroquia Manuel Felipe Rugeles', 265),
(872, 'Parroquia Libertador ', 266),
(873, 'Parroquia Emeterio Ochoa', 266),
(874, 'Parroquia Doradas', 266),
(875, 'Parroquia San Joaquín de Navay', 266),
(876, 'Parroquia Lobatera ', 267),
(877, 'Parroquia Constitución', 267),
(878, 'Parroquia Capital Michelena', 268),
(879, 'Parroquia Panamericano ', 269),
(880, 'Parroquia La Palmita', 269),
(881, 'Parroquia Pedro María Ureña', 270),
(882, 'Parroquia Nueva Arcadia', 270),
(883, 'Parroquia Rafael Urdaneta ', 271),
(884, 'Parroquia Samuel Darío Maldonado ', 272),
(885, 'Parroquia Boconó', 272),
(886, 'Parroquia Hernández', 272),
(887, 'Parroquia La Concordia', 273),
(888, 'Parroquia Pedro María Morantes', 273),
(889, 'Parroquia San Juan Bautista', 273),
(890, 'Parroquia San Sebastián', 273),
(891, 'Parroquia Dr. Francisco Romero Lobo', 273),
(892, 'Parroquia Capital Seboruco', 274),
(893, 'Parroquia Simón Rodríguez ', 275),
(894, 'Parroquia Sucre ', 276),
(895, 'Parroquia Eleazar López Contreras', 276),
(896, 'Parroquia San Pablo', 276),
(897, 'Parroquia  Torbes ', 277),
(898, 'Parroquia  Uribante ', 278),
(899, 'Parroquia Cárdenas', 278),
(900, 'Parroquia Juan Pablo Peñaloza', 278),
(901, 'Parroquia Potosí', 278),
(902, 'Parroquia Capital San Judas Tadeo', 279),
(903, 'Parroquia Santa Isabel', 280),
(904, 'Parroquia Araguaney', 280),
(905, 'Parroquia El Jagüito', 280),
(906, 'Parroquia La Esperanza', 280),
(907, 'Parroquia Boconó', 281),
(908, 'Parroquia El Carmen', 281),
(909, 'Parroquia Mosquey', 281),
(910, 'Parroquia Ayacucho', 281),
(911, 'Parroquia Burbusay', 281),
(912, 'Parroquia General Rivas', 281),
(913, 'Parroquia Guaramacal', 281),
(914, 'Parroquia Vega de Guaramacal', 281),
(915, 'Parroquia Monseñor Jáuregui', 281),
(916, 'Parroquia Rafael Rangel', 281),
(917, 'Parroquia San Miguel', 281),
(918, 'Parroquia San José', 281),
(919, 'Parroquia Sabana Grande', 282),
(920, 'Parroquia Cheregüé ', 282),
(921, 'Parroquia Granados', 282),
(922, 'Parroquia Chejendé', 283),
(923, 'Parroquia Arnoldo Gabaldón', 283),
(924, 'Parroquia Bolivia', 283),
(925, 'Parroquia Carrillo', 283),
(926, 'Parroquia Cegarra', 283),
(927, 'Parroquia Manuel Salvador Ulloa', 283),
(928, 'Parroquia San José', 283),
(929, 'Parroquia Carache', 284),
(930, 'Parroquia Cuicas', 284),
(931, 'Parroquia La Concepción', 284),
(932, 'Parroquia Panamericana', 284),
(933, 'Parroquia Santa Cruz', 284),
(934, 'Parroquia Escuque', 285),
(935, 'Parroquia La Unión', 285),
(936, 'Parroquia Sabana Libre', 285),
(937, 'Parroquia Santa Rita', 285),
(938, 'Parroquia El Socorro', 286),
(939, 'Parroquia Antonio José de Sucre ', 286),
(940, 'Parroquia Los Caprichos', 286),
(941, 'Parroquia Campo Elías', 287),
(942, 'Parroquia Arnoldo Gabaldón', 287),
(943, 'Parroquia Santa Apolonia ', 288),
(944, 'Parroquia El Progreso  ', 288),
(945, 'Parroquia La Ceiba  ', 288),
(946, 'Parroquia Tres de Febrero  ', 288),
(947, 'Parroquia El Dividive', 289),
(948, 'Parroquia Agua Santa', 289),
(949, 'Parroquia Agua Caliente', 289),
(950, 'Parroquia El Cenizo', 289),
(951, 'Parroquia Valerita ', 289),
(952, 'Parroquia Monte Carmelo', 290),
(953, 'Parroquia Buena Vista', 290),
(954, 'Parroquia Santa María del Horcón ', 290),
(955, 'Parroquia Motatán', 291),
(956, 'Parroquia El Baño', 291),
(957, 'Parroquia Jalisco', 291),
(958, 'Parroquia Pampán', 292),
(959, 'Parroquia Flor de Patria', 292),
(960, 'Parroquia La Paz', 292),
(961, 'Parroquia Santa Ana', 292),
(962, 'Parroquia Pampanito ', 293),
(963, 'Parroquia La Concepción ', 293),
(964, 'Parroquia Pampanito II ', 293),
(965, 'Parroquia Betijoque', 294),
(966, 'Parroquia La Pueblita ', 294),
(967, 'Parroquia Los Cedros ', 294),
(968, 'Parroquia José Gregorio Hernández', 294),
(969, 'Parroquia Carvajal', 295),
(970, 'Parroquia Antonio Nicolás Briceño', 295),
(971, 'Parroquia Campo Alegre ', 295),
(972, 'Parroquia José Leonardo Suárez ', 295),
(973, 'Parroquia Sabana de Mendoza', 296),
(974, 'Parroquia El Paraíso', 296),
(975, 'Parroquia Junín', 296),
(976, 'Parroquia Valmore Rodríguez ', 296),
(977, 'Parroquia Andrés Linares', 297),
(978, 'Parroquia Chiquinquirá', 297),
(979, 'Parroquia Cristóbal Mendoza', 297),
(980, 'Parroquia Cruz Carrillo', 297),
(981, 'Parroquia Matriz', 297),
(982, 'Parroquia Monseñor Carrillo', 297),
(983, 'Parroquia Tres Esquinas ', 297),
(984, 'Parroquia La Quebrada', 298),
(985, 'Parroquia Cabimbú', 298),
(986, 'Parroquia Jajó', 298),
(987, 'Parroquia La Mesa', 298),
(988, 'Parroquia Santiago', 298),
(989, 'Parroquia Tuñame', 298),
(990, 'Parroquia Juan Ignacio Montilla', 299),
(991, 'Parroquia La Beatriz', 299),
(992, 'Parroquia Mercedes Díaz', 299),
(993, 'Parroquia San Luis ', 299),
(994, 'Parroquia La Puerta', 299),
(995, 'Parroquia Mendoza', 299),
(996, 'Parroquia Capital Arístides Bastidas', 300),
(997, 'Parroquia Capital Bolívar', 301),
(998, 'Parroquia Capital Bruzual ', 302),
(999, 'Parroquia Campo Elías', 302),
(1000, 'Parroquia Capital Cocorote', 303),
(1001, 'Parroquia Capital Independencia', 304),
(1002, 'Parroquia Capital José Antonio Páez', 305),
(1003, 'Parroquia Capital La Trinidad ', 306),
(1004, 'Parroquia Capital Manuel Monge ', 307),
(1005, 'Parroquia Capital Nirgua ', 308),
(1006, 'Parroquia Salom', 308),
(1007, 'Parroquia Temerla', 308),
(1008, 'Parroquia Capital Peña ', 309),
(1009, 'Parroquia San Andrés', 309),
(1010, 'Parroquia Capital San Felipe ', 310),
(1011, 'Parroquia Albarico', 310),
(1012, 'Parroquia San Javier', 310),
(1013, 'Parroquia Capital Sucre ', 311),
(1014, 'Parroquia Capital Urachiche', 312),
(1015, 'Parroquia Capital Veroes ', 313),
(1016, 'Parroquia El Guayabo', 313),
(1017, 'Parroquia Isla de Toas', 314),
(1018, 'Parroquia Monagas', 314),
(1019, 'Parroquia San Timoteo', 315),
(1020, 'Parroquia General Urdaneta', 315),
(1021, 'Parroquia Libertador', 315),
(1022, 'Parroquia Manuel Guanipa Matos', 315),
(1023, 'Parroquia Marcelino Briceño', 315),
(1024, 'Parroquia Pueblo Nuevo ', 315),
(1025, 'Parroquia Ambrosio', 316),
(1026, 'Parroquia Carmen Herrera', 316),
(1027, 'Parroquia Germán Ríos Linares', 316),
(1028, 'Parroquia La Rosa', 316),
(1029, 'Parroquia Jorge Hernández', 316),
(1030, 'Parroquia Rómulo Betancourt ', 316),
(1031, 'Parroquia San Benito ', 316),
(1032, 'Parroquia Arístides Calvani ', 316),
(1033, 'Parroquia Punta Gorda', 316),
(1034, 'Parroquia Encontrados', 317),
(1035, 'Parroquia Udón Pérez', 317),
(1036, 'Parroquia San Carlos del Zulia', 318),
(1037, 'Parroquia Moralito', 318),
(1038, 'Parroquia Santa Bárbara ', 318),
(1039, 'Parroquia Santa Cruz del Zulia', 318),
(1040, 'Parroquia Urribarri', 318),
(1041, 'Parroquia Simón Rodríguez ', 319),
(1042, 'Parroquia Carlos Quevedo ', 319),
(1043, 'Parroquia Francisco Javier Pulgar ', 319),
(1044, 'Parroquia La Concepción', 320),
(1045, 'Parroquia José Ramón Yepes', 320),
(1046, 'Parroquia Mariano Parra León ', 320),
(1047, 'Parroquia San José ', 320),
(1048, 'Parroquia Jesús María Semprún ', 321),
(1049, 'Parroquia Barí ', 321),
(1050, 'Parroquia Concepción', 322),
(1051, 'Parroquia Andrés Bello', 322),
(1052, 'Parroquia Chiquinquirá', 322),
(1053, 'Parroquia El Carmelo', 322),
(1054, 'Parroquia Potreritos', 322),
(1055, 'Parroquia Alonso de Ojeda', 323),
(1056, 'Parroquia Libertad ', 323),
(1057, 'Parroquia Campo Lara', 323),
(1058, 'Parroquia Eleazar López Contreras', 323),
(1059, 'Parroquia Venezuela', 323),
(1060, 'Parroquia Libertad', 324),
(1061, 'Parroquia Bartolomé de las Casas', 324),
(1062, 'Parroquia Río Negro ', 324),
(1063, 'Parroquia San José de Perijá', 324),
(1064, 'Parroquia San Rafael', 325),
(1065, 'Parroquia La Sierrita ', 325),
(1066, 'Parroquia Las Parcelas ', 325),
(1067, 'Parroquia Luis de Vicente', 325),
(1068, 'Parroquia Monseñor Marcos Sergio Godoy', 325),
(1069, 'Parroquia Ricaurte', 325),
(1070, 'Parroquia Tamare ', 325),
(1071, 'Parroquia Antonio Borjas Romero ', 326),
(1072, 'Parroquia Bolívar', 326),
(1073, 'Parroquia Cacique Mara', 326),
(1074, 'Parroquia Caracciolo Parra Pérez', 326),
(1075, 'Parroquia Cecilio Acosta', 326),
(1076, 'Parroquia Cristo de Aranza', 326),
(1077, 'Parroquia Coquivacoa', 326),
(1078, 'Parroquia Chiquinquirá', 326),
(1079, 'Parroquia Francisco Eugenio Bustamante', 326),
(1080, 'Parroquia Idelfonso Vásquez', 326),
(1081, 'Parroquia Juana de Avila', 326),
(1082, 'Parroquia Luis Hurtado Higuera', 326),
(1083, 'Parroquia Manuel Dagnino', 326),
(1084, 'Parroquia Olegario Villalobos', 326),
(1085, 'Parroquia Raúl Leoni', 326),
(1086, 'Parroquia Santa Lucía', 326),
(1087, 'Parroquia Venancio Pulgar ', 326),
(1088, 'Parroquia San Isidro ', 326),
(1089, 'Parroquia Altagracia', 327),
(1090, 'Parroquia Ana María Campos', 327),
(1091, 'Parroquia Faría', 327),
(1092, 'Parroquia San Antonio', 327),
(1093, 'Parroquia San José', 327),
(1094, 'Parroquia Sinamaica', 328),
(1095, 'Parroquia Alta Guajira ', 328),
(1096, 'Parroquia Elías Sánchez Rubio', 328),
(1097, 'Parroquia Guajira', 328),
(1098, 'Parroquia El Rosario', 329),
(1099, 'Parroquia Donaldo García', 329),
(1100, 'Parroquia Sixto Zambrano', 329),
(1101, 'Parroquia San Francisco', 330),
(1102, 'Parroquia El Bajo ', 330),
(1103, 'Parroquia Domitila Flores ', 330),
(1104, 'Parroquia Francisco Ochoa', 330),
(1105, 'Parroquia Los Cortijos ', 330),
(1106, 'Parroquia Marcial Hernández', 330),
(1107, 'Parroquia Santa Rita', 331),
(1108, 'Parroquia El Mene ', 331),
(1109, 'Parroquia José Cenovio Urribarri ', 331),
(1110, 'Parroquia Pedro Lucas Urribarri', 331),
(1111, 'Parroquia Manuel Manrique ', 332),
(1112, 'Parroquia Rafael María Baralt ', 332),
(1113, 'Parroquia Rafael Urdaneta ', 332),
(1114, 'Parroquia Bobures', 333),
(1115, 'Parroquia El Batey ', 333),
(1116, 'Parroquia Gibraltar', 333),
(1117, 'Parroquia Heras', 333),
(1118, 'Parroquia Monseñor Arturo Celestino Alvarez', 333),
(1119, 'Parroquia Rómulo Gallegos', 333),
(1120, 'Parroquia La Victoria', 334),
(1121, 'Parroquia Rafael Urdaneta ', 334),
(1122, 'Parroquia Raúl Cuenca', 334),
(1123, 'Parroquia Caraballeda', 335),
(1124, 'Parroquia Carayaca', 335),
(1125, 'Parroquia Caruao', 335),
(1126, 'Parroquia Catia La Mar', 335),
(1127, 'Parroquia El Junko', 335),
(1128, 'Parroquia La Guaira', 335),
(1129, 'Parroquia Macuto', 335),
(1130, 'Parroquia Maiquetía', 335),
(1131, 'Parroquia Naiguatá', 335),
(1132, 'Parroquia Raúl Leoni ', 335),
(1133, 'Parroquia Carlos Soublette', 335);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dividendos`
--

CREATE TABLE `dividendos` (
  `INSTT` int(11) DEFAULT NULL,
  `CEDULA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `P_IR_ASOCIADO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ASOC` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `MONTO` int(11) DEFAULT NULL,
  `ANIO` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_emp`
--

CREATE TABLE `menu_emp` (
  `id` int(11) NOT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conex` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imagen` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ancho` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alto` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` text COLLATE utf8_unicode_ci,
  `CA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAdmin` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ConexMenu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu_emp`
--

INSERT INTO `menu_emp` (`id`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`, `ConexMenu`) VALUES
(49, 9, 'Configurar Sistema', 'vermenu.php', 'imagen/est.gif', '', '30', '20', '', '1', NULL, NULL),
(54, 20, 'Administrador', 'vermenu.php', 'imagen/administrador.jpg', '', '30', '25', '', NULL, NULL, NULL),
(65, 21, 'Mis Datos', ' vermenu.php', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_emp_sub`
--

CREATE TABLE `menu_emp_sub` (
  `id` int(11) NOT NULL,
  `enlace` int(11) NOT NULL DEFAULT '0',
  `enlacesub` char(3) DEFAULT NULL,
  `Act` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) DEFAULT NULL,
  `conex` varchar(250) DEFAULT NULL,
  `Url_1` varchar(100) NOT NULL,
  `Url_2` varchar(100) NOT NULL,
  `Url_3` varchar(100) NOT NULL,
  `Url_4` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url_5` varchar(100) NOT NULL,
  `Url_6` varchar(100) DEFAULT NULL,
  `Url_7` varchar(100) DEFAULT NULL,
  `Url_8` varchar(100) DEFAULT NULL,
  `Url_9` varchar(100) DEFAULT NULL,
  `Url_10` varchar(100) DEFAULT NULL,
  `Inserte` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Updated` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Deleted` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Acciones` varchar(80) NOT NULL,
  `Ejecutar` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conexd` varchar(200) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `nivel` text,
  `CA` char(2) DEFAULT NULL,
  `CAdmin` int(1) DEFAULT NULL,
  `CssColor` varchar(50) NOT NULL,
  `CssImagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menu_emp_sub`
--

INSERT INTO `menu_emp_sub` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
(55, 54, NULL, NULL, 21, 'Crear Usuario', 'conf_usuario/crear_usuario.php', 'conf_usuario/crear_usuario.php', 'conf_usuario/asignar_permiso_minic.php', 'conf_usuario/asignar_permiso_list.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', 'cargas/acciones/acciones.php', '', '', '', '', NULL, NULL, '', ''),
(110, 54, 'fun', NULL, 21, 'Administrar Perfiles', 'admin/perfiles.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, '', '', NULL, NULL, '', ''),
(369, 65, NULL, NULL, 21, 'Mis Datos', 'sistema/index.php', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_master`
--

CREATE TABLE `menu_master` (
  `id` int(11) NOT NULL,
  `nombre_menu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_master`
--

INSERT INTO `menu_master` (`id`, `nombre_menu`) VALUES
(1, 'Solicitudes'),
(2, 'Admin Departamentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_menu_emp_menj`
--

CREATE TABLE `m_menu_emp_menj` (
  `id` int(11) NOT NULL,
  `ConexMenuMaster` int(11) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conex` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `funcion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Imagen` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ancho` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alto` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nivel` text COLLATE utf8_unicode_ci,
  `CA` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAdmin` char(2) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `m_menu_emp_menj`
--

INSERT INTO `m_menu_emp_menj` (`id`, `ConexMenuMaster`, `orden`, `menu`, `conex`, `funcion`, `Imagen`, `ancho`, `alto`, `nivel`, `CA`, `CAdmin`) VALUES
(54, NULL, NULL, 'Administrador', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
(70, NULL, 1, 'Mis Datos', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
(71, NULL, 2, 'Solicitudes', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL),
(72, NULL, 3, 'Est. de Cuenta', 'menu.php', NULL, '', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `m_menu_emp_sub_menj`
--

CREATE TABLE `m_menu_emp_sub_menj` (
  `id` int(11) NOT NULL,
  `enlace` int(11) NOT NULL DEFAULT '0',
  `enlacesub` char(3) DEFAULT NULL,
  `Act` char(1) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `menu` varchar(250) DEFAULT NULL,
  `conex` varchar(250) DEFAULT NULL,
  `Url_1` varchar(100) NOT NULL,
  `Url_2` varchar(100) NOT NULL,
  `Url_3` varchar(100) NOT NULL,
  `Url_4` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url_5` varchar(100) NOT NULL,
  `Url_6` varchar(100) DEFAULT NULL,
  `Url_7` varchar(100) DEFAULT NULL,
  `Url_8` varchar(100) DEFAULT NULL,
  `Url_9` varchar(100) DEFAULT NULL,
  `Url_10` varchar(100) DEFAULT NULL,
  `Inserte` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Updated` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Deleted` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Acciones` varchar(80) NOT NULL,
  `Ejecutar` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `conexd` varchar(200) DEFAULT NULL,
  `funcion` varchar(100) DEFAULT NULL,
  `nivel` text,
  `CA` char(2) DEFAULT NULL,
  `CAdmin` int(1) DEFAULT NULL,
  `CssColor` varchar(50) NOT NULL,
  `CssImagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `m_menu_emp_sub_menj`
--

INSERT INTO `m_menu_emp_sub_menj` (`id`, `enlace`, `enlacesub`, `Act`, `orden`, `menu`, `conex`, `Url_1`, `Url_2`, `Url_3`, `Url_4`, `Url_5`, `Url_6`, `Url_7`, `Url_8`, `Url_9`, `Url_10`, `Inserte`, `Updated`, `Deleted`, `Acciones`, `Ejecutar`, `conexd`, `funcion`, `nivel`, `CA`, `CAdmin`, `CssColor`, `CssImagen`) VALUES
(55, 54, NULL, NULL, NULL, 'Asignar Usuarios', 'menu.php', 'conf_usuario/crear_usuario.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(110, 54, NULL, NULL, NULL, 'Administrar Perfiles', 'menu.php', 'admin_perfil/conf_perfil.php', 'admin_perfil/conf_menu_list.php', 'admin_perfil/conf_menu_accion.php', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(140, 70, NULL, NULL, NULL, 'Datos Personales', 'menu.php', 'sistema/datosper.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(142, 71, NULL, NULL, NULL, 'Nueva solicitud', 'menu.php', 'sistema/solicitud/nuevasol.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(143, 71, NULL, NULL, NULL, 'Ver Solicitudes', 'menu.php', 'sistema/solicitud/solicitudes.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', ''),
(144, 72, NULL, NULL, NULL, 'Ver', 'menu.php', 'sistema/estadocuent.php', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `CodPerfil` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`CodPerfil`, `Nombre`) VALUES
(1, 'Administrador'),
(2, 'operador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles_det`
--

CREATE TABLE `perfiles_det` (
  `id` int(11) NOT NULL,
  `IdPerfil` int(11) NOT NULL DEFAULT '0',
  `Submenu` int(11) NOT NULL DEFAULT '0',
  `Menu` int(11) NOT NULL DEFAULT '0',
  `S` tinyint(4) NOT NULL,
  `U` tinyint(4) NOT NULL,
  `D` tinyint(4) NOT NULL,
  `I` tinyint(4) NOT NULL,
  `P` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfiles_det`
--

INSERT INTO `perfiles_det` (`id`, `IdPerfil`, `Submenu`, `Menu`, `S`, `U`, `D`, `I`, `P`) VALUES
(1, 1, 110, 54, 1, 1, 1, 1, 0),
(113, 1, 55, 54, 1, 1, 1, 1, 0),
(149, 1, 140, 70, 1, 1, 1, 1, 1),
(151, 1, 142, 71, 1, 1, 1, 1, 1),
(153, 1, 143, 71, 1, 1, 1, 1, 1),
(154, 1, 144, 72, 1, 1, 1, 1, 1),
(155, 2, 140, 70, 1, 1, 1, 1, 1),
(165, 2, 143, 71, 1, 1, 1, 1, 1),
(166, 2, 142, 71, 1, 1, 1, 1, 1),
(168, 2, 144, 72, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prest`
--

CREATE TABLE `prest` (
  `ID` int(11) NOT NULL,
  `INSTT` int(11) DEFAULT NULL,
  `ASOC` int(11) DEFAULT NULL,
  `P_IR_ASOCIADO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CEDULA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TP_PREST` int(11) DEFAULT NULL,
  `SOLICITADO` int(11) DEFAULT NULL,
  `CANC_NORM` int(11) DEFAULT NULL,
  `CANC_ESP` int(11) DEFAULT NULL,
  `PDT_NORM` int(11) DEFAULT NULL,
  `PDT_ESP` int(11) DEFAULT NULL,
  `CTAS_NORM` int(11) DEFAULT NULL,
  `CTAS_ESP` int(11) DEFAULT NULL,
  `INICIO_NORM` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `INICIO_ESP` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CREADO_EL` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CREADO_POR` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TP_PREST_N` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `AFECT_DISP` set('true','false') COLLATE utf8_bin DEFAULT NULL,
  `CUOTAS` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recargar`
--

CREATE TABLE `recargar` (
  `id` int(11) NOT NULL,
  `URL` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `actd` int(1) NOT NULL,
  `Accion` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `recargar`
--

INSERT INTO `recargar` (`id`, `URL`, `actd`, `Accion`) VALUES
(1, 'uploader/receiver.php', 0, ''),
(2, 'recargar/recargar.php', 0, ''),
(3, 'recargar/recargar.php', 0, ''),
(4, 'sistema/documentos/selectorAnual.php', 0, ''),
(5, 'sistema/documentos/selectorMes.php', 0, ''),
(351, 'sistema/index.php', 0, ''),
(352, 'recargar/recargar.php', 1, ''),
(353, 'sistema/reportes/pdf_constancia.php', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrados`
--

CREATE TABLE `registrados` (
  `id` int(11) NOT NULL,
  `nacionalidad` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Usuario` int(11) NOT NULL,
  `cedula` int(11) NOT NULL DEFAULT '0',
  `Nombres` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `correo` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Sexo';

--
-- Volcado de datos para la tabla `sexo`
--

INSERT INTO `sexo` (`id`, `Nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solict_prest`
--

CREATE TABLE `solict_prest` (
  `INSTT` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `CEDULA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ASOC` int(11) DEFAULT NULL,
  `P_IR_ASOCIADO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `TP_PREST` int(11) DEFAULT NULL,
  `ESTATUS` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `MONTO` int(11) DEFAULT NULL,
  `ESTATUS_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MTO_X_CTA` int(11) DEFAULT NULL,
  `OBSV` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `RETORNO_SMS` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solict_ret_parc`
--

CREATE TABLE `solict_ret_parc` (
  `INSTT` int(11) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CEDULA` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `P_IR_ASOCIADO` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `ESTATUS` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `OBSERVACIONES` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `MONTO` decimal(10,0) DEFAULT NULL,
  `ESTATUS_NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `OBSV` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `RETORNO_SMS` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tp_prest`
--

CREATE TABLE `tp_prest` (
  `ID` int(11) NOT NULL,
  `INSTT` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `INTERES` int(11) DEFAULT NULL,
  `CUONTAS` int(11) DEFAULT NULL,
  `MTO_MAX` int(11) DEFAULT NULL,
  `METODO_MORT` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `AFECT_DISP` set('true','false') COLLATE utf8_bin DEFAULT NULL,
  `SERVICIOS` set('true','false') COLLATE utf8_bin DEFAULT NULL,
  `REPETIDO` set('true','false') COLLATE utf8_bin DEFAULT NULL,
  `GASTOS` set('true','false') COLLATE utf8_bin DEFAULT NULL,
  `CTAS_ESP` set('true','false') COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `Cedula` int(11) NOT NULL DEFAULT '0',
  `Usuario` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contrasena` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `CodSede` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Tipo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Nivel` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Stilo` int(1) NOT NULL,
  `theme_color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Registro` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Cedula`, `Usuario`, `contrasena`, `CodSede`, `Tipo`, `Nivel`, `Stilo`, `theme_color`, `Codigo`, `Registro`, `Fecha`, `Observacion`) VALUES
(9, 19191493, 'ROJASGB', 'a1b995eb2627f17bfd5fcb1de8533c62', '', 'Empleado', '1', 0, '', '6c787', '1', '2016-11-16 09:34:10', NULL),
(18, 19430853, 'gimonxd', '9593055f40090d0abb8d3d6c7151746b', NULL, 'Empleado', '1', 0, '', 'd6114', '1', '0000-00-00 00:00:00', NULL),
(25, 19191493, '', '', NULL, '', NULL, 0, '', '6c787', NULL, '0000-00-00 00:00:00', NULL),
(74, 8573655, 'laya', 'a1b995eb2627f17bfd5fcb1de8533c62', NULL, 'Empleado', '2', 0, '', '6ccec', NULL, '0000-00-00 00:00:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amort_esp`
--
ALTER TABLE `amort_esp`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK__prest` (`PREST`);

--
-- Indices de la tabla `amort_nor`
--
ALTER TABLE `amort_nor`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `asoc`
--
ALTER TABLE `asoc`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CEDULA` (`CEDULA`);

--
-- Indices de la tabla `auditar`
--
ALTER TABLE `auditar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carg_fam`
--
ALTER TABLE `carg_fam`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to` (`to`),
  ADD KEY `from` (`from`);

--
-- Indices de la tabla `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `time` (`time`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `dividendos`
--
ALTER TABLE `dividendos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `menu_emp`
--
ALTER TABLE `menu_emp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden` (`orden`);

--
-- Indices de la tabla `menu_emp_sub`
--
ALTER TABLE `menu_emp_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enlace` (`enlace`);

--
-- Indices de la tabla `menu_master`
--
ALTER TABLE `menu_master`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `m_menu_emp_menj`
--
ALTER TABLE `m_menu_emp_menj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden` (`orden`);

--
-- Indices de la tabla `m_menu_emp_sub_menj`
--
ALTER TABLE `m_menu_emp_sub_menj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enlace` (`enlace`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`CodPerfil`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `perfiles_det`
--
ALTER TABLE `perfiles_det`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IdPerfil_2` (`IdPerfil`,`Submenu`,`Menu`),
  ADD KEY `IdPerfil` (`IdPerfil`),
  ADD KEY `Submenu` (`Submenu`),
  ADD KEY `Menu` (`Menu`);

--
-- Indices de la tabla `prest`
--
ALTER TABLE `prest`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `recargar`
--
ALTER TABLE `recargar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solict_prest`
--
ALTER TABLE `solict_prest`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `P_IR_ASOCIADO` (`P_IR_ASOCIADO`);

--
-- Indices de la tabla `solict_ret_parc`
--
ALTER TABLE `solict_ret_parc`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `P_IR_ASOCIADO` (`P_IR_ASOCIADO`);

--
-- Indices de la tabla `tp_prest`
--
ALTER TABLE `tp_prest`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Usuario` (`Usuario`),
  ADD UNIQUE KEY `Cedula_2` (`Tipo`,`Cedula`),
  ADD KEY `Tipo` (`Cedula`,`Tipo`,`Usuario`),
  ADD KEY `Cedula` (`Codigo`,`Usuario`,`Cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asoc`
--
ALTER TABLE `asoc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `auditar`
--
ALTER TABLE `auditar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `carg_fam`
--
ALTER TABLE `carg_fam`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dividendos`
--
ALTER TABLE `dividendos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `menu_emp`
--
ALTER TABLE `menu_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT de la tabla `menu_emp_sub`
--
ALTER TABLE `menu_emp_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=370;
--
-- AUTO_INCREMENT de la tabla `menu_master`
--
ALTER TABLE `menu_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `m_menu_emp_menj`
--
ALTER TABLE `m_menu_emp_menj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de la tabla `m_menu_emp_sub_menj`
--
ALTER TABLE `m_menu_emp_sub_menj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT de la tabla `perfiles_det`
--
ALTER TABLE `perfiles_det`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;
--
-- AUTO_INCREMENT de la tabla `prest`
--
ALTER TABLE `prest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `recargar`
--
ALTER TABLE `recargar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=354;
--
-- AUTO_INCREMENT de la tabla `registrados`
--
ALTER TABLE `registrados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `solict_prest`
--
ALTER TABLE `solict_prest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `solict_ret_parc`
--
ALTER TABLE `solict_ret_parc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tp_prest`
--
ALTER TABLE `tp_prest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `m_menu_emp_sub_menj`
--
ALTER TABLE `m_menu_emp_sub_menj`
  ADD CONSTRAINT `m_menu_emp_sub_menj_ibfk_1` FOREIGN KEY (`enlace`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfiles_det`
--
ALTER TABLE `perfiles_det`
  ADD CONSTRAINT `perfiles_det_ibfk_1` FOREIGN KEY (`IdPerfil`) REFERENCES `perfiles` (`CodPerfil`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfiles_det_ibfk_2` FOREIGN KEY (`Menu`) REFERENCES `m_menu_emp_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perfiles_det_ibfk_3` FOREIGN KEY (`Submenu`) REFERENCES `m_menu_emp_sub_menj` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
