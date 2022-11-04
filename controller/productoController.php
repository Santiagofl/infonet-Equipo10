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
        $data['producto'] = $this->productoModel->getProducto($id);
        $this->view->render('descriptionView.mustache', $data);
        $data['edicionProducto'] = $this->productoModel->getEdicionesDeCadaProducto($id);
        $this->view->render('edicion-por-productoView.mustache', $data);
    }

    public function subirProducto()
    {
        $nombre = $_POST["nombreProducto"] ?? '';
        $imagen = $_FILES["imagenProducto"]["name"] ?? '';
        $tipo = $_POST["tipoProducto"] ?? '';

        $rutaArchivoTemporal = $_FILES["imagenProducto"]["tmp_name"];
        $rutaArchivoFinal = "public/iso/" . $imagen;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        $this->productoModel->setProducto($nombre, $imagen, $tipo);

        Redirect::doIt('/infonet/abm');
    }

    public function borrarProducto()
    {
        $idPproducto = $_GET["id"] ?? '';
        $this->productoModel->deleteProducto($idPproducto);
        Redirect::doIt('/infonet/abm/vistaListaProductos/lista-productos');
    }

}
