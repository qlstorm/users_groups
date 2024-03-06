<?php

namespace lib;

class App {
    
    public static $params;
    public static $conf;

    public static function run() {
        self::setParams();
        self::setConf();
        self::runController();
    }

    private static function setParams() {
        self::$params = explode('/', $_SERVER['REQUEST_URI']);

        array_shift(self::$params);
    }

    private static function setConf() {
        require 'conf.php';

        self::$conf = $conf;
    }

    private static function runController() {
        $method = self::$params[0];

        if (!method_exists('controllers\Users', $method)) {
            $method = 'getGroupsList';
        }

        $res = call_user_func('controllers\Users::' . $method);

        if (is_bool($res)) {
            $res = (int)$res;
        }

        echo json_encode($res);
    }
}
