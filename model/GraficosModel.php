<?php

class GraficosModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getCantidades($desde, $hasta)
    {
        $sql = "select count(id_suscripcion) as cantidad from suscripcion ";

        if ($desde != "" && $hasta != "") {
            $sql .= " where fecha>'" . $desde . "' and fecha<'" . $hasta . "'";
        } else if ($desde != "" && $hasta == "") {
            $sql .= " where fecha>'" . $desde . "'";
        } else if ($desde == "" && $hasta != "") {
            $sql .= " where fecha<'" . $hasta . "'";
        } else {

        }

        $sql .= "group by fecha";
        return $this->database->query($sql);
    }

    public function getFechas($desde, $hasta)
    {
        $sql = "select fecha from suscripcion ";

        if ($desde != "" && $hasta != "") {
            $sql .= " where fecha>'" . $desde . "' and fecha<'" . $hasta . "'";
        } else if ($desde != "" && $hasta == "") {
            $sql .= " where fecha>'" . $desde . "'";
        } else if ($desde == "" && $hasta != "") {
            $sql .= " where fecha<'" . $hasta . "'";
        } else {

        }

        $sql .= " group by fecha";
        var_dump($sql);
        return $this->database->query($sql);
    }
}