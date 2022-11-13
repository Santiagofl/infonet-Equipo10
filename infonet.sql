DROP DATABASE IF EXISTS infonet;
create database infonet;
use infonet;

select *
from usuario;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `infonet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id_articulo` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `subtitulo` varchar(200) DEFAULT NULL,
  `texto` varchar(4000) DEFAULT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `id_edicion` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `edicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_compra`, `usuario`, `edicion`) VALUES
(3, 2, 1),
(4, 3, 1),
(5, 2, 2),
(6, 2, 3),
(7, 2, 5),
(8, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `edicion`
--

CREATE TABLE `edicion` (
  `id_edicion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `edicion`
--

INSERT INTO `edicion` (`id_edicion`, `fecha`, `id_producto`) VALUES
(1, '2022-11-10', 1),
(2, '2022-11-11', 2),
(3, '2022-11-12', 3),
(4, '2022-11-13', 4),
(5, '2022-11-14', 5),
(6, '2022-11-15', 6),
(7, '2022-11-16', 7),
(8, '2022-11-17', 8),
(9, '2022-11-18', 9),
(10, '2022-11-19', 1),
(11, '2022-11-20', 2),
(12, '2022-11-21', 3),
(13, '2022-11-22', 4),
(14, '2022-11-23', 5),
(15, '2022-11-24', 6),
(16, '2022-11-25', 7),
(17, '2022-11-28', 1),
(18, '2022-11-29', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
(1, 'Borrador'),
(2, 'Publicar'),
(3, 'Publicado'),
(4, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` text DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `imagen`, `tipo`) VALUES
(1, 'Clarin', 'clarin.png', 1),
(2, 'La Nacion', 'lanacion.png', 1),
(3, 'Cronica', 'cronica.png', 1),
(4, 'Hola', 'hola.png', 2),
(5, 'Olé', 'ole.png', 1),
(6, 'Perfil', 'perfil.png', 1),
(7, 'Pronto', 'pronto.png', 2),
(8, 'Unlam', 'unlam.png', 1),
(9, 'Página 12', 'pagina12.png', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `descripcion`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `id_edicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`) VALUES
(1, 'Política', NULL, NULL),
(2, 'Economía', NULL, NULL),
(3, 'Internacional', NULL, NULL),
(4, 'Nacional', NULL, NULL),
(5, 'Sociedad', NULL, NULL),
(6, 'Cultura', NULL, NULL),
(7, 'Deportes', NULL, NULL),
(8, 'Tendencias', NULL, NULL),
(9, 'Moda', NULL, NULL),
(10, 'Arte', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscripcion`
--

CREATE TABLE `subscripcion` (
  `id_subscripcion` int(11) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `edicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo_producto` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id_tipo_producto`, `descripcion`) VALUES
(1, 'diario'),
(2, 'revista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `usuario`, `latitud`, `longitud`, `email`, `fecha_nacimiento`, `rol`) VALUES
(1, 'user', 'user123', 'user', NULL, NULL, 'user@mail.com', NULL, NULL),
(2, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', '2022-10-10', 1),
(3, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', '2022-10-10', 1),
(4, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', '2022-10-10', 1),
(5, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', '2022-10-10', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `id_edicion` (`id_edicion`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `edicion` (`edicion`);

--
-- Indices de la tabla `edicion`
--
ALTER TABLE `edicion`
  ADD PRIMARY KEY (`id_edicion`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id_seccion`),
  ADD KEY `id_edicion` (`id_edicion`);

--
-- Indices de la tabla `subscripcion`
--
ALTER TABLE `subscripcion`
  ADD PRIMARY KEY (`id_subscripcion`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `edicion` (`edicion`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id_articulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `edicion`
--
ALTER TABLE `edicion`
  MODIFY `id_edicion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
  MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `subscripcion`
--
ALTER TABLE `subscripcion`
  MODIFY `id_subscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`id_edicion`) REFERENCES `edicion` (`id_edicion`),
  ADD CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`edicion`) REFERENCES `edicion` (`id_edicion`);

--
-- Filtros para la tabla `edicion`
--
ALTER TABLE `edicion`
  ADD CONSTRAINT `edicion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id_tipo_producto`);

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`id_edicion`) REFERENCES `edicion` (`id_edicion`);

--
-- Filtros para la tabla `subscripcion`
--
ALTER TABLE `subscripcion`
  ADD CONSTRAINT `subscripcion_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `subscripcion_ibfk_2` FOREIGN KEY (`edicion`) REFERENCES `edicion` (`id_edicion`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;