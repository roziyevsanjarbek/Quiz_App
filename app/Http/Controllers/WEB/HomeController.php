<?php

namespace App\Http\Controllers\WEB;

class HomeController
{
    public function Home()
    {
        view('home');
    }

    public function about()
    {
        view('about');
    }
}