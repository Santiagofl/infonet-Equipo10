<?php

class ArticuloController
{

    private $articuloModel;
    private $view;
    private $session;

    public function __construct($articuloModel, $view, $session)
    {
        $this->articuloModel = $articuloModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $this->view->renderSession('articuloView.mustache', $data);
    }

    public function articuloPorSeccion()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $idSeccion = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticulosPorSeccion($idSeccion);
        $this->view->renderSession('articulos-por-seccionView.mustache', $data);
    }

    public function subirArticulo()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $seccion = $_POST["productoEdicionSeccionArticulo"] ?? '';
        $edicion = $_POST["productoEdicionArticulo"] ?? '';
        $titulo = $_POST["tituloArticulo"] ?? '';
        $subtitulo = $_POST["subtituloArticulo"] ?? '';

        //alterar el varchar de texto a mas
        $texto = $_POST["textoArticulo"] ?? '';
        $autor = $_POST["autorArticulo"] ?? '';
        $imagen = $_FILES["imagenArticulo"]["name"] ?? '';
        $ubicacion = $_POST["ubicacionArticulo"] ?? '';

        $this->articuloModel->setArticulo($seccion, $edicion, $titulo, $subtitulo, $imagen, $texto, $autor, $ubicacion);

        $rutaArchivoTemporal = $_FILES["imagenArticulo"]["tmp_name"];
        $rutaArchivoFinal = "public/imgArticulos/" . $imagen;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        Redirect::doIt('/infonet/abm/vistaListaArticulos');
    }

    public function verArticulo(){
        $data['usuario'] = $this->session->getCurrentUser();
        $id = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticuloPorId($id);
        $this->view->renderSession('articulo-contenidoView.mustache', $data);
    }
    
}