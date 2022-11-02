<?php

class ProductoController
{

    private $productoModel;
    private $view;
    private $session;

    public function __construct($productosModel, $view, $session)
    {
        $this->productoModel = $productosModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario']= $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('productoView.mustache', $data);
    }

    public function description()
    {
        $data['usuario']= $this->session->getCurrentUser();
        $id = $_GET['id'] ?? '';
        $data['producto'] = $this->productoModel->getProducto($id);
        $this->view->render('descriptionView.mustache', $data);
    }
}
