<?php


use App\Router;
use Controllers\UserController;
use Controllers\TodoController;




Router::get('/todos', [TodoController::class, 'show']);
Router::get('/users', [UserController::class, 'index']);
Router::get('/', function (){
    echo 'Welcome to home page';
});