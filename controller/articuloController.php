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
        $this->view->render('articuloView.mustache', $data);
    }

    public function articulosPorEdicion()
    {
        $data['usuario'] = $this->session->getCurrentUser() ?? '';
        $idEdicion = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticulosPorEdicion($idEdicion);
        $this->view->render('articuloView.mustache', $data);
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

        $this->articuloModel->setArticulo($seccion, $edicion, $titulo, $subtitulo, $imagen, $texto, $autor);

        $rutaArchivoTemporal = $_FILES["imagenArticulo"]["tmp_name"];
        $rutaArchivoFinal = "public/imgArticulos/" . $imagen;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        Redirect::doIt('/infonet/abm/vistaListaArticulos');
    }
}