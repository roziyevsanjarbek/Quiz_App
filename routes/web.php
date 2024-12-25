<?php


//use App\Router;
//use Controllers\UserController;
//use Controllers\TodoController;

use App\Models\User;

$user = new User();

dd($user->create('Esekjffhtrrutu7ugwlbek', 'gdrghtu7trhu76sek07@gmail.com', '123456789'));


//Router::get('/todos', [TodoController::class, 'show']);
//Router::get('/users', [UserController::class, 'index']);
//Router::get('/', function (){
//    echo 'Welcome to home page';
//});