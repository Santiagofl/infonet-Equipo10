DROP DATABASE IF EXISTS infonet;
create database infonet;
use infonet;

-- rol

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

-- estado
CREATE TABLE estado (
                        id_estado INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        descripcion VARCHAR(45) DEFAULT NULL
);



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


CREATE TABLE compra (
                        id_compra INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
                        usuario INT(11) DEFAULT NULL,
                        edicion INT(11) DEFAULT NULL,
                        FOREIGN KEY (usuario)
                            REFERENCES usuario (id_usuario),
                        FOREIGN KEY (edicion)
                            REFERENCES edicion (id_edicion)
);


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

INSERT INTO `rol` (`id_rol`, `descripcion`) VALUES
                                                (1, 'admin'),
                                                (2, 'lector'),
                                                (3, 'editor');



INSERT INTO `usuario` (`id_usuario`, `nombre`,`activo` ,  `password`, `usuario`, `latitud`, `longitud`, `email`,  `rol`) VALUES

    (1,  'roro',1, '202cb962ac59075b964b07152d234b70', 'roro', 100, 100, 'monteagudorodrigo@gmail.com', 1);



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

insert into suscripcion(id_suscripcion,fecha ,id_producto, id_usuario) values
    (1,'2022-11-08',1,1);



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
