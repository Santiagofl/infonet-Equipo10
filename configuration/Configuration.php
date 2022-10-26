<?php
include_once ("helpers/Redirect.php");
include_once('helpers/MySQlDatabase.php');
include_once('helpers/MustacheRenderer.php');
include_once('helpers/Logger.php');
include_once('helpers/Router.php');

include_once('model/CancionesModel.php');
include_once('model/PresentacionesModel.php');
include_once ("model/QuieroSerParteModel.php");

include_once('controller/PresentacionesController.php');
include_once('controller/CancionesController.php');
include_once('controller/LaBandaController.php');
include_once('controller/QuieroSerParteController.php');

include_once ('dependencies/mustache/src/Mustache/Autoloader.php');

class Configuration {
    private $database;
    private $view;

    public function __construct() {
        $this->database = new MySQlDatabase();
        $this->view = new MustacheRenderer("view/", 'view/partial/');
    }

    public function getPresentacionesController() {
        return new PresentacionesController(
            $this->getPresentacionesModel(),
            $this->view,
            new Logger());
    }

    public function getCancionesController() {
        return new CancionesController($this->createCancionesModel(), $this->view);
    }

    public function getLaBandaController() {
        return new LaBandaController($this->view);
    }

    public function getQuieroserparteController(){
        return new QuieroSerParteController($this->view, $this->getQuieroSerParteModel());
    }

    private function createCancionesModel(): CancionesModel {
        return new CancionesModel($this->database);
    }

    private function getPresentacionesModel(): PresentacionesModel {
        return new PresentacionesModel($this->database);
    }

    public function getRouter() {
        return new Router($this, "laBanda", "list");
    }

    private function getQuieroSerParteModel() {
        return new QuieroSerParteModel($this->database);
    }
}