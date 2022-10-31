<?php

class ProductoModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getProductos() {
        $sql = 'SELECT p.id_producto, p.nombre, p.imagen, t.descripcion
        FROM 
        producto p JOIN tipo t ON p.tipo=t.id_tipo_producto';
        return $this->database->query($sql);
    }

    public function getProducto($id){
        $sql = "SELECT p.id_producto, p.nombre, p.imagen, t.descripcion
        FROM 
        producto p JOIN tipo t ON p.tipo=t.id_tipo_producto
        WHERE p.id_producto=" . $id;
        return $this->database->query($sql);
    }
}