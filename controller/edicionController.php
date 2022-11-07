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
        $data['usuario']= $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $this->view->render('edicionView.mustache', $data);
    }

    // public function description()
    // {
    //     $id = $_GET['id'] ?? '';
    //     $producto['producto'] = $this->productoModel->getProducto($id);
    //     $this->view->render('descriptionView.mustache', $producto);
    // }
}
