<?php

class EdicionModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getEdiciones($idUsuario)
    {
        $sql = 'SELECT e.id_edicion, e.fecha, p.nombre, p.imagen
        FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
        
        ORDER BY p.nombre';

        $sql = 'SELECT e.id_edicion, e.fecha, p.nombre, p.imagen, c.usuario as comprado
        FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
        LEFT JOIN (select * from compra as c where usuario = '.$idUsuario.') AS c on e.id_edicion = c.edicion 
        ORDER BY p.nombre';

        return $this->database->query($sql);
    }

    // public function getProducto($id){
    //     $sql = "SELECT p.id_producto, p.nombre, p.imagen, t.descripcion
    //     FROM 
    //     producto p JOIN tipo t ON p.tipo=t.id_tipo_producto
    //     WHERE p.id_producto=" . $id;
    //     return $this->database->query($sql);
    // }
}