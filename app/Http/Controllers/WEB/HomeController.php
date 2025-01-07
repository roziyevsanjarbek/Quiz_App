<?php

namespace App\Http\Controllers\WEB;

class HomeController
{
    public function Home()
    {
        view('home');
    }

    public function login()
    {
        view('auth/login');
    }
    public function register()
    {
        view('auth/register');
    }
    public function about()
    {
        view('about');
    }
}