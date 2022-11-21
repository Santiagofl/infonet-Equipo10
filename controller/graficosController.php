<?php

class graficosController
{

    private $view;
    private $session;
    private $graficosModel;

    public function __construct($view, $session, $graficosModel)
    {
        $this->view = $view;
        $this->session = $session;
        $this->graficosModel = $graficosModel;
    }

    public function list()
    {
        $data['usuario']= $this->session->getCurrentUser();


        $desde = $_GET['desde'] ?? '';
        $hasta = $_GET['hasta'] ?? '';

        $tipo = $_GET['tipo'] ?? "";
        if($tipo === "C"){

            $this->view->render('graficoComprasView.mustache', $data);

        } else {
            $data['fechaDesde'] = $desde;
            $data['fechaHasta'] = $hasta;

            $data['cantidades']= $this -> array_flatten($this->graficosModel->getCantidades($desde, $hasta));

            var_dump($data['cantidades']);

            $data['fechas']= $this -> array_flatten($this->graficosModel->getFechas($desde, $hasta));
            var_dump($data['fechas']);

            $this->view->render('graficoSuscripcionView.mustache', $data);
        }

    }

    function array_flatten($array) {

        $return = array();
        foreach ($array as $key => $value) {
            if (is_array($value)){ $return = array_merge($return, array_flatten($value));}
            else {$return[$key] = $value;}
        }
        return $return;

    }

    // public function description()
    // {
    //     $id = $_GET['id'] ?? '';
    //     $producto['producto'] = $this->productoModel->getProducto($id);
    //     $this->view->render('descriptionView.mustache', $producto);
    // }
}
