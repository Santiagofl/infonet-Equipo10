<?php
include_once("helpers/Redirect.php");
include_once('helpers/MySQlDatabase.php');
include_once('helpers/MustacheRenderer.php');
include_once('helpers/Logger.php');
include_once('helpers/Router.php');
include_once('helpers/ValidatorHelper.php');
include_once('helpers/SessionUser.php');
require_once('helpers/Mailer.php');
require_once('helpers/Weather.php');
require_once('vendor/autoload.php');

include_once('model/ProductoModel.php');
include_once('model/EdicionModel.php');
include_once('model/SeccionModel.php');
include_once('model/LoginModel.php');
include_once('model/RegistroModel.php');
include_once('model/ArticuloModel.php');
include_once('model/PagoModel.php');

include_once('controller/homeController.php');
include_once('controller/productoController.php');
include_once('controller/LoginController.php');
include_once('controller/seccionController.php');
include_once('controller/abmController.php');
include_once('controller/RegistroController.php');
include_once('controller/VerificacionController.php');
include_once('controller/articuloController.php');
include_once('controller/edicionController.php');
include_once('controller/pagoController.php');

include_once('dependencies/mustache/src/Mustache/Autoloader.php');

class Configuration
{
    private $database;
    private $view;

    public function __construct()
    {
        $this->database = new MySQlDatabase();
        $this->view = new MustacheRenderer("view/", 'view/partial/', new SessionUser());
    }

    public function getHomeController()
    {
        return new HomeController($this->view);
    }

    public function getAbmController()
    {
        return new AbmController($this->getAllProductosModel(), $this->getAllEdicionesModel(), $this->getAllSeccionesModel(), $this->getAllArticulosModel(), $this->view, new SessionUser());
    }

    public function getProductoController()
    {
        return new ProductoController($this->getAllProductosModel(), $this->view, $this->getWeather(), new SessionUser());
    }

    public function getEdicionController()
    {
        return new EdicionController($this-> getAllEdicionesModel(), $this->getAllProductosModel(), $this->view, new SessionUser());
    }

    public function getVerificacionController()
    {
        return new VerificacionController($this->view);
    }

    public function getSeccionController()
    {
        return new SeccionController($this->getAllSeccionesModel(), $this->getAllEdicionesModel(), $this->view);
    }

    public function getArticuloController()
    {
        return new ArticuloController($this->getAllArticulosModel(), $this->view, new SessionUser());
    }

    public function getRegistroController()
    {
        return new RegistroController($this->getAllRegistroModel(), $this->view, new SessionUser());
    }

    public function getMailer(){
        return new Mailer();
    }

    public function getLoginController()
    {
        return new LoginController($this->getAllLoginModel(), $this->view, new SessionUser());
    }

    public function getRouter()
    {
        return new Router($this, "home", "list");
    }

    private function getAllProductosModel(): ProductoModel
    {
        return new ProductoModel($this->database);
    }

    private function getAllEdicionesModel(): EdicionModel
    {
        return new EdicionModel($this->database);
    }

    private function getAllLoginModel(): LoginModel
    {
        return new LoginModel($this->database);
    }

    private function getAllRegistroModel(): RegistroModel
    {
        return new RegistroModel($this->database, $this->getMailer());
    }

    private function getAllSeccionesModel(): SeccionModel
    {
        return new SeccionModel($this->database);
    }

    private function getAllArticulosModel(): ArticuloModel
    {
        return new ArticuloModel($this->database);
    }

    public function getWeather()
    {
        return new Weather();
    }

    public function getPagoController(){
        return new PagoController($this->getPagoModel(), $this->view, new SessionUser());
    }

    private function getPagoModel(): PagoModel{
        return new PagoModel($this->database);
    }

}