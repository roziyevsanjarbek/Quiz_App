<?php

use App\Http\Controllers\WEB\HomeController;

use App\Http\Controllers\WEB\UserController;

use App\Http\Controllers\WEB\QuizController;

use Src\Router;

Router::get('/', [HomeController::class, 'Home']);
Router::get('/about', [HomeController::class, 'about']);
Router::get('/login', [HomeController::class, 'login']);
Router::get('/register', [HomeController::class, 'register']);

Router::get('/dashboard', [UserController::class, 'dashboard']);
Router::get('/dashboard/quizzes', [UserController::class, 'my_quizzes']);
Router::get('/dashboard/create-quiz', [UserController::class, 'create_quiz']);
Router::get('/dashboard/statistics', [UserController::class, 'statistics']);

Router::get('/dashboard/quizzes/{id}/update', [UserController::class, 'update']);

//Quizzes
Router::get('/take-quiz/{id}', [QuizController::class, 'takeQuiz']);



Router::notFound();