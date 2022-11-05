create database infonet;
use infonet;

-- rol
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL PRIMARY KEY auto_increment,
  `descripcion` varchar(45) DEFAULT NULL
);

-- usuario
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL PRIMARY KEY auto_increment,
  `nombre` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
   FOREIGN KEY (rol)
  REFERENCES rol(id_rol)
);

select *
from usuario;

CREATE TABLE `subscripcion` (
  `id_subscripcion` int(11) NOT NULL PRIMARY KEY auto_increment,
  `usuario` int(11) DEFAULT NULL,
  `producto` int(11) DEFAULT NULL,
  `edicion` int(11) DEFAULT NULL,
  foreign key (usuario) references usuario(id_usuario),
  foreign key (producto) references producto(id_producto),
  foreign key (edicion) references edicion(id_edicion)
);

-- tipo
CREATE TABLE `tipo` (
  `id_tipo_producto` int(11) NOT NULL PRIMARY KEY auto_increment ,
  `descripcion` varchar(45) DEFAULT NULL
);

-- producto
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL PRIMARY KEY auto_increment,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `tipo` int(11),
  FOREIGN KEY (tipo)
  REFERENCES tipo(id_tipo_producto)
);

-- edicion
CREATE TABLE `edicion` (
  `id_edicion` int(11) NOT NULL PRIMARY KEY auto_increment ,
  `fecha` date DEFAULT NULL,
  `id_producto` int(11),
  FOREIGN KEY (id_producto)
  REFERENCES producto(id_producto)
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

-- seccion
CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL PRIMARY KEY auto_increment ,
  `nombre` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `id_edicion` int(11),
  FOREIGN KEY (id_edicion)
  REFERENCES edicion(id_edicion)
);


-- articulos
CREATE TABLE `articulo` (
  `id_articulo` int(11) NOT NULL PRIMARY KEY auto_increment ,
  `titulo` varchar(200) DEFAULT NULL,
  `subtitulo` varchar(200) DEFAULT NULL,
  `texto` varchar(4000) DEFAULT NULL,
  `autor` varchar(45) DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `latitud` float DEFAULT NULL,
  `longitud` float DEFAULT NULL,
  `id_edicion` int(11),
  `id_estado` int(11) ,
  FOREIGN KEY (id_edicion)
  REFERENCES edicion(id_edicion),
  FOREIGN KEY (id_estado)
  REFERENCES estado(id_estado)
);

-- estado
CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL PRIMARY KEY auto_increment ,
  `descripcion` varchar(45) DEFAULT NULL
);

INSERT INTO `producto` (`nombre`, `imagen`) VALUES
('Clarin', 'clarin.png'),
('La Nacion', 'lanacion.png'),
('Cronica', 'cronica.png'),
('Hola', 'hola.png'),
('Olé', 'ole.png'),
('Perfil', 'perfil.png'),
('Pronto', 'pronto.png'),
('Unlam', 'unlam.png'),
('Página 12', 'pagina12.png');
