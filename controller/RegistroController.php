<?php
    class RegistroController{
        private $registroModel;
        private $view;
        private $session;

        public function __construct($registroModel,$view, $session){
            $this->registroModel = $registroModel;
            $this->view = $view;
            $this->session = $session;
        }

        public function list($data = []){
            $this->view->render('registroView.mustache',$data);
        }

        public function registrarUsuario(){

                $name = $_POST["nombre"];
                $user = $_POST["usuario"];
                $pass = $_POST["clave"];
                $email = $_POST["email"];
                $fnacimiento = $_POST["fnacimiento"];
                $rol = $_POST["rol"];

                $status = $this->registroModel->registrar($name,$user,$pass,$email,$fnacimiento,$rol);

                if($status == "registrado"){
                    header("Location:/infonet/verificacion");
                    exit();
                }else{
                    $this->duplicate();
                }
        }

        public function validarRegistro(){
            $email = $_GET['email'];
            $hash = $_GET['hash'];
            $this->registroModel->validarRegistro($email,$hash);
        }

        public function duplicate(){
            $data['title'] = "Usuario o email ya registrados";
            $this->list($data);
        }


    }
