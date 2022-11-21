DROP DATABASE IF EXISTS infonet;
create database infonet;
use infonet;

-- rol
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 05:39:06
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

CREATE TABLE rol (
                     id_rol INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                     descripcion VARCHAR(45) DEFAULT NULL
);

-- usuario
CREATE TABLE usuario (
                         id_usuario INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         nombre VARCHAR(45) DEFAULT NULL,
                         password VARCHAR(45) DEFAULT NULL,
                         usuario VARCHAR(45) DEFAULT NULL,
                         latitud FLOAT DEFAULT NULL,
                         longitud FLOAT DEFAULT NULL,
                         email VARCHAR(45) DEFAULT NULL,
                         rol INT(11) DEFAULT NULL,
                         FOREIGN KEY (rol)
                             REFERENCES rol (id_rol),
                         activo BOOLEAN
);



-- tipo
CREATE TABLE tipo (
                      id_tipo_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                      descripcion VARCHAR(45) DEFAULT NULL
);

-- producto
CREATE TABLE producto (
                          id_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                          nombre VARCHAR(45) DEFAULT NULL,
                          imagen VARCHAR(45) DEFAULT NULL,
                          precio DECIMAL(10 , 2 ),
                          tipo INT(11),
                          FOREIGN KEY (tipo)
                              REFERENCES tipo (id_tipo_producto)
);

-- edicion
CREATE TABLE edicion (
                         id_edicion INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         fecha DATE DEFAULT NULL,
                         id_producto INT(11),
                         FOREIGN KEY (id_producto)
                             REFERENCES producto (id_producto)
);

/*CREATE TABLE `seccion_edicion_articulo` (
  `id_seccion` int(11),
  `id_edicion` int(11),
  `id_articulo` int(11),
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto),
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto),
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto)
);*/

CREATE TABLE seccion (
                         id_seccion INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                         nombre VARCHAR(45) DEFAULT NULL,
                         imagen VARCHAR(45) DEFAULT NULL,
                         id_edicion INT(11),
                         FOREIGN KEY (id_edicion)
                             REFERENCES edicion (id_edicion)
);
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
                            `id_estado` int(11) DEFAULT 1,
                            `id_seccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id_articulo`, `titulo`, `subtitulo`, `texto`, `autor`, `imagen`, `latitud`, `longitud`, `id_edicion`, `id_estado`, `id_seccion`) VALUES
                                                                                                                                                              (1, 'titulo 1', 'sub 1', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 1, 2, 1),
                                                                                                                                                              (2, 'titulo 2', 'sub 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 2, 2, 2),
                                                                                                                                                              (3, 'titulo 3', 'sub 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 3, 2, 3),
                                                                                                                                                              (4, 'titulo 4', 'sub 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 4, 2, 4),
                                                                                                                                                              (5, 'titulo 5', 'sub 5', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 5, 2, 5),
                                                                                                                                                              (6, 'titulo 6', 'sub 6', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 6, 2, 6),
                                                                                                                                                              (7, 'titulo 7', 'sub 7', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 7, 2, 7),
                                                                                                                                                              (8, 'titulo 8', 'sub 8', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 8, 2, 8),
                                                                                                                                                              (9, 'titulo 9', 'sub 9', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 9, 2, 9),
                                                                                                                                                              (10, 'titulo 10', 'sub 10', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 10, 2, 10),
                                                                                                                                                              (11, 'Hola', 'Prueba', '1312312', 'qeqweq', '', NULL, NULL, 1, 2, 1);

-- --------------------------------------------------------

-- estado
CREATE TABLE estado (
                        id_estado INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        descripcion VARCHAR(45) DEFAULT NULL
);

CREATE TABLE `compra` (
                          `id_compra` int(11) NOT NULL,
                          `usuario` int(11) DEFAULT NULL,
                          `edicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- articulos
CREATE TABLE articulo (
                          id_articulo INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                          titulo VARCHAR(200) DEFAULT NULL,
                          subtitulo VARCHAR(200) DEFAULT NULL,
                          texto VARCHAR(4000) DEFAULT NULL,
                          autor VARCHAR(45) DEFAULT NULL,
                          imagen VARCHAR(45) DEFAULT NULL,
                          latitud FLOAT DEFAULT NULL,
                          longitud FLOAT DEFAULT NULL,
                          id_edicion INT(11),
                          id_estado INT(11),
                          id_seccion INT(11),
                          FOREIGN KEY (id_edicion)
                              REFERENCES edicion (id_edicion),
                          FOREIGN KEY (id_estado)
                              REFERENCES estado (id_estado),
                          FOREIGN KEY (id_seccion)
                              REFERENCES seccion (id_seccion)
);
INSERT INTO `compra` (`id_compra`, `usuario`, `edicion`) VALUES
                                                             (3, 2, 1),
                                                             (4, 3, 1),
                                                             (5, 2, 2),
                                                             (6, 2, 3),
                                                             (7, 2, 5),
                                                             (8, 2, 4);


CREATE TABLE compra (
                        id_compra INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        usuario INT(11) DEFAULT NULL,
                        edicion INT(11) DEFAULT NULL,
                        FOREIGN KEY (usuario)
                            REFERENCES usuario (id_usuario),
                        FOREIGN KEY (edicion)
                            REFERENCES edicion (id_edicion)
);

CREATE TABLE `edicion` (
                           `id_edicion` int(11) NOT NULL,
                           `fecha` date DEFAULT NULL,
                           `precio` DECIMAL(10, 2),
                           `id_producto` int(11) DEFAULT NULL,
                           `evento` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE suscripcion (
                             id_suscripcion INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                             fecha DATE,
                             id_producto INT(11),
                             id_usuario INT(11),
                             precio DECIMAL(10 , 2 ),
                             FOREIGN KEY (id_producto)
                                 REFERENCES producto (id_producto),
                             FOREIGN KEY (id_usuario)
                                 REFERENCES usuario (id_usuario)
);

INSERT INTO tipo (id_tipo_producto,descripcion) VALUES
                                                    (1,'diario'),
                                                    (2,'revista');
INSERT INTO `edicion` (`id_edicion`, `fecha`, `id_producto`, `evento`, `precio`) VALUES
                                                                                     (1, '2022-11-10', 1, '123123', 250.00),
                                                                                     (2, '2022-11-11', 2, '12312312', 350.00),
                                                                                     (3, '2022-11-12', 3, '123123', 450.00),
                                                                                     (4, '2022-11-13', 4, '312132', 550.00),
                                                                                     (5, '2022-11-14', 5, '12312', 650.00),
                                                                                     (6, '2022-11-15', 6, '13123', 750.00),
                                                                                     (7, '2022-11-16', 7, '13212', 860.00),
                                                                                     (8, '2022-11-17', 8, '123123', 340.00),
                                                                                     (9, '2022-11-18', 9, '13212', 241.00),
                                                                                     (10, '2022-11-19', 1, '1312', 293.00),
                                                                                     (11, '2022-11-20', 2, '123123', 880.00),
                                                                                     (12, '2022-11-21', 3, '123123', 980.00),
                                                                                     (13, '2022-11-22', 4, '13123', 999.00),
                                                                                     (14, '2022-11-23', 5, '1232131', 353.00),
                                                                                     (15, '2022-11-24', 6, '12312', 262.00),
                                                                                     (16, '2022-11-25', 7, '312312', 220.00),
                                                                                     (17, '2022-11-28', 1, 'eqweqw', 513.00),
                                                                                     (18, '2022-11-29', 2, 'qweqw', 865.00);


INSERT INTO producto (nombre, imagen, precio, tipo) VALUES
                                                        ('Clarin', 'clarin.png', 1050.00, 1),
                                                        ('La Nacion', 'lanacion.png', 999.99, 1),
                                                        ('Cronica', 'cronica.png', 580.00, 1),
                                                        ('Hola', 'hola.png', 799.99,2),
                                                        ('Olé', 'ole.png', 1100.00,2),
                                                        ('Perfil', 'perfil.png', 875.00,2),
                                                        ('Pronto', 'pronto.png', 699.99,2),
                                                        ('Unlam', 'unlam.png', 200.00,2),
                                                        ('Página 12', 'pagina12.png', 850.00,1);

INSERT INTO edicion (id_edicion,fecha,id_producto) VALUES
                                                       (1,'2022-11-10',1),
                                                       (2,'2022-11-11',2),
                                                       (3,'2022-11-12',3),
                                                       (4,'2022-11-13',4),
                                                       (5,'2022-11-14',5),
                                                       (6,'2022-11-15',6),
                                                       (7,'2022-11-16',7),
                                                       (8,'2022-11-17',8),
                                                       (9,'2022-11-18',9),
                                                       (10,'2022-11-19',1),
                                                       (11,'2022-11-20',2),
                                                       (12,'2022-11-21',3),
                                                       (13,'2022-11-22',4),
                                                       (14,'2022-11-23',5),
                                                       (15,'2022-11-24',6),
                                                       (16,'2022-11-25',7);
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
                                                      (1, 'En revision'),
                                                      (2, 'Publicado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
                            `id_producto` int(11) NOT NULL,
                            `nombre` varchar(45) DEFAULT NULL,
                            `imagen` text DEFAULT NULL,
                            `tipo` int(11) DEFAULT NULL,
                            `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `imagen`, `tipo`, `precio`) VALUES
                                                                                 (1, 'Clarin', 'clarin.png', 1, '1050.00'),
                                                                                 (2, 'La Nacion', 'lanacion.png', 1, '999.10'),
                                                                                 (3, 'Cronica', 'cronica.png', 1, '600.40'),
                                                                                 (4, 'Hola', 'hola.png', 2, '1043.23'),
                                                                                 (5, 'Olé', 'ole.png', 1, '950.32'),
                                                                                 (6, 'Perfil', 'perfil.png', 1, '999.99'),
                                                                                 (7, 'Pronto', 'pronto.png', 2, '1230.32'),
                                                                                 (8, 'Unlam', 'unlam.png', 1, '1200.00'),
                                                                                 (9, 'Página 12', 'pagina12.png', 1, '1100.00');

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
                                                (1, 'admin'),
                                                (2, 'lector'),
                                                (3, 'editor');



INSERT INTO `usuario` (`id_usuario`, `nombre`,`activo` ,  `password`, `usuario`, `latitud`, `longitud`, `email`,  `rol`) VALUES
CREATE TABLE `seccion` (
                           `id_seccion` int(11) NOT NULL,
                           `nombre` varchar(45) DEFAULT NULL,
                           `imagen` varchar(45) DEFAULT NULL,
                           `id_edicion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

    (1,  'roro',1, '202cb962ac59075b964b07152d234b70', 'roro', 100, 100, 'monteagudorodrigo@gmail.com', 1);

INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`) VALUES
                                                                           (1, 'Política', NULL, 1),
                                                                           (2, 'Economía', NULL, 2),
                                                                           (3, 'Internacional', NULL, 2),
                                                                           (4, 'Nacional', NULL, 1),
                                                                           (5, 'Sociedad', NULL, 3),
                                                                           (6, 'Cultura', NULL, 1),
                                                                           (7, 'Deportes', NULL, 4),
                                                                           (8, 'Tendencias', NULL, 5),
                                                                           (9, 'Moda', NULL, 1),
                                                                           (10, 'Arte', NULL, 2),
                                                                           (13, '', NULL, NULL);


INSERT INTO `seccion` (`id_seccion`,`nombre`,`imagen`,`id_edicion`) VALUES
                                                                        (1,'Política',NULL,NULL),
                                                                        (2,'Economía',NULL,NULL),
                                                                        (3,'Internacional',NULL,NULL),
                                                                        (4,'Nacional',NULL,NULL),
                                                                        (5,'Sociedad',NULL,NULL),
                                                                        (6,'Cultura',NULL,NULL),
                                                                        (7,'Deportes',NULL,NULL),
                                                                        (8,'Tendencias',NULL,NULL),
                                                                        (9,'Moda',NULL,NULL),
                                                                        (10,'Arte',NULL,NULL);

INSERT INTO `compra` (`id_compra`, `usuario`, `edicion`) VALUES
                                                             (3, 1, 1),
                                                             (4, 1, 1),
                                                             (5, 1, 2),
                                                             (6, 1, 3),
                                                             (7, 1, 5),
                                                             (8, 1, 4);

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
                                                      (1, 'Borrador'),
                                                      (2, 'Publicar'),
                                                      (3, 'Publicado'),
                                                      (4, 'Baja');
--
-- Estructura de tabla para la tabla `suscripcion`
--

CREATE TABLE `suscripcion` (
                               `fecha` date DEFAULT NULL,
                               `id_producto` int(11) NOT NULL,
                               `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `suscripcion`
--

INSERT INTO `suscripcion` (`fecha`, `id_producto`, `id_usuario`) VALUES
                                                                     ('2022-11-08', 2, 2),
                                                                     ('2022-11-08', 3, 2);

-- --------------------------------------------------------

insert into suscripcion(id_suscripcion,fecha ,id_producto, id_usuario) values
    (1,'2022-11-08',1,1);

CREATE TABLE `tipo` (
                        `id_tipo_producto` int(11) NOT NULL,
                        `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `articulo` (`id_articulo`,`titulo`,`subtitulo`,`texto`,`autor`,`imagen`,`latitud`,`longitud`,`id_edicion`,`id_estado`,`id_seccion`) VALUES (1,'titulo 1','sub 1','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,1,1,1),
                                                                                                                                                       (2,'titulo 2','sub 2','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,2,2,2)
        ,
                                                                                                                                                       (3,'titulo 3','sub 3','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,3,3,3),(4,'titulo 4','sub 4','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,4,4,4),
                                                                                                                                                       (5,'titulo 5','sub 5','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,5,1,5),
                                                                                                                                                       (6,'titulo 6','sub 6','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,6,2,6),
                                                                                                                                                       (7,'titulo 7','sub 7','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,7,3,7),
                                                                                                                                                       (8,'titulo 8','sub 8','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,8,4,8),
                                                                                                                                                       (9,'titulo 9','sub 9','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,9,1,9),
                                                                                                                                                       (10,'titulo 10','sub 10','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','autor',NULL,NULL,NULL,10,2,10);
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
                           `rol` int(11) DEFAULT NULL,
                           `activo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `usuario`, `latitud`, `longitud`, `email`, `rol`, `activo`) VALUES
                                                                                                                           (1, 'user', 'user123', 'user', NULL, NULL, 'user@mail.com', NULL, 1),
                                                                                                                           (2, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', 1, 1),
                                                                                                                           (3, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', 1, 1),
                                                                                                                           (4, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', 1, 1),
                                                                                                                           (5, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', 1, 1),
                                                                                                                           (17, 'Santiago', 'c6f057b86584942e415435ffb1fa93d4', 'Santi12', NULL, NULL, 'santifl27@gmail.com', 2, 1),
                                                                                                                           (18, 'Rodri', 'c6f057b86584942e415435ffb1fa93d4', 'RodriPuto', NULL, NULL, 'monteagudorodrigo@gmail.com', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
    ADD PRIMARY KEY (`id_articulo`),
  ADD KEY `id_edicion` (`id_edicion`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_seccion` (`id_seccion`);

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
-- Indices de la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
    ADD PRIMARY KEY (`id_producto`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

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
    MODIFY `id_articulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
    MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
    MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
    MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seccion`
--
ALTER TABLE `seccion`
    MODIFY `id_seccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
    MODIFY `id_tipo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
    MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
    ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`id_edicion`) REFERENCES `edicion` (`id_edicion`),
  ADD CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
  ADD CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`);

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
-- Filtros para la tabla `suscripcion`
--
ALTER TABLE `suscripcion`
    ADD CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
    ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
