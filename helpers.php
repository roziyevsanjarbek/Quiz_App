<?php


use JetBrains\PhpStorm\NoReturn;

function view(string $page, array $data = []): void
{
    extract($data);
    require 'resources/views/' . $page . '.php';
}

function components(string $component, array $data = [])
{
    extract($data);
    require 'resources/views/components/' . $component . '.php';
}

function assets($fileName): string
{
    return $_ENV['APP_URL'] . '/public/' . $fileName;
}

function redirect(string $url)
{
    header('Location: ' . $url);
    exit();
}

function apiResponse($data, $status=200): void
{
    header('Content-Type: application/json');
    http_response_code($status);
    echo json_encode($data);
    exit();
}