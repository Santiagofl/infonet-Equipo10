<?php

class HomeController {
    private $productoModel;
    private $view;

    public function __construct($view) {
        $this->view = $view;
    }

    public function list() {
        $this->view->render('homeView.mustache');
    }
}