<?php

class VerificacionController{

    private $view;
    private $session;

    public function __construct($view, $session){
        $this->view = $view;
        $this->session = $session;
    }

    public function list($data = []){
        $this->view->render('verificacionView.mustache',$data);
    }

}