<?php

class LoginController{
    private $view;
    private $loginModel;
    private $session;

    public function __construct($loginModel, $view, $session){
        $this->loginModel = $loginModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list($data = []){
        $this->view->render('loginView.mustache',$data);
    }

    public function validarSesion(){
        if(ValidatorHelper::validarSeteadoYNoVacio($_POST["usuario"]) &&
            ValidatorHelper::validarSeteadoYNoVacio($_POST["password"])) {
            $usuario = $_POST["usuario"];
            $password = $_POST["password"];
            $obj = $this->loginModel->iniciarSesion($usuario, $password);

            if (!empty($obj)) {

                $this->session->setCurrentUser($obj);
                header("Location: /infonet/producto");
                exit();
            } else {
                $this->notRegistered();
            }
        }else{
            $this->incorrectFormat();
        }
    }

    public function incorrectFormat(){
        $data['validador'] = true;
        $this->view->render('loginView.mustache',$data);
    }

    public function notRegistered(){
        $data['confirmed'] = true;
        $this->list($data);
    }


    public function logout(){
        $this->session->closeSession();
        header("Location: /infonet/login");
        exit();
    }
}