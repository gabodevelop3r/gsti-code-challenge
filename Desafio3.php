<?php

    require_once "vendor/autoload.php";

    use GuzzleHttp\Client;

    $search = ( string ) 'typing';
    $apiKey = ( string ) 'E6g5hK4IMGGMwgFQaUVeBmL75Gp8bcjF';
    $url = ( string ) "https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$search&limit=25&offset=0&rating=g&lang=en&bundle=messaging_non_clips";

    # Obtener gifs
    $httpClient = new Client();
    $response = $httpClient->get( $url );

    $res = json_decode( $response->getBody()->getContents(), true );

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Desafío 3</title>

</head>
<body>

    <div class="container mt-2">
        <div class="row" >
            <?php  foreach ($res['data'] as $key => $gif): ?>
                <div class="col-md-2 col-sm-6 border border-dark rounded m-1">
                    <div class="card mb-2 bg-dark text-center border">
                        <div class="d-flex justify-content-center">

                            <img src="<?php echo $gif['images']['original']['url']   ?>"
                                class="card-img-top"
                                style="width:100px; height:100px "
                                >

                        </div>
                    </div>
                    <div class="card-body d-flex align-items-end">       
                        <a href="<?php echo $gif['images']['original']['url']   ?>" 
                            class="btn btn-info mb-2"
                            target="_blank"
                            >
                            Abrir link
                        </a>
                    </div>
                </div>
            <?php endforeach;  ?>
        </div>
    </div>

</body>
</html>