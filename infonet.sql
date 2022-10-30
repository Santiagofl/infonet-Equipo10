create
database infonet;
use
infonet;

CREATE TABLE `producto`
(
    `idProducto` int(11) NOT NULL PRIMARY KEY auto_increment,
    `nombre`     varchar(45) DEFAULT NULL,
    `imagen`     varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- drop table producto;

INSERT INTO `producto` (`nombre`, `imagen`)
VALUES ('Clarin', 'clarin.png'),
       ('La Nacion', 'lanacion.png'),
       ('Cronica', 'cronica.png'),
       ('Hola', 'hola.png'),
       ('Olé', 'ole.png'),
       ('Perfil', 'perfil.png'),
       ('Pronto', 'pronto.png'),
       ('Unlam', 'unlam.png'),
       ('Página 12', 'pagina12.png');