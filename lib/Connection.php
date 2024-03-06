<?php

namespace lib;

class Connection {

    private static $connection;

    public static function connect() {
        if (!self::$connection) {
            self::$connection = mysqli_connect(
                App::$conf['host'],
                App::$conf['login'], 
                App::$conf['password'],
                App::$conf['database']
            );
        }
    }

    public static function query($query, $result_mode = 0) {
        self::connect();
        
        $result = mysqli_query(self::$connection, $query, $result_mode);

        return $result;
    }
}
