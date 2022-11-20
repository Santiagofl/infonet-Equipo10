<?php

class UsuarioModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }
}