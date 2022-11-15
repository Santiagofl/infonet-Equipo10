<?php

class EdicionController
{

    private $edicionModel;
    private $view;
    private $session;

    public function __construct($edicionModel, $view, $session)
    {
        $this->edicionModel = $edicionModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones();
        $this->view->render('edicionView.mustache', $data);
    }

    public function comprarEdicion(){

        $user = $_GET["usuario"];
        $edicion = $_GET["edicion"];
        $precio = $_GET["precio"];

        require 'vendor/autoload.php';

        MercadoPago\SDK::setAccessToken('TEST-5322929221556591-110901-5614eabea6ba44256133cc0858a47ebb-328479679');

        $preference = new MercadoPago\Preference();

        $item = new MercadoPago\Item();

        $item->title = $edicion;
        $item->quantity = 1;
        $item->unit_price = $precio;
        $item->currency_id = "ARS";

        $preference->items = array($item);

        $preference->back_urls = array(
            "failure" => "/infonet/view/fallidoView.mustache",
        );

        $preference->auto_return = "approved";
        $preference->binary_mode = true;

        $preference->save();

        $data['ediciones'] = $this->edicionModel->setCompra($user, $edicion);

        $this->view->render('confirmadoView.mustache',$data);
        header('Location: '.$preference->init_point);
    }


    public function validarCompra(){


    }
}

?>

