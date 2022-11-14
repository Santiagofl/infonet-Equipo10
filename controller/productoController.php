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
        $cache_file = 'data.json';
        if (file_exists($cache_file)) {
            $dat = json_decode(file_get_contents($cache_file));
        } else {
            $api_url = 'https://content.api.nytimes.com/svc/weather/v2/current-and-seven-day-forecast.json';
            $dat = file_get_contents($api_url);
            file_put_contents($cache_file, $dat);
            $dat = json_decode($dat);
        }
        $data["clima"] = $dat->results->current[0];
        $data["num"] = number_format((float)($dat->results->current[0]->temp - 32) * (5 / 9), 1, '.', '');
        //$forecast = $data->results->seven_day_forecast;
//        var_dump($current);
        $this->view->render('productoView.mustache', $data);
    }

    public function description()
    {
        //aca hay dos secciones en una sola pagina por lo tanto entre estas dos vistas ira un header arriba y un footer abajo
        $data['usuario'] = $this->session->getCurrentUser();
        $id_producto = $_GET['id'] ?? '';

        $data['producto'] = $this->productoModel->getProducto($id_producto);

        //TODO capturar usuario
        $data['suscripto'] = $this->validarSuscripcion($id_producto, 2);

        $this->view->render('descriptionView.mustache', $data);
        $data['edicionProducto'] = $this->productoModel->getEdicionesDeCadaProducto($id_producto, 2);


        $this->view->render('edicion-por-productoView.mustache', $data);


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
        if ($resultado) {
            $fechaActual = new dateTime(date('Y-m-d'));
            $fechaInicial = new dateTime($resultado[0]['fecha']);
            $diff = $fechaInicial->diff($fechaActual);
            if (($diff->days) > 31) {
                return false;
            } else {
                return true;
            }

        }


    }


    public function modificarProducto()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $idProducto = $_GET["idProducto"] ?? '';
        $nombreProducto = $_POST["modNombreProducto"] ?? '';
        $imagenProducto = $_FILES["modImagenProducto"]["name"] ? $_FILES["modImagenProducto"]["name"] : $_POST["modImagenProductoSave"];
        $tipoProducto = $_POST["modTipoProducto"] ?? '';

        $rutaArchivoTemporal = $_FILES["modImagenProducto"]["tmp_name"];
        $rutaArchivoFinal = "public/iso/" . $imagenProducto;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        $this->productoModel->updateProducto($idProducto, $nombreProducto, $imagenProducto, $tipoProducto);
        Redirect::doIt('/infonet/abm/vistaListaProductos/lista-productos');
    }

}
