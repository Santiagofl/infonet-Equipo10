<?php

class SeccionController
{

    private $seccionModel;
    private $view;
    private $session;

    public function __construct($seccionModel, $view, $session)
    {
        $this->seccionModel = $seccionModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario']= $this->session->getCurrentUser() ?? '';
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