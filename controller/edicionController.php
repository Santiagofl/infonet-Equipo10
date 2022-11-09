<?php

class EdicionController
{

    private $edicionModel;
    private $productoModel;
    private $view;
    private $session;

    public function __construct($edicionModel,$productoModel, $view, $session)
    {
        $this->edicionModel = $edicionModel;
        $this->view = $view;
        $this->session = $session;
    }

    public function list()
    {
        $data['usuario']= $this->session->getCurrentUser();
        $data['ediciones'] = $this->edicionModel->getEdiciones(2);
        $this->view->render('edicionView.mustache', $data);
    }

}
