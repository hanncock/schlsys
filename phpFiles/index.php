<?php
    declare(strict_types=1);

    spl_autoload_register(function ($class){

        require __DIR__ . "/$class.php";

    });

    header("Access-Control-Allow-Origin: *");

    header("Content-Type: application/json; charset=UTF-8");

    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");

    // $extra = explode("/trial",  $_SERVER["REQUEST_URI"]) ?? null;

    $extra = explode("/live",  $_SERVER["REQUEST_URI"]) ?? null;

    $endpoints = explode("?",$extra[1]) ?? null;

    print_r($endpoints);

    switch($endpoints[0]){
        case "/auth/login":
            echo 'login requested';
            break;

        case "/profile/save":
            echo 'memberId'.$_POST['memberId'];
            echo 'CompanyId'.$_POST['companyId'];
            echo 'fileToUpload'.$_POST['fileToUpload'];
            break;
        default:
            echo json_encode([
                'count'=>0,
                'list'=>['format error']
            ]);
    }
//     // print_r($extra2);
//
//     $shredVal = empty($extra[1]) ? null : $_SERVER["REQUEST_URI"];
//
//     $database = new Database("localhost", "ekso", "soke", "");
//
//     $gateway = new ProductGateway($database);
//
//     $controller = new Controller($gateway);
//
//     $controller->ProcessRequest($_SERVER['REQUEST_METHOD'],$shredVal,$tblName);



?>