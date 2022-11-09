<?php

class ArticuloController
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

     public function articulosPorEdicion()
     {
         $idEdicion = $_GET['id'] ?? '';
         $data['articulos'] = $this->articuloModel->getArticulosPorEdicion($idEdicion);
         $this->view->render('articuloView.mustache', $data);
     }
}