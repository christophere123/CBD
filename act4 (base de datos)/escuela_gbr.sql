-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-10-2022 a las 02:44:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_gbr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_semana`, `horas_totales`) VALUES
('HE34', 'calculo', 5, 127),
('HG54', 'tutoria', 1, 20),
('HT43', 'ingles', 5, 127),
('JH65', 'Fisica', 4, 127),
('PE10', 'Especialidad', 15, 127),
('XN34', 'sociales', 4, 127);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(15) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `lider_academia` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('contabilidad', 'Vespertino', 'samuel zanches'),
('electricidad', 'Vespertino', 'francisco'),
('logistica', 'matutino', 'jocelyn valdez'),
('Mecanica', 'matutino', 'marcelo gomez'),
('programacion', 'mixto', 'pepe pancho'),
('recursos humano', 'Vespertino', 'manuel mendez'),
('Soporte', 'Vespertino', 'lizbeth mendoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` int(4) NOT NULL,
  `domicilio` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('3264', 'francisco', 'Mendez', 18, 'colonia centro', '347545323', '5MM'),
('4212', 'Christopher', 'Burguer', 17, 'Prolongacion centro', '314123123', '5PV'),
('4242', 'Sebastian', 'Ramirez', 16, 'el llanito', '976383431', '5EV'),
('7667', 'Jocelyn', 'Sanchez', 17, 'piedras negras', '31471423', '5CV'),
('9768', 'Elias', 'Abraham', 17, 'san antonio crimen', '34322123', '5RV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(7) NOT NULL,
  `asignatura` varchar(10) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `semestre` int(4) NOT NULL,
  `calificacion` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`) VALUES
('3264', 'HE34', '25/07/21', 4, 8),
('4212', 'HG54', '31/10/21', 6, 9),
('4242', 'HT43', '12/03/21', 3, 8),
('7667', 'JH65', '21/07/21', 4, 8),
('9768', 'PE10', '24/02/21', 2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(30) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(60) DEFAULT NULL,
  `tutor` varchar(60) DEFAULT NULL,
  `carrera` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5CV', 'Vespertino', 'samuel zanches', 'Carolina', 'contabilidad'),
('5EV', 'Vespertino', 'francisco', 'Hugo', 'electricidad'),
('5LM', 'matutino', 'jocelyn valdez', 'Rojas', 'logistica'),
('5MM', 'matutino', 'lizbeth mendoza', 'Silva', 'mecanica'),
('5PV', 'Vespertino', 'marcelo gomez', 'Mastache', 'programacion'),
('5RV', 'Vespertino', 'pepe pancho', 'Barron', 'recursos humano'),
('5S', 'Vespertino', 'manuel mendez', 'teran', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `carrera` (`carrera`),
  ADD KEY `idx_carrera` (`nombre`(15));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
