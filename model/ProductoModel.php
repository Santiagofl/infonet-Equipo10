<?php

class ProductoModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getProductos()
    {
        $sql = 'SELECT p.id_producto, p.nombre, p.imagen, t.descripcion
                FROM producto p JOIN tipo t ON p.tipo=t.id_tipo_producto';
        return $this->database->query($sql);
    }

    public function getProducto($id)
    {
        $sql = "SELECT p.id_producto, p.nombre, p.imagen, t.descripcion
                FROM producto p JOIN tipo t ON p.tipo=t.id_tipo_producto
                WHERE p.id_producto=" . $id;
        return $this->database->query($sql);
    }

    public function getEdicionesDeCadaProducto($id, $idUsuario)
    {

        $sql = 'SELECT e.id_edicion as id_edicion, e.fecha, p.nombre as producto, p.imagen, c.usuario as comprado
                FROM edicion e JOIN producto p ON e.id_producto=p.id_producto
                LEFT JOIN (select * from compra as c where usuario = '.$idUsuario.') AS c on e.id_edicion = c.edicion 
                WHERE p.id_producto= '.$id;

        return $this->database->query($sql);
    }

    public function setProducto($nombre, $imagen, $tipo)
    {
        $sql = "INSERT INTO producto
                (`nombre`, `imagen`, `tipo`) 
                VALUES ('$nombre', '$imagen', $tipo)";
        $this->database->execute($sql);
    }

    public function deleteProducto($id)
    {
        $sql = "DELETE FROM producto WHERE producto.id_producto=" . $id;
        $this->database->execute($sql);
    }

}