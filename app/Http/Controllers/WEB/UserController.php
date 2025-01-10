<?php

namespace App\Http\Controllers\WEB;

class UserController
{
    public static function dashboard()
    {
        view('dashboard/dashboard');
}
}