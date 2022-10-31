<?php

class ProductoController
{

    private $productoModel;
    private $view;

    public function __construct($productosModel, $view)
    {
        $this->productoModel = $productosModel;
        $this->view = $view;
    }

    public function list()
    {
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('productoView.mustache', $data);
    }

    public function description()
    {
        $id = $_GET['id'] ?? '';
        $producto['producto'] = $this->productoModel->getProducto($id);
        $this->view->render('descriptionView.mustache', $producto);
    }
}
