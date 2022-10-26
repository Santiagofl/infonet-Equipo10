<?php

class CancionesModel {
    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function getCanciones() {
        $sql = 'SELECT * FROM canciones';
        return $this->database->query($sql);
    }
}