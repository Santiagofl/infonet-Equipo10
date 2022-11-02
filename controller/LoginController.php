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
            $usuario = $_POST["usuario"];
            $password = $_POST["password"];
            $obj = $this->loginModel->iniciarSesion($usuario,$password);

            if(!empty($obj)){

                $this->session->setCurrentUser($obj);
                header("Location: /infonet/producto");

            }else{
                $this->notRegistered();
            }

    }

    public function notRegistered(){
        $data['message'] = "Usuario o clave incorrecta";
        $this->list($data);
    }


    public function logout(){
        $this->session->closeSession();
        header("Location: /infonet/login");
    }
}