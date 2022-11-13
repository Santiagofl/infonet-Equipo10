<?php

class AbmController
{

    private $productoModel;
    private $edicionModel;
    public $seccionModel;
    public $articuloModel;
    private $view;
    private $session;

    public function __construct($productosModel, $edicionModel, $seccionModel, $articuloModel, $view, $session)
    {
        $this->view = $view;
        $this->productoModel = $productosModel;
        $this->edicionModel = $edicionModel;
        $this->seccionModel = $seccionModel;
        $this->articuloModel = $articuloModel;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $data['productos'] = $this->productoModel->getProductos();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $this->view->render('abm/abmView.mustache', $data);
    }

    public function vistaAltaArticulos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getAllEdiciones();
        $data['secciones'] = $this->seccionModel->getSecciones();
        $data['productos'] = $this->productoModel->getProductos();
        $data['estadoArticulos'] = $this->articuloModel->getEstadosDeArticulos();
        $this->view->render('abm/alta-articulosView.mustache', $data);
    }

    public function vistaAltaSecciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getAllEdiciones();
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
    public function vistaListaArticulos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/lista-articulosView.mustache', $data);
    }

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
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/lista-seccionesView.mustache', $data);
    }

    public function vistaListaEdiciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/lista-edicionesView.mustache', $data);
    }

    //AJAX
    public function edicionesPorProducto()
    {
        $id = $_GET['id'] ?? '';
        $data['ediciones'] = $this->productoModel->getEdicionesPorProductoAJax($id);
    }

    public function seccionesPorEdicion()
    {
        $id = $_GET['id'] ?? '';
        $data['secciones'] = $this->seccionModel->getSeccionesPorEdicionAJax($id);
    }

    public function articulosPorSeccion()
    {
        $id = $_GET['id'] ?? '';
        $data['secciones'] = $this->seccionModel->getSeccionesPorEdicionAJax($id);
    }

    public function articulosPorEdicion()
    {
        $id = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticulosPorEdicionAJax($id);
    }
}