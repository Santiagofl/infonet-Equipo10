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
        $edicion = $_POST["edicionSeccion"] ?? '';
        $this->seccionModel->setSeccion($nombre, $edicion);

        Redirect::doIt('/infonet/abm/vistaListaSecciones');
    }

    public function seccionesPorEdicion()
    {
        $id = $_GET['id'] ?? '';
        $data['usuario'] = $this->session->getCurrentUser();
        $data['secciones'] = $this->seccionModel->getSeccionesPorProducto($id);
        $data['edicion'] = $this->edicionModel->getEdicionById($id);
        $this->view->render('secciones-por-edicionView.mustache', $data);
    }

    public function borrarSeccion()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $idSeccion = $_GET["id"] ?? '';
        $this->seccionModel->deleteSeccion($idSeccion);
        Redirect::doIt('/infonet/abm/vistaListaSecciones');
    }


}