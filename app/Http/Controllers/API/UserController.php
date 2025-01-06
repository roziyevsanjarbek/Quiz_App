<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Traits\Validator;
use JetBrains\PhpStorm\NoReturn;

class UserController{

    use Validator;
    #[NoReturn] public function store()
    {
        $userData = $this->validate([
            'fullName' => 'string',
            'email' => 'string',
            'password' => 'string'
        ]);
        $user = new User();
        $user->create($userData['fullName'], $userData['email'], $userData['password']);
        apiResponse([
            'message' => 'User created successfully',
            'user' => $user->api_token
        ], 201);
    }

    public function login()
    {
        $userData = $this->validate([
            'email' => 'string',
            'password' => 'string'
        ]);
        $user = new User();
       if ($user->getUser($userData['email'], $userData['password'])){
           apiResponse([
               'message' => 'User logged in successfully',
           ]);
       }
    }
}