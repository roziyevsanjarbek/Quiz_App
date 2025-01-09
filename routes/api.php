<?php

use App\Http\Controllers\API\UserController;
use Src\Router;


Router::post('/api/register', [UserController::class, 'store']);
Router::post('/api/login', [UserController::class, 'login']);


