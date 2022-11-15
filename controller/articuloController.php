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
        $this->view->renderSession('articuloView.mustache');
    }

    public function articuloPorSeccion()
    {
        $idSeccion = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticulosPorSeccion($idSeccion);
        $this->view->renderSession('articulos-por-seccionView.mustache', $data);
    }

    public function subirArticulo()
    {
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

    public function verArticulo(){
        $id = $_GET['id'] ?? '';
        $data['articulos'] = $this->articuloModel->getArticuloPorId($id);
        $this->view->renderSession('articulo-contenidoView.mustache', $data);
    }

    public function borrarArticulo()
    {
        $id = $_GET['id'] ?? '';
        $this->articuloModel->deleteArticulo($id);
        Redirect::doIt('/infonet/abm/vistaListaArticulos');
    }

    public function cambiarEstado()
    {
        $idEstado = $_POST['estadoArticulo'] ?? '';
        $idArticulo = $_GET['idArticulo'] ?? '';
        $this->articuloModel->updateEstadoArticulo($idEstado, $idArticulo);
        Redirect::doIt('/infonet/abm/vistaListaArticulos');
    }

    public function modificarArticulo()
    {
        $data['usuario'] = $this->session->getCurrentUser();
        $id = $_GET["id"] ?? '';
        $titulo = $_POST["tituloArticulo"] ?? '';
        $subtitulo = $_POST["subtituloArticulo"] ?? '';
        $imagen = $_FILES["imagenArticulo"]["name"] ? $_FILES["imagenArticulo"]["name"] : $_POST["modImagenArticuloSave"];
        $texto = $_POST["textoArticulo"] ?? '';
        $autor = $_POST["autorArticulo"] ?? '';


        $this->articuloModel->updateArticulo($id, $titulo, $subtitulo, $imagen, $texto, $autor);

        $rutaArchivoTemporal = $_FILES["imagenArticulo"]["tmp_name"];
        $rutaArchivoFinal = "public/imgArticulos/" . $imagen;
        move_uploaded_file($rutaArchivoTemporal, $rutaArchivoFinal);

        Redirect::doIt('/infonet/abm/vistaListaArticulos');
    }
}