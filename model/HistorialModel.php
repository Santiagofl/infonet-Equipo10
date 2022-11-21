<?php

class HistorialModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getEdiciones($idUsuario, $desde, $hasta)
    {
        $sql = "";
        if($desde != "" && $hasta != "") {

        $sql = 'select ec.id_edicion, ec.fecha, ec.nombre, ec.imagen from (
                         select e.id_edicion, e.fecha, p.nombre, p.imagen 
                          from suscripcion s
                           join producto p on s.id_producto = p.id_producto
                            join edicion e on p.id_producto = e.id_producto 
                             join usuario u on s.id_usuario = u.id_usuario
                              where u.id_usuario = 2 
                               UNION 
                                SELECT e.id_edicion, e.fecha, p.nombre, p.imagen
                                 FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
                                  JOIN compra c on e.id_edicion = c.edicion
                                   where usuario = 2 
                                    ORDER BY nombre) as ec where ec.fecha >= "'.$desde.'" and ec.fecha <= "'.$hasta. '"  ORDER BY fecha';


        } else if ($desde != "" && $hasta == ""){
            $sql = 'select ec.id_edicion, ec.fecha, ec.nombre, ec.imagen from (
                         select e.id_edicion, e.fecha, p.nombre, p.imagen 
                          from suscripcion s
                           join producto p on s.id_producto = p.id_producto
                            join edicion e on p.id_producto = e.id_producto 
                             join usuario u on s.id_usuario = u.id_usuario
                              where u.id_usuario = 2 
                               UNION 
                                SELECT e.id_edicion, e.fecha, p.nombre, p.imagen
                                 FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
                                  JOIN compra c on e.id_edicion = c.edicion
                                   where usuario = 2 
                                    ORDER BY nombre) as ec where ec.fecha >= "'.$desde.'"  ORDER BY fecha';

        } else if ($desde == "" && $hasta != ""){
            $sql = 'select ec.id_edicion, ec.fecha, ec.nombre, ec.imagen from (
                         select e.id_edicion, e.fecha, p.nombre, p.imagen 
                          from suscripcion s
                           join producto p on s.id_producto = p.id_producto
                            join edicion e on p.id_producto = e.id_producto 
                             join usuario u on s.id_usuario = u.id_usuario
                              where u.id_usuario = 2 
                               UNION 
                                SELECT e.id_edicion, e.fecha, p.nombre, p.imagen
                                 FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
                                  JOIN compra c on e.id_edicion = c.edicion
                                   where usuario = 2 
                                    ORDER BY nombre) as ec where ec.fecha <= "'.$hasta.'"  ORDER BY fecha';
        }else {
            $sql = 'select * from (select e.id_edicion, e.fecha, p.nombre, p.imagen 
                     from suscripcion s
                      join producto p on s.id_producto = p.id_producto
                       join edicion e on p.id_producto = e.id_producto 
                        join usuario u on s.id_usuario = u.id_usuario
                         where u.id_usuario = 2 
                          UNION 
                           SELECT e.id_edicion, e.fecha, p.nombre, p.imagen
                            FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
                             JOIN compra c on e.id_edicion = c.edicion
                              where usuario = 2
                               ORDER BY nombre) as misEdiciones ORDER BY fecha';

        }
            return $this->database->query($sql);


    }
}