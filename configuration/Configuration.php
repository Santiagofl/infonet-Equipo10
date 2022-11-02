<?php
include_once ("helpers/Redirect.php");
include_once('helpers/MySQlDatabase.php');
include_once('helpers/MustacheRenderer.php');
include_once('helpers/Logger.php');
include_once('helpers/Router.php');
include_once('helpers/ValidatorHelper.php');
include_once('helpers/SessionUser.php');

include_once('model/ProductoModel.php');
include_once ('model/LoginModel.php');

include_once('controller/homeController.php');
include_once('controller/productoController.php');
include_once('controller/LoginController.php');
include_once('controller/RegistroController.php');

include_once ('dependencies/mustache/src/Mustache/Autoloader.php');

class Configuration {
    private $database;
    private $view;

    public function __construct() {
        $this->database = new MySQlDatabase();
        $this->view = new MustacheRenderer("view/", 'view/partial/');
    }

    public function getHomeController() {
        return new HomeController($this->view, new SessionUser());
    }

    public function getProductoController() {
        return new ProductoController($this->getAllProductosModel(), $this->view, new SessionUser());
    }
    public function getLoginController(){
        return new LoginController($this->getAllLoginModel(), $this->view, new SessionUser());
    }

    public function getRouter() {
        return new Router($this, "home", "list");
    }

    private function getAllProductosModel(): ProductoModel {
        return new ProductoModel($this->database);
    }

    private function getAllLoginModel(): LoginModel {
        return new LoginModel($this->database);
    }




}