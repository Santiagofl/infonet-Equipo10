<?php

class usuarioController
{
    private $view;
    private $session;
    private $usuarioModel;

    public function __construct($usuarioModel, $view, $session)
    {
        $this->usuarioModel = $usuarioModel;
        $this->view = $view;
        $this->session = $session;

    }

}
