<?php

namespace App\Http\Controllers\WEB;

use JetBrains\PhpStorm\NoReturn;

class UserController
{
    public static function dashboard(): void
    {
        view('dashboard/dashboard');
}

    public static function my_quizzes(): void
    {
        view('dashboard/My_Quizzes');
}

    public static function create_quiz(): void
    {
        view('dashboard/Create_Quiz');
}

    public static function statistics(): void
    {
        view('dashboard/statistics');
}

  public static function handlePost(): void
    {
        dd($_REQUEST);
    }
}