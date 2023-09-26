<?php

class Connection
{
    public static function init(): ?PDO
    {
        $connection = null;

        try {
            $host     = '127.0.0.1';
            $port     = '3306';
            $database = 'db_desafio';
            $username = 'root';
            $password = 'angel777';

            // Data Source Name
            $dsn = 'mysql:host=' . $host . ';dbname=' . $database . ';port=' .$port . ';charset=utf8';

            $connection = new PDO($dsn, $username, $password);

            // SQL exceptions with PDO
            $connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            /*
            | NOTE: Dado que espera que la excepción sea lanzada por el método prepare(), se debe
            | deshabilitar la característica PDO::ATTR_EMULATE_PREPARES. De lo contrario, el servidor
            | MySQL no "visualizará" la declaración hasta que se ejecute.
            */
            $connection->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

            return $connection;

        } catch (PDOException $e) {
            switch ($e->getCode()) {
                case 2002:
                    die('No se estableció la conexión con la base de datos, revise que se encuentre en ejecución');
                    break;
                case 1045:
                    die('No se estableció la conexión con la base de datos, revise las credenciales configuradas');
                    break;
                case 1049:
                    die('La base de datos no existe');
                    break;
                default:
                    die($e->getMessage() . ' ' . $e->getCode());
                    break;
            }
        }

        return $connection;
    }
}