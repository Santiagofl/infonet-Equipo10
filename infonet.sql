DROP DATABASE IF EXISTS infonet;
create database infonet;
use infonet;

-- rol

CREATE TABLE rol
(
    id_rol      INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(45) DEFAULT NULL
);

-- usuario
CREATE TABLE usuario
(
    id_usuario       INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre           VARCHAR(45) DEFAULT NULL,
    password         VARCHAR(45) DEFAULT NULL,
    usuario          VARCHAR(45) DEFAULT NULL,
    latitud          FLOAT       DEFAULT NULL,
    longitud         FLOAT       DEFAULT NULL,
    email            VARCHAR(45) DEFAULT NULL,
    fecha_nacimiento VARCHAR(45) DEFAULT NULL,
    rol              INT(11)     DEFAULT NULL,
    FOREIGN KEY (rol)
        REFERENCES rol (id_rol)
);


-- tipo
CREATE TABLE tipo
(
    id_tipo_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion      VARCHAR(45) DEFAULT NULL
);

-- producto
CREATE TABLE producto
(
    id_producto INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre      VARCHAR(45) DEFAULT NULL,
    imagen      VARCHAR(45) DEFAULT NULL,
    precio      DECIMAL(10, 2),
    tipo        INT(11),
    FOREIGN KEY (tipo)
        REFERENCES tipo (id_tipo_producto)
);

-- edicion
CREATE TABLE edicion
(
    id_edicion  INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha       DATE DEFAULT NULL,
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

CREATE TABLE seccion
(
    id_seccion INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre     VARCHAR(45) DEFAULT NULL,
    imagen     VARCHAR(45) DEFAULT NULL,
    id_edicion INT(11),
    FOREIGN KEY (id_edicion)
        REFERENCES edicion (id_edicion)
);

-- estado
CREATE TABLE estado
(
    id_estado   INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(45) DEFAULT NULL
);


-- articulos
CREATE TABLE articulo
(
    id_articulo INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo      VARCHAR(200)  DEFAULT NULL,
    subtitulo   VARCHAR(200)  DEFAULT NULL,
    texto       VARCHAR(4000) DEFAULT NULL,
    autor       VARCHAR(45)   DEFAULT NULL,
    imagen      VARCHAR(45)   DEFAULT NULL,
    latitud     FLOAT         DEFAULT NULL,
    longitud    FLOAT         DEFAULT NULL,
    id_edicion  INT(11),
    id_estado   INT(11),
    FOREIGN KEY (id_edicion)
        REFERENCES edicion (id_edicion),
    FOREIGN KEY (id_estado)
        REFERENCES estado (id_estado)
);


CREATE TABLE compra
(
    id_compra INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    usuario   INT(11) DEFAULT NULL,
    edicion   INT(11) DEFAULT NULL,
    FOREIGN KEY (usuario)
        REFERENCES usuario (id_usuario),
    FOREIGN KEY (edicion)
        REFERENCES edicion (id_edicion)
);


CREATE TABLE suscripcion
(
    fecha       DATE,
    id_producto INT(11),
    id_usuario  INT(11),
    FOREIGN KEY (id_producto)
        REFERENCES producto (id_producto),
    FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario),
    CONSTRAINT suscripcion_usuario_pk PRIMARY KEY (id_producto, id_usuario)
);



INSERT INTO tipo (id_tipo_producto, descripcion)
VALUES (1, 'diario'),
       (2, 'revista');

INSERT INTO producto (nombre, imagen, precio, tipo)
VALUES ('Clarin', 'clarin.png', 1050.00, 1),
       ('La Nacion', 'lanacion.png', 999.99, 1),
       ('Cronica', 'cronica.png', 580.00, 1),
       ('Hola', 'hola.png', 799.99, 2),
       ('Olé', 'ole.png', 1100.00, 2),
       ('Perfil', 'perfil.png', 875.00, 2),
       ('Pronto', 'pronto.png', 699.99, 2),
       ('Unlam', 'unlam.png', 200.00, 2),
       ('Página 12', 'pagina12.png', 850.00, 1);

INSERT INTO edicion (id_edicion, fecha, id_producto)
VALUES (1, '2022-11-10', 1),
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
       (16, '2022-11-25', 7);

INSERT INTO `rol` (`id_rol`, `descripcion`)
VALUES (1, 'admin');


INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `usuario`, `latitud`, `longitud`, `email`,
                       `fecha_nacimiento`, `rol`)
VALUES (1, 'user', 'user123', 'user', NULL, NULL, 'user@mail.com', NULL, NULL),
       (2, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', '2022-10-10', 1),
       (3, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', '2022-10-10', 1),
       (4, 'ivo', '000', 'ivo', 100, 100, 'ivo@gmail.com', '2022-10-10', 1),
       (5, 'lucas', '000', 'lucas', 100, 100, 'lucas@gmail.com', '2022-10-10', 1);


INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (1, 'Política', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (2, 'Economía', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (3, 'Internacional', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (4, 'Nacional', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (5, 'Sociedad', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (6, 'Cultura', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (7, 'Deportes', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (8, 'Tendencias', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (9, 'Moda', NULL, NULL);
INSERT INTO `seccion` (`id_seccion`, `nombre`, `imagen`, `id_edicion`)
VALUES (10, 'Arte', NULL, NULL);

INSERT INTO `compra` (`id_compra`, `usuario`, `edicion`)
VALUES (3, 2, 1),
       (4, 3, 1),
       (5, 2, 2),
       (6, 2, 3),
       (7, 2, 5),
       (8, 2, 4);

INSERT INTO `estado` (`id_estado`, `descripcion`)
VALUES (1, 'Borrador'),
       (2, 'Publicar'),
       (3, 'Publicado'),
       (4, 'Baja');



insert into suscripcion(fecha, id_producto, id_usuario)
values ('2022-11-01', 1, 1),
       ('2022-11-08', 2, 2);
