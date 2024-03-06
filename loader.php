<?php

function autoload($class) {
    $class = str_replace('\\', '/', $class);

    require $class . '.php';
}

spl_autoload_register('autoload');
