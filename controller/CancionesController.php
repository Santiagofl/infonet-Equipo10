<?php

class CancionesController
{
    private $cancionesModel;
    private $view;

    public function __construct($cancionesModel, $view)
    {
        $this->cancionesModel = $cancionesModel;
        $this->view = $view;
    }

    public function list()
    {
        $data['canciones'] = $this->cancionesModel->getCanciones();
        $this->view->render('cancionesView.mustache', $data);
    }
}