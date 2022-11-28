DROP DATABASE IF EXISTS infonet;
create database infonet;
use infonet;

CREATE TABLE `rol` (
                       `id_rol` INT(11) NOT NULL AUTO_INCREMENT,
                       `descripcion` varchar(45) DEFAULT NULL,
                       PRIMARY KEY (`id_rol`)
);

CREATE TABLE `usuario` (
                           `id_usuario` int NOT NULL AUTO_INCREMENT,
                           `nombre` varchar(45) DEFAULT NULL,
                           `password` varchar(45) DEFAULT NULL,
                           `usuario` varchar(45) DEFAULT NULL,
                           `latitud` float DEFAULT NULL,
                           `longitud` float DEFAULT NULL,
                           `email` varchar(45) DEFAULT NULL,
                           `rol` int DEFAULT NULL,
                           `activo` tinyint(1) DEFAULT NULL,
                           PRIMARY KEY (`id_usuario`),
                           KEY `rol` (`rol`),
                           CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`id_rol`)
);

CREATE TABLE `tipo` (
                        `id_tipo_producto` int NOT NULL AUTO_INCREMENT,
                        `descripcion` varchar(45) DEFAULT NULL,
                        PRIMARY KEY (`id_tipo_producto`)
);

CREATE TABLE `producto` (
                            `id_producto` int NOT NULL AUTO_INCREMENT,
                            `nombre` varchar(45) DEFAULT NULL,
                            `imagen` text,
                            `tipo` int DEFAULT NULL,
                            `precio` decimal(10,2) DEFAULT NULL,
                            PRIMARY KEY (`id_producto`),
                            KEY `tipo` (`tipo`),
                            CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id_tipo_producto`)
);

CREATE TABLE `edicion` (
                           `id_edicion` int NOT NULL AUTO_INCREMENT,
                           `fecha` date DEFAULT NULL,
                           `id_producto` int DEFAULT NULL,
                           `evento` varchar(200) DEFAULT NULL,
                           `precio` decimal(10,2) DEFAULT NULL,
                           PRIMARY KEY (`id_edicion`),
                           KEY `id_producto` (`id_producto`),
                           CONSTRAINT `edicion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) on delete cascade
);

CREATE TABLE `seccion` (
                           `id_seccion` int NOT NULL AUTO_INCREMENT,
                           `nombre` varchar(45) DEFAULT NULL,
                           `imagen` varchar(45) DEFAULT NULL,
                           `id_edicion` int DEFAULT NULL,
                           PRIMARY KEY (`id_seccion`),
                           KEY `id_edicion` (`id_edicion`),
                           CONSTRAINT `seccion_ibfk_1` FOREIGN KEY (`id_edicion`) REFERENCES `edicion` (`id_edicion`) on delete cascade
);

CREATE TABLE `estado` (
                          `id_estado` int NOT NULL AUTO_INCREMENT,
                          `descripcion` varchar(45) DEFAULT NULL,
                          PRIMARY KEY (`id_estado`)
);

CREATE TABLE `articulo` (
                            `id_articulo` int NOT NULL AUTO_INCREMENT,
                            `titulo` varchar(200) DEFAULT NULL,
                            `subtitulo` varchar(200) DEFAULT NULL,
                            `texto` varchar(4000) DEFAULT NULL,
                            `autor` varchar(45) DEFAULT NULL,
                            `imagen` varchar(45) DEFAULT NULL,
                            `latitud` float DEFAULT NULL,
                            `longitud` float DEFAULT NULL,
                            `id_edicion` int DEFAULT NULL,
                            `id_estado` int DEFAULT '1',
                            `id_seccion` int DEFAULT NULL,
                            PRIMARY KEY (`id_articulo`),
                            KEY `id_edicion` (`id_edicion`),
                            KEY `id_estado` (`id_estado`),
                            KEY `id_seccion` (`id_seccion`),
                            CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`id_edicion`) REFERENCES `edicion` (`id_edicion`)  on delete cascade,
                            CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado` (`id_estado`),
                            CONSTRAINT `articulo_ibfk_3` FOREIGN KEY (`id_seccion`) REFERENCES `seccion` (`id_seccion`)  on delete cascade
);

CREATE TABLE `compra` (
                          `id_compra` int NOT NULL AUTO_INCREMENT,
                          `usuario` int DEFAULT NULL,
                          `edicion` int DEFAULT NULL,
                          fecha date DEFAULT NULL,
                          PRIMARY KEY (`id_compra`),
                          KEY `usuario` (`usuario`),
                          KEY `edicion` (`edicion`),
                          CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id_usuario`) on delete cascade,
                          CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`edicion`) REFERENCES `edicion` (`id_edicion`) on delete cascade
);
CREATE TABLE `suscripcion` (
                               `id_suscripcion` int NOT NULL AUTO_INCREMENT,
                               `fecha` date DEFAULT NULL,
                               `id_producto` int DEFAULT NULL,
                               `id_usuario` int DEFAULT NULL,
                               `precio` decimal(10,2) DEFAULT NULL,
                               PRIMARY KEY (`id_suscripcion`),
                               KEY `id_producto` (`id_producto`),
                               KEY `id_usuario` (`id_usuario`),
                               CONSTRAINT `suscripcion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) on delete cascade,
                               CONSTRAINT `suscripcion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) on delete cascade
);




-- INSERTS

INSERT INTO `rol` (`id_rol`, `descripcion`) VALUES
(1, 'admin'),
(2, 'lector'),
(3, 'editor');

INSERT INTO `usuario` (`id_usuario`, `nombre`, `password`, `usuario`, `latitud`, `longitud`, `email`, `rol`, `activo`) VALUES
(1, 'user', 'user123', 'user', NULL, NULL, 'user@mail.com', NULL, 1),
(2, 'Ivo', '1234', 'ivo', 100, 100, 'ivo@gmail.com', 1, 1),
(3, 'Santiago', '1234', 'Santi12', NULL, NULL, 'santifl27@gmail.com', 1, 1),
(4, 'Rodrigo', '1234', 'Rodri', NULL, NULL, 'monteagudorodrigo@gmail.com', 2, 1);

INSERT INTO tipo (id_tipo_producto,descripcion) 
VALUES (1,'diario'), (2,'revista');

INSERT INTO producto (nombre, imagen, precio, tipo) VALUES
('Clarín', 'clarin.png', 1050.00, 1),
('La Nación', 'lanacion.png', 999.99, 1),
('Crónica', 'cronica.png', 580.00, 1),
('Hola', 'hola.png', 799.99, 2),
('Olé', 'ole.png', 1100.00, 2),
('Perfil', 'perfil.png', 875.00, 2),
('Pronto', 'pronto.png', 699.99, 2),
('UnLaM', 'unlam.png', 200.00, 2),
('Página 12', 'pagina12.png', 850.00, 1);
                                                
INSERT INTO `edicion` (`id_edicion`, `fecha`, `id_producto`, `evento`, `precio`) VALUES
(1, '2022-11-10', 1, 'Deportes', 250.00),
(2, '2022-11-11', 2, 'Política', 350.00),
(3, '2022-11-12', 3, 'Policial', 450.00),
(4, '2022-11-13', 4, 'Economía', 550.00),
(5, '2022-11-14', 5, 'Sociedad', 650.00),
(6, '2022-11-15', 6, 'Tecnología', 750.00),
(7, '2022-11-16', 7, 'Esports', 860.00),
(8, '2022-11-17', 8, 'Tendencias', 340.00),
(9, '2022-11-18', 9, 'Dolar Hoy', 241.00),
(10, '2022-11-19', 1, 'Educación', 293.00),
(11, '2022-11-20', 2, 'Salud', 880.00),
(12, '2022-11-21', 3, 'Autos', 980.00),
(13, '2022-11-22', 4, 'Turismo', 999.00),
(14, '2022-11-23', 5, 'Negocios', 353.00),
(15, '2022-11-24', 6, 'Sociedad', 262.00),
(16, '2022-11-25', 7, 'Economía', 220.00),
(17, '2022-11-28', 1, 'Salud', 513.00),
(18, '2022-11-29', 2, 'Deportes', 865.00);

INSERT INTO `compra` (`usuario`, `edicion`) VALUES 
(2, 1),
(3, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 4);

INSERT INTO `estado` (`id_estado`, `descripcion`) VALUES
(1, 'En revision'),
(2, 'Publicado');

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
(11, 'Educación', NULL, NULL);

INSERT INTO `articulo` (`titulo`, `subtitulo`, `texto`, `autor`, `imagen`, `latitud`, `longitud`, `id_edicion`, `id_estado`, `id_seccion`) VALUES
('titulo 1', 'sub 1', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 1, 2, 1),
('titulo 2', 'sub 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 2, 2, 2),
('titulo 3', 'sub 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 3, 2, 3),
('titulo 4', 'sub 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 4, 2, 4),
('titulo 5', 'sub 5', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 5, 2, 5),
('titulo 6', 'sub 6', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 6, 2, 6),
('titulo 7', 'sub 7', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 7, 2, 7),
('titulo 8', 'sub 8', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 8, 2, 8),
('titulo 9', 'sub 9', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 9, 2, 9),
('titulo 10', 'sub 10', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 10, 2, 10),
('Título 11', 'Subtitulo 11', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'autor', NULL, NULL, NULL, 11, 2, 11);

select * 
from usuario;

INSERT INTO `suscripcion` (`fecha`, `id_producto`, `id_usuario`) VALUES
('2022-11-08', 2, 2),
('2022-11-08', 3, 2);

INSERT INTO `articulo` (`titulo`, `subtitulo`, `texto`, `autor`, `imagen`, `latitud`, `longitud`, `id_edicion`, `id_estado`, `id_seccion`) VALUES
                                                                                                                                               ('Debate por el presupuesto', 'Sigue el debate en la camara baja por el presupuesto, gritos y acusaciones en el Senado', 'La media sanción que dio la Cámara de Diputados de la Nación al Presupuesto 2023 guarda un dato político que sobresale en medio de la grieta en la que está estancada hace años la dirigencia argentina. Pese al escenario de polarización que exponen el Frente de Todos y Juntos por el Cambio, y a las cruentas internas que conviven en ambas coaliciones, la ley de Presupuesto aprobada este miércoles es la que mayor consenso logró a lo largo de la última década.

Luego de más de 15 horas de debate, el oficialismo logró aprobar el proyecto en general con 180 votos afirmativos, 22 negativos y 48 abstenciones. La Unión Cívica Radical (UCR), Evolución, el Interbloque Federal y Provincias Unidas respaldaron la iniciativa del Poder Ejecutivo; mientras que el PRO y la Izquierda se abstuvieron; y la Coalición Cívica y los libertarios rechazaron la hoja de ruta con la que contará el Gobierno el año próximo..', 'Jose Maria Gimenez', "politica.jpg", NULL, NULL, 1, 2, 1),
                                                                                                                                               ('Bomba de tiempo en el central', 'El gobierno no puede controlar las altas tasas de interes', 'En el último informe efectuado por Equilibra, el centro de análisis económico que lideran Martin Rapetti, Lorenzo Sigaut Gravina y Lorena Giorgio, se destaca la caída del financiamiento bancario al público y empresas en 2022 y la contracara, que es la mayor exposición al sector público.

"Es cada vez menor la porción de los depósitos en pesos que van a préstamos privados: 60% a fines de 2019 y menos del 40% en los últimos meses.

Por el contrario, el financiamiento al sector público es cada vez mayor: el 60% de los depósitos en pesos está volcado a instrumentos del sector público consolidado, contra 34% en 2019" señala Equilibra.

Ese 60% incluye tanto los requerimientos legales como encajes o efectivo mínimo, como letras y bonos suscriptos voluntariamente por las entidades financieras.', 'Martin Di Natalle', "economia.jpg", NULL, NULL, 1, 2, 4),
                                                                                                                                               ('Racing Campeon', 'Rcacing es el mejor equipo de la temporada ganandole a Boca luego de que abandonaran', 'Los momentos que vivi, todo lo que yo deje
Por seguir a la academia, nadie lo puede entender
Yo no se como explicar, que te llevo hasta en la piel
Sos la droga que en las venas me inyectaron al nacer

Se me parte el corazón, cada vez que vos perdes
Me pongo de la cabeza y otra vez te vengo a ver
Muchachos, traigan vino juega la acade
Que esta banda esta de fiesta
Y hoy no podemos perder

Muchachos, traigan vino juega la acade
Me emborrarcho bien borracho
Si el rojo se va a la B
.', 'Aguante la Academia', 'deportes.jpg', NULL, NULL, 1, 2, 7),
                                                                                                                                               ('Baja el romedio de notas en la provincia de Buenos Aires', 'Segun un estudio en la universidad de Di Tella LAS NOTAS CAYERON UN 3% respecto del año anterior', 'Tras dos años de cambios por el cierre de escuelas, en 2022 se retomarán las calificaciones numéricas a la hora de evaluar en las secundarias bonaerenses, pero bajo un esquema distinto. Según supo Infobae, en primaria se volverá a un modelo pre-pandemia con valoraciones conceptuales en los primeros grados y notas en los últimos.

Desde este año habrá una transición hacia los regímenes de evaluación tradicionales, de acuerdo a lo que informaron las autoridades. El esquema en secundaria tendrá algunas particularidades: la calificación numérica recién llegará cuando la materia esté aprobada. En los boletines durante la cursada no habrá notas, sino que se mantendrán las valoraciones conceptuales.

Una vez aprobada la materia, a fin de año la nota podrá oscilar entre 7 y 10. Si un alumno desaprueba la asignatura y debe rendir en diciembre, febrero o dejarla previa, la calificación estará entre el 4 y el 10.

La Dirección General de Cultura y Educación bonaerense distribuyó un documento entre las secundarias explicando cómo será la evaluación. Dispuso cuatro instancias de comunicación con las familias en los dos cuatrimestres:

-Se entregarán Registros Institucionales de Trayectorias Educativas (RITE) a estudiantes y sus padres dos veces al año, uno al cierre del primer cuatrimestre y el otro, al cierre del segundo.', 'autor', 'alumnos.jpg', NULL, NULL, 1, 2, 11),