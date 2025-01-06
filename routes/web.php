<?php

use App\Http\Controllers\WEB\HomeController;
use Src\Router;

Router::get('/', [HomeController::class, 'Home']);
Router::get('/about', [HomeController::class, 'about']);