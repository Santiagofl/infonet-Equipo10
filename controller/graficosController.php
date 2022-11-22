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


        $data['fechaDesde'] = $_GET['desde'] ?? '';
        $data['fechaHasta'] = $_GET['hasta'] ?? '';
        $tipo = $_GET['tipo'] ?? "";

        if($tipo === "C"){

            $this->view->render('graficoComprasView.mustache', $data);

        } else {

            $data['cantidades']= $this->graficosModel->getCantidades($data['fechaDesde'], $data['fechaHasta'] );
            $data['dates'] = $this->graficosModel->getFechas($data['fechaDesde'], $data['fechaHasta']);
            var_dump($data['dates']);
            $this->view->render('graficoSuscripcionView.mustache', $data);
        }

    }

//    function array_flatten($array) {
//
//        $return = array();
//        foreach ($array as $key => $value) {
//            if (is_array($value)){ $return = array_merge($return, array_flatten($value));}
//            else {$return[$key] = $value;}
//        }
//        return $return;
//
//    }

    // public function description()
    // {
    //     $id = $_GET['id'] ?? '';
    //     $producto['producto'] = $this->productoModel->getProducto($id);
    //     $this->view->render('descriptionView.mustache', $producto);
    // }
}
