<?php

namespace controllers;

use lib\App;
use lib\Connection;

class Users {

    public static function getGroupsList() {
        $query = '
            select
                groups.id,
                groups.name
            from `groups`
        ';

        $res = Connection::query($query);

        $rowsList = [];

        while ($row = $res->fetch_assoc()) {
            $rowsList[] = $row;
        }

        return $rowsList;
    }

    public static function group() {
        $query = '
            select
                users.id,
                users.name
            from users
            where
                users.id in (
                    select 
                        user_id
                    from users_groups
                    where
                        group_id = ' . (int)App::$params[1] . '
                )
        ';

        $res = Connection::query($query);

        $usersList = [];

        while ($row = $res->fetch_assoc()) {
            $usersList[] = $row;
        }

        return $usersList;
    }

    public static function id() {
        $query = '
            select distinct
                users.id,
                users.name,
                privileges.name privileges_name
            from users
            left join users_groups on
                users_groups.user_id = users.id
            left join privileges_groups on
                privileges_groups.group_id = users_groups.group_id
            left join privileges on
                privileges.id = privileges_groups.privilege_id
            where
                users.id = ' . (int)App::$params[1] . '
            order by privileges.id
        ';

        $res = Connection::query($query);

        $privilegesList = [];

        $usersList = [];

        while ($row = $res->fetch_assoc()) {
            if ($row['privileges_name']) {
                $privilegesList[$row['id']][] = $row['privileges_name'];
            }

            unset($row['privileges_name']);

            $usersList[$row['id']] = $row;
        }

        foreach ($usersList as &$user) {
            $user['privileges'] = [];

            if ($privilegesList && $privilegesList[$user['id']]) {
                $user['privileges'] = $privilegesList[$user['id']];
            }
        }

        return array_values($usersList);
    }

    public static function add() {
        $values = [
            (int)App::$params[1],
            (int)App::$params[2]
        ];

        $valuesString = implode(', ', $values);

        $query = '
            insert into users_groups (user_id, group_id) 
                values (' . $valuesString . ')
        ';

        mysqli_report(0);

        $res = Connection::query($query);

        return $res;
    }

    public static function remove() {
        $condList = [
            'user_id = ' . (int)App::$params[1],
            'group_id = ' . (int)App::$params[2]
        ];

        $condString = implode(' and ', $condList);

        $query = "
            delete from users_groups
            where
                $condString
        ";

        $res = Connection::query($query);

        return $res;
    }
}