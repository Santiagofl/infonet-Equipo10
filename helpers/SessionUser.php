<?php

class SessionUser{

    public function __construct(){
        session_start();
        Ini_set('cookie.lifetime', 7200);
    }

    public function setCurrentUser($user){
        $_SESSION['usuario'] = $user;
    }

    public function getCurrentUser(){
        return $_SESSION['usuario'] ?? 0;
    }

    public function getRol(){
        return $_SESSION['usuario']['rol'] ?? 0;
    }

    public function getIdUsuario(){
        $sesion = $this->getCurrentUser();
        if($sesion != 0){
            return $sesion['id_usuario'];
        }else{
            return $sesion;
        }
    }

    public function a(){

    }

    public function closeSession(){
        session_unset();
        session_destroy();
    }
}
