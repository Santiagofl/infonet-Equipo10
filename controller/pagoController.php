<?php

class pagoController{

    private $pagoModel;
    private $edicionModel;
    private $view;
    private $session;

    public function __construct($pagoModel, $edicionModel, $view, $session){
        $this->pagoModel = $pagoModel;
        $this->edicionModel = $edicionModel;
        $this->session = $session;
        $this->view = $view;
    }

    public function comprarEdicion(){

        $user = $_GET["usuario"];
        $edicion = $_GET["edicion"];

        $data['ediciones'] = $this->pagoModel->setCompra($user, $edicion);

        $producto['producto'] = $this->edicionModel->getEdicionById($edicion);

        require 'vendor/autoload.php';

        MercadoPago\SDK::setAccessToken('TEST-5322929221556591-110901-5614eabea6ba44256133cc0858a47ebb-328479679');

        $preference = new MercadoPago\Preference();

        $item = new MercadoPago\Item();

        $item->title = $producto['producto'][0]['evento'];
        $item->quantity = 1;
        $item->unit_price = $producto['producto'][0]['precio'];
        $item->currency_id = "ARS";

        $preference->items = array($item);

        $preference->back_urls = array(
            "success" => "http://localhost/infonet/pagoConfirmado",
            "failure" => "http://localhost/infonet/pagoFallido",
        );

        $preference->auto_return = "approved";
        $preference->binary_mode = true;

        $preference->save();

        $data['preferencias'] = $preference;

        $this->view->render('comprarEdicionView.mustache', $data);
    }

    public function pagoConfirmado($data = []){

        $this->view->render('confirmadoView.mustache', $data);
    }

    public function pagoFallido($data = []){

        $this->view->render('fallidoView.mustache', $data);
    }



}