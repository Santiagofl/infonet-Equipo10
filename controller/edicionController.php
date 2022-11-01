<?php

class EdicionController
{

    private $edicionModel;
    private $view;

    public function __construct($edicionModel, $view)
    {
        $this->edicionModel = $edicionModel;
        $this->view = $view;
    }

    public function list()
    {
        $data['ediciones'] = $this->edicionModel->getEdiciones();
        $this->view->render('edicionView.mustache', $data);
    }

    // public function description()
    // {
    //     $id = $_GET['id'] ?? '';
    //     $producto['producto'] = $this->productoModel->getProducto($id);
    //     $this->view->render('descriptionView.mustache', $producto);
    // }
}
