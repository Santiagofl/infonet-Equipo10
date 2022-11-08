<?php

class AbmController
{

    private $productoModel;
    private $edicionModel;
    public $seccionModel;
    private $view;
    private $session;

    public function __construct($productosModel, $edicionModel, $seccionModel, $view, $session)
    {
        $this->view = $view;
        $this->productoModel = $productosModel;
        $this->edicionModel = $edicionModel;
        $this->seccionModel = $seccionModel;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $data['productos'] = $this->productoModel->getProductos();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $this->view->render('abm/alta-productosView.mustache', $data);
    }

    public function vistaAltaArticulos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $data['secciones'] = $this->seccionModel->getSecciones();
        $this->view->render('abm/alta-articulosView.mustache', $data);
    }

    public function vistaAltaSecciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/alta-seccionesView.mustache', $data);
    }

    public function vistaAltaProductos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $this->view->render('abm/alta-productosView.mustache', $data);
    }

    public function vistaAltaEdiciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/alta-edicionesView.mustache', $data);
    }

    //Listas
    public function vistaListaProductos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/lista-productosView.mustache', $data);
    }

    public function vistaListaSecciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['secciones'] = $this->seccionModel->getSecciones();
        $this->view->render('abm/lista-seccionesView.mustache', $data);
    }
}