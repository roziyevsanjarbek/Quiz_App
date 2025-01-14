<?php

use App\Http\Controllers\WEB\HomeController;

use App\Http\Controllers\WEB\UserController;

use Src\Router;

Router::get('/', [HomeController::class, 'Home']);
Router::get('/about', [HomeController::class, 'about']);
Router::get('/login', [HomeController::class, 'login']);
Router::get('/register', [HomeController::class, 'register']);

Router::get('/dashboard', [UserController::class, 'dashboard']);
Router::get('/my_quizzes', [UserController::class, 'my_quizzes']);
Router::get('/create_quiz', [UserController::class, 'create_quiz']);
Router::get('/statistics', [UserController::class, 'statistics']);

Router::notFound();