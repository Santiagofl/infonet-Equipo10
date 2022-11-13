<?php

class SessionUser{

    public function __construct(){
        session_start();
        //Ini_set('cookie.lifetime', 7200);
    }

    public function setCurrentUser($user){
        $_SESSION['usuario'] = $user;
    }

    public function getCurrentUser(){
        return $_SESSION['usuario'] ?? '';
    }

    public function closeSession(){
        session_unset();
        session_destroy();
    }
}
