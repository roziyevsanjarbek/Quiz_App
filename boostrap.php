<?php



require 'vendor/autoload.php';

date_default_timezone_set("Asia/Tashkent");

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

if($_ENV['APP_DEBUG']) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    ini_set('display_startup_errors',1);
}

require 'helpers.php';