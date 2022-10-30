<?php

include_once ("configuration/Configuration.php");
$configuration = new Configuration();
$router = $configuration->getRouter();

$router->redirect(isset($_GET['controller']),isset($_GET['method']));