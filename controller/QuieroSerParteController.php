<?php

class QuieroSerParteController {
    private $renderer;
    private $model;

    public function __construct($render, $model) {
        $this->renderer = $render;
        $this->model = $model;
    }

    public function list() {
        echo "nada";
    }

    public function alta(){
        $this->renderer->render("quieroSerParteForm.mustache");
    }

    public function procesarAlta(){
        $nombre = $_POST["nombre"];
        $instrumento = $_POST["instrumento"];

        $this->model->alta($nombre,$instrumento);

        Redirect::doIt('/');
    }

}