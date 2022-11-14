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
        $data['usuario'] = $this->session->getCurrentUser();
        $idUsuario = $this->session->getIdUsuario();
        $data['productos'] = $this->productoModel->getProductos();
        $data['ediciones'] = $this->edicionModel->getEdiciones($idUsuario);

        $this->view->renderSession('abm/abmView.mustache', $data);
    }

    public function vistaAltaArticulos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getAllEdiciones();
        $data['secciones'] = $this->seccionModel->getSecciones();
        $data['productos'] = $this->productoModel->getProductos();
        $data['estadoArticulos'] = $this->articuloModel->getEstadosDeArticulos();
        $this->view->renderSession('abm/alta-articulosView.mustache', $data);
    }

    public function vistaAltaSecciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones($data['usuario']['id_usuario']);
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->renderSession('abm/alta-seccionesView.mustache', $data);
    }

    public function vistaAltaProductos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $this->view->renderSession('abm/alta-productosView.mustache', $data);
    }

    public function vistaAltaEdiciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->renderSession('abm/alta-edicionesView.mustache', $data);
    }

    //Listas
    public function vistaListaArticulos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->renderSession('abm/lista-articulosView.mustache', $data);
    }

    public function vistaListaProductos()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->renderSession('abm/lista-productosView.mustache', $data);
    }

    public function vistaListaSecciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['secciones'] = $this->seccionModel->getSecciones();
        $this->view->renderSession('abm/lista-seccionesView.mustache', $data);
    }

    public function vistaListaEdiciones()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->renderSession('abm/lista-edicionesView.mustache', $data);
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