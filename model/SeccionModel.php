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
        $sql = 'SELECT * FROM seccion s JOIN edicion e ON s.id_edicion=e.id_edicion;';
        return $this->database->query($sql);
    }

    public function setSeccion($nombre)
    {
        $sql = "INSERT INTO seccion (`nombre`) VALUES ('$nombre');";
        $this->database->execute($sql);
    }

    public function getSeccionesPorEdicionAJax($id)
    {
        $sql = "SELECT * FROM seccion s JOIN edicion e
                ON s.id_edicion=e.id_edicion
                WHERE e.id_edicion=" . $id;
        $format = $this->database->query($sql);
//        print_r($format) para debuguear;
        return print json_encode($format, JSON_UNESCAPED_UNICODE);
    }

}