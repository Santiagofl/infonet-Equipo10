<?php

class ArticuloModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getArticulos()
    {
        $sql = '';

        return $this->database->query($sql);
    }

    public function getEstadosDeArticulos()
    {
        $sql = "SELECT * FROM estado";
        return $this->database->query($sql);
    }
}