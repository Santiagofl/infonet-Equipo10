<?php

class LoginModel{

    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function iniciarSesion($usuario,$password){
        $sql = "SELECT u.id_usuario, u.nombre, u.password, u.usuario, u.latitud, 
       u.longitud, u.email, u.fecha_nacimiento, u.rol
        FROM 
        usuario u WHERE u.usuario  ='$usuario' AND u.password= '$password'";
        return $this->database->queryResult($sql);
    }

}