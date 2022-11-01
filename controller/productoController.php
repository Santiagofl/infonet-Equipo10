<?php

class ProductoController
{

    private $productoModel;
    private $view;

    public function __construct($productosModel, $view)
    {
        $this->productoModel = $productosModel;
        $this->view = $view;
    }

    public function list()
    {
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('productoView.mustache', $data);
    }

    public function description()
    {
        //aca hay dos secciones en una sola pagina por lo tanto entre estas dos vistas ira un header arriba y un footer abajo
        $id = $_GET['id'] ?? '';
        $producto['producto'] = $this->productoModel->getProducto($id);
        $this->view->render('descriptionView.mustache', $producto);
        $edicion['edicionProducto'] = $this->productoModel->getEdicionesDeCadaProducto($id);
        $this->view->render('edicion-por-productoView.mustache', $edicion);
    }

}
