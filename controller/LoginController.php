<?php

class LoginController{
    private $view;

    public function __construct($view){
        $this->view = $view;
    }

    public function list(){
        $this->view->render('loginView.mustache');
    }

    /*
     private $logInModel;
        private $printer;

        public function __construct($logInModel,$printer){
            $this->logInModel = $logInModel;
            $this->printer = $printer;
        }

        public function execute($data = []){

                $menu ="<a href='/registro'>Registrarse</a>
                <a href='/logIn'>Ingresar</a>";

              $data["menu"] = $menu;
              $this->printer->generateView("loginView.html",$data);
        }

        public function registrado(){
            $title = "Registro exitoso!";

        }

        public function validarSesion(){
            if(ValidatorHelper::validarSeteadoYNoVacio($_POST["usuario"]) &&
               ValidatorHelper::validarSeteadoYNoVacio($_POST["password"])){
                $usuario = $_POST["usuario"];
                $password = $_POST["password"];
                $obj = $this->logInModel->iniciarSesion($usuario,$password);

                        session_start();

                        $_SESSION["logueado"]=1;
                        $_SESSION["usuario"]=$_POST["usuario"];
                        $_SESSION["user"]=$obj['user'];
                        $_SESSION["id"]=$obj['id'];
                        $_SESSION["tipoUser"]=$obj['tipoUsuario'];

                header("Location: /login");
            }


        }


        public function notRegistered(){
            $email=$_GET["email"];
            $title = "Usuario o clave incorrecta";
            $message = "<p>intente nuevamente</p> </br> <a class='recovery' href='/login/recuperar/email=$email&dni=1'>Olvidé mi clave</a><a class='recovery' href='/registro'>Aún no estoy registrado</a>";
            $display = "d-block";
            $data = ["popUp" => true,"title"=> $title,"message"=>$message,"display"=>$display];
            $this->execute($data);
        }

        public function exit(){
            session_unset();
            session_destroy();
            header("Location: /login");
        }

    }
     */
}