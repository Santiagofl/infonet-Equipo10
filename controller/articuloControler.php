<?php

class EdicionController
{

    private $articuloModel;
    private $view;
    private $session;

    public function __construct($articuloModel, $view, $session)
    {
        $this->articuloModel = $articuloModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario']= $this->session->getCurrentUser();
        $this->view->render('', $data);
    }

    // public function description()
    // {
    //     $id = $_GET['id'] ?? '';
    //     $producto['producto'] = $this->productoModel->getProducto($id);
    //     $this->view->render('descriptionView.mustache', $producto);
    // }
}