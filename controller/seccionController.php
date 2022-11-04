<?php

class SeccionController
{

    private $seccionModel;
    private $view;

    public function __construct($seccionModel, $view)
    {
        $this->seccionModel = $seccionModel;
        $this->view = $view;
    }

    public function list()
    {
        $data['secciones'] = $this->seccionModel->getProductos();
        $this->view->render('seccionView.mustache', $data);
    }

    public function subirSeccion()
    {
        $nombre = $_POST["nombreSeccion"] ?? '';

        $this->seccionModel->setSeccion($nombre);

        Redirect::doIt('/infonet/abm');
    }

}