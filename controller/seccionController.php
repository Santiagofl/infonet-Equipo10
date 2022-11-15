<?php

class SeccionController
{

    private $seccionModel;
    private $edicionModel;
    private $view;

    public function __construct($seccionModel, $edicionModel, $view)
    {
        $this->edicionModel = $edicionModel;
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
        $edicion = $_POST["edicionSeccion"] ?? '';
        $this->seccionModel->setSeccion($nombre, $edicion);

        Redirect::doIt('/infonet/abm/vistaListaSecciones');
    }

    public function seccionesPorEdicion()
    {
        $id = $_GET['id'] ?? '';
        $data['secciones'] = $this->seccionModel->getSeccionesPorProducto($id);
        $data['edicion'] = $this->edicionModel->getEdicionById($id);
        //Si la query no me trae una compra/suscripcion entonces quiere decir que
        //la edicion no esta comprada, asi que me lleva a el producto/$PARAM
        $this->view->renderSession('secciones-por-edicionView.mustache', $data);
    }

    public function borrarSeccion()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $idSeccion = $_GET["id"] ?? '';
        $this->seccionModel->deleteSeccion($idSeccion);
        Redirect::doIt('/infonet/abm/vistaListaSecciones');
    }


}