<?php

class HomeController {
    private $view;
    private $session;

    public function __construct($view, $session) {
        $this->view = $view;
        $this->session = $session;
    }

    public function list() {
        $data['usuario']= $this->session->getCurrentUser();
        $this->view->render('homeView.mustache', $data);
    }
}