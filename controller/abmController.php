<?php

class AbmController
{

    private $productoModel;
    private $edicionModel;
    public $seccionModel;
    private $view;

    public function __construct($productosModel, $edicionModel, $seccionModel, $view)
    {
        $this->view = $view;
        $this->productoModel = $productosModel;
        $this->edicionModel = $edicionModel;
        $this->seccionModel = $seccionModel;
    }

    public function list()
    {
        $pro['productos'] = $this->productoModel->getProductos();
        $edi['ediciones'] = $this->edicionModel->getEdiciones();
        $data['data'] = $pro + $edi;
        $this->view->render('abm/abmView.mustache', $data);
    }

    public function vistaAltaArticulos()
    {
        $this->view->render('abm/alta-articulosView.mustache');
    }

    public function vistaAltaSecciones()
    {
        $this->view->render('abm/alta-seccionesView.mustache');
    }

    public function vistaAltaProductos()
    {
        $this->view->render('abm/alta-productosView.mustache');
    }

    public function vistaAltaEdiciones()
    {
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/alta-edicionesView.mustache', $data);
    }

    //Listas
    public function vistaListaProductos()
    {
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('abm/lista-productosView.mustache', $data);
    }

    public function vistaListaSecciones()
    {
        $data['secciones'] = $this->seccionModel->getSecciones();
        $this->view->render('abm/lista-seccionesView.mustache', $data);
    }
}