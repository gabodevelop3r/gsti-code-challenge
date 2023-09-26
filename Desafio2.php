<?php

require_once('./autoload.php');

require_once('config/Connection.php');

require_once('lib/headers.php');


$pdo = Connection::init();

$result = $pdo->query("SELECT * FROM db_desafio.issues WHERE (date_close BETWEEN '2023-09-01 00:00:00' AND '2023-09-30 23:59:59')");

echo json_encode( $result->fetchAll( PDO::FETCH_ASSOC ) );


?>