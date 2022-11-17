<?php

class pagoController{

    private $pagoModel;
    private $view;
    private $session;

    public function __construct($pagoModel, $view, $session){
        $this->pagoModel = $pagoModel;
        $this->session = $session;
        $this->view = $view;
    }

    public function comprarEdicion(){

        $user = $_GET["usuario"];
        $edicion = $_GET["edicion"];

        require 'vendor/autoload.php';

        MercadoPago\SDK::setAccessToken('TEST-5322929221556591-110901-5614eabea6ba44256133cc0858a47ebb-328479679');

        $preference = new MercadoPago\Preference();

        $item = new MercadoPago\Item();

        $item->title = $edicion;
        $item->quantity = 1;
        $item->unit_price = 350.00;
        $item->currency_id = "ARS";

        $preference->items = array($item);

        $preference->back_urls = array(
            "success" => "/infonet/view/confirmadoView.mustache",
            "failure" => "/infonet/view/fallidoView.mustache",
        );

        $preference->auto_return = "approved";
        $preference->binary_mode = true;

        $preference->save();

        $data['ediciones'] = $this->pagoModel->setCompra($user, $edicion);

        $this->view->render('comprarEdicionView.mustache', $data);
    }

}