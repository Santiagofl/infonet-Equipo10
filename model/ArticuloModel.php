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
        $sql = "SELECT * FROM articulo;";
        return $this->database->query($sql);
    }

    public function getEstadosDeArticulos()
    {
        $sql = "SELECT * FROM estado";
        return $this->database->query($sql);
    }

    public function getArticulosPorEdicionAJax($idEdicion)
    {
        $sql = "SELECT a.id_articulo, a.titulo, a.subtitulo, a.texto,
                a.autor, a.imagen AS imagenArticulo,
                a.id_estado, a.id_seccion, a.id_edicion,
                e.fecha, e.id_producto, e.evento, s.nombre AS nombreSeccion,
                p.nombre AS nombreProducto,
                es.descripcion AS descripcionEstado
                FROM articulo a JOIN edicion e
                ON a.id_edicion=e.id_edicion LEFT JOIN
                seccion s ON s.id_edicion =e.id_edicion 
                JOIN producto p ON e.id_producto=p.id_producto
                LEFT JOIN estado es ON es.id_estado=a.id_estado
                where a.id_edicion=" . $idEdicion;
        $format = $this->database->query($sql);
        return print json_encode($format, JSON_UNESCAPED_UNICODE);
    }
}