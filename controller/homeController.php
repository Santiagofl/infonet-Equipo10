<?php

class HomeController {
    private $productoModel;
    private $view;

    public function __construct($productosModel, $view) {
        $this->productoModel = $productosModel;
        $this->view = $view;
    }

    public function list() {
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('homeView.mustache', $data);
    }
}