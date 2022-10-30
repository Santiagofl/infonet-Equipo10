<?php

class ProductoModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getProductos() {
        $sql = 'SELECT * FROM producto';
        return $this->database->query($sql);
    }
}