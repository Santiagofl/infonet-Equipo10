<?php

class UsuarioModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function getUsuarios(){
        $sql ="SELECT * FROM usuario";
        return $this->database->query($sql);
    }

    public function setUsuarios($id_usuario,$rol){
        $sql = "UPDATE usuario
        SET rol = '$rol',
            activo = 1 ,
            WHERE id_usuario = '$id_usuario'";

        $this->database->execute($sql);
    }

    public function getRoles(){
        $sql ="SELECT * FROM rol";
        return $this->database->query($sql);
    }

}