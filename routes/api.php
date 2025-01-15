<?php

use App\Http\Controllers\API\QuizController;

use App\Http\Controllers\API\UserController;

use Src\Router;


Router::get('/api/users/getInfo', [UserController::class, 'show'], 'auth:api');

//Auth
Router::post('/api/register', [UserController::class, 'store']);
Router::post('/api/login', [UserController::class, 'login']);

//Quizzes
Router::post('/api/quizzes', [QuizController::class, 'store'], 'auth:api');









Router::notFound();


