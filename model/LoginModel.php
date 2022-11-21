<?php

class LoginModel{

    private $database;

    public function __construct($database) {
        $this->database = $database;
    }

    public function iniciarSesion($usuario,$password){
        $passwordMd5 = md5($password);
        var_dump($passwordMd5);
        $sql = "SELECT u.id_usuario, u.nombre, u.password, u.usuario, u.latitud, 
       u.longitud, u.email, u.activo, u.rol
        FROM 
        usuario u WHERE u.usuario  ='$usuario' AND u.password= '$passwordMd5'";
        var_dump($sql);
        return $this->database->queryResult($sql);
    }

    public function activarCuenta($user){
        $sql = "UPDATE usuario SET activo = 1 WHERE usuario = '$user'";
        $this->database->execute($sql);
    }

}