<?php

class PresentacionesModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getPresentaciones() {
        $sql = 'SELECT * FROM presentaciones';
        return $this->database->query($sql);
    }

    public function alta($nombre,  $precio, $fecha){
        $sql = "INSERT INTO presentaciones(`nombre`, `fecha`, `precio`) 
                VALUES ('$nombre', '$fecha',$precio)";
        $this->database->execute($sql);
    }
}