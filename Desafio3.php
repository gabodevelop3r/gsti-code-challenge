<?php

// Para ejecutar la vista en la terminal
// Comando: php -S localhost:8080

// Desafio : 3 

// 3.1 Obtener Gif de la api GIPHY

// Condiciones:
// - El postulante puede utilizar las librerias ``guzzleHttp`` o ``curl`` para el consumo de la API.
// - Se tiene que descomponer la url del endpoint y obtener las urls gifs según un dato de entrada.
// - Obtener url original del gif en la respuesta de la API.

$search = 'typing';
$apiKey = 'E6g5hK4IMGGMwgFQaUVeBmL75Gp8bcjF';
$url = "https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$search&limit=25&offset=0&rating=g&lang=en&bundle=messaging_non_clips";

// (Option 1) Usar Guzzlehttp:
// https://docs.guzzlephp.org
// Comando: composer require guzzlehttp/guzzle

// (Option 2) Usar curl de PHP:
// https://www.php.net/manual/es/function.curl-init
