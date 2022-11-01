<?php
include_once ("helpers/Redirect.php");
include_once('helpers/MySQlDatabase.php');
include_once('helpers/MustacheRenderer.php');
include_once('helpers/Logger.php');
include_once('helpers/Router.php');

include_once('model/ProductoModel.php');
include_once('model/EdicionModel.php');

include_once('controller/homeController.php');
include_once('controller/productoController.php');
include_once('controller/LoginController.php');
include_once('controller/edicionController.php');
include_once('controller/abmController.php');

include_once ('dependencies/mustache/src/Mustache/Autoloader.php');

class Configuration {
    private $database;
    private $view;

    public function __construct() {
        $this->database = new MySQlDatabase();
        $this->view = new MustacheRenderer("view/", 'view/partial/');
    }

    public function getHomeController() {
        return new HomeController($this->view);
    }

    public function getAbmController() {
        return new AbmController($this->getAllProductosModel(), $this->getAllEdicionesModel(),$this->view);
    }

    public function getProductoController() {
        return new ProductoController($this->getAllProductosModel(), $this->view);
    }

    public function getEdicionController() {
        return new EdicionController($this->getAllEdicionesModel(), $this->view);
    }

    public function getLoginController(){
        return new LoginController($this->view);
    }

    public function getRouter() {
        return new Router($this, "home", "list");
    }

    private function getAllProductosModel(): ProductoModel {
        return new ProductoModel($this->database);
    }

    private function getAllEdicionesModel(): EdicionModel {
        return new EdicionModel($this->database);
    }


}