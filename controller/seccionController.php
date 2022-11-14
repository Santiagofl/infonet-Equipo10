<?php

class SeccionController
{

    private $seccionModel;
    private $edicionModel;
    private $view;
    private $session;

    public function __construct($seccionModel, $edicionModel, $view, $session)
    {
        $this->edicionModel = $edicionModel;
        $this->seccionModel = $seccionModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $data['secciones'] = $this->seccionModel->getProductos();
        $this->view->render('seccionView.mustache', $data);
    }

    public function subirSeccion()
    {
        $nombre = $_POST["nombreSeccion"] ?? '';

        $this->seccionModel->setSeccion($nombre);

        Redirect::doIt('/infonet/abm');
    }

    public function seccionesPorEdicion()
    {
        $id = $_GET['id'] ?? '';
        $data['usuario'] = $this->session->getCurrentUser();
        $data['secciones'] = $this->seccionModel->getSeccionesPorProducto($id);
        $data['edicion'] = $this->edicionModel->getEdicionById($id);
        //Si la query no me trae una compra/suscripcion entonces quiere decir que
        //la edicion no esta comprada, asi que me lleva a el producto/$PARAM
        $this->view->renderSession('secciones-por-edicionView.mustache', $data);
    }


}