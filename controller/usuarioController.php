<?php

class usuarioController
{
    private $view;
    private $session;
    private $usuarioModel;

    public function __construct($usuarioModel, $view, $session)
    {
        $this->usuarioModel = $usuarioModel;
        $this->view = $view;
        $this->session = $session;

    }

    public function list(){

        if ($this->session->getRol() == 1) {

            $this->view->render('usuariosView.mustache');
        } else {
            Redirect::doIt("/infonet/producto");
        }
    }

    public function altaUsuario(){
        if ($this->session->getRol() == 1) {
            $data["roles"] = $this->usuarioModel->getRoles();
            $this->view->render('alta-usuarioView.mustache',$data);
        } else {
            Redirect::doIt("/infonet/producto");
        }
    }

    public function darAltaUsuario(){
        if(ValidatorHelper::validarSeteadoYNoVacio($_POST["nombre"])&&
            ValidatorHelper::validarSeteadoYNoVacio($_POST["usuario"])&&
            ValidatorHelper::validarSeteadoYNoVacio($_POST["clave"])&&
            ValidatorHelper::validarSeteadoYNoVacio($_POST["email"])&&
            ValidatorHelper::validarSeteadoYNoVacio($_POST["rol"])) {

            $name = $_POST["nombre"];
            $user = $_POST["usuario"];
            $pass = $_POST["clave"];
            $email = $_POST["email"];
            $rol = $_POST["rol"];
            $activo = 1;

            $status = $this->registroModel->registrar($name,$user,$pass,$email,$rol);

            if($status == "existente"){
                $this->duplicate();
            }else{
                Redirect::doIt("/infonet/verificacion");
            }

        }else{
            $this->incorrectFormat();
        }

    }

    public function listaUsuarios(){
        if ($this->session->getRol() == 1) {
            $data["usuarios"] = $this->usuarioModel->getUsuarios();
            $data["roles"] = $this->usuarioModel->getRoles();
            $this->view->render('lista-usuariosView.mustache',$data);
        } else {
            Redirect::doIt("/infonet/producto");
        }

    }




}
