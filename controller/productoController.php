<?php

class ProductoController
{

    private $productoModel;
    private $view;
    private $session;

    public function __construct($productosModel, $view, $session)
    {
        $this->productoModel = $productosModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $data['productos'] = $this->productoModel->getProductos();
        $this->view->render('productoView.mustache', $data);
    }

    public function description()
    {
        //aca hay dos secciones en una sola pagina por lo tanto entre estas dos vistas ira un header arriba y un footer abajo
        $data['usuario'] = $this->session->getCurrentUser();
        $id = $_GET['id'] ?? '';

        $data['producto'] = $this->productoModel->getProducto($id);

        //TODO capturar usuario
        $data['fecha'] = $this->validarSuscripcion($id, 1);

        $this->view->render('descriptionView.mustache', $data);
        $data['edicionProducto'] = $this->productoModel->getEdicionesDeCadaProducto($id, 2);
        $this->view->render('edicion-por-productoView.mustache', $data);

        print_r($this->productoModel->getSuscripcion(1, 1)[0]['fecha']);


    }

    public function subirProducto()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $nombre = $_POST["nombreProducto"] ?? '';
        $imagen = $_FILES["imagenProducto"]["name"] ?? '';
        $tipo = $_POST["tipoProducto"] ?? '';

        $rutaArchivoTemporal = $_FILES["imagenProducto"]["tmp_name"];
        $rutaArchivoFinal = "public/iso/" . $imagen;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        $this->productoModel->setProducto($nombre, $imagen, $tipo);

        Redirect::doIt('/infonet/abm/vistaListaProductos/lista-productos');
    }

    public function borrarProducto()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $idPproducto = $_GET["id"] ?? '';
        $this->productoModel->deleteProducto($idPproducto);
        Redirect::doIt('/infonet/abm/vistaListaProductos/lista-productos');
    }

    public function validarSuscripcion($id_producto, $idUsuario)
    {
        $resultado = $this->productoModel->getSuscripcion($id_producto, $idUsuario);
        if($resultado){
            $fechaActual = new dateTime(date('Y-m-d'));
            $fechaInicial = new dateTime($resultado[0]['fecha']);
            $diff = $fechaInicial->diff($fechaActual);
            if (($diff->days) >31 ) {
                return false;
            } else {
                return true;
            }

        }





    }




}
