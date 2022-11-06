<?php

class AbmController {

    private $productoModel;
    private $edicionModel;
    private $view;

    public function __construct($productosModel, $edicionModel, $view) {
        $this->view = $view;
        $this->productoModel = $productosModel;
        $this->edicionModel = $edicionModel;
    }

    public function list() {
        $pro['productos'] = $this->productoModel->getProductos();
        $edi['ediciones'] = $this->edicionModel->getEdiciones(2);
        $data['data'] = $pro + $edi;
        $this->view->render('abmView.mustache', $data);
    }
}