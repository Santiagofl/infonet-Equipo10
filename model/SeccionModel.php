<?php

class SeccionModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getSecciones()
    {
        $sql = 'SELECT * FROM seccion';
        return $this->database->query($sql);
    }

    public function setSeccion($nombre)
    {
        $sql = "INSERT INTO seccion (`nombre`) VALUES ('$nombre');";
        $this->database->execute($sql);
    }

}