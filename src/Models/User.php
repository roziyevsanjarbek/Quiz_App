<?php

namespace App\Models;

use App\Traits\HasApiTokens;

use PDO;

class User extends DB {
    use HasApiTokens;
    public function create (string $fullName, string $email, string $password): bool
    {
        $query = "INSERT INTO users (full_name, email, password,update_at,create_at)
            VALUES (:full_name, :email, :password,NOW(),NOW())";
        $this->conn->prepare($query)->execute([
            ':full_name' => $fullName,
            ':email' => $email,
            ':password' => password_hash($password, PASSWORD_DEFAULT),
        ]);
        $userId = $this->conn->lastInsertId();
        $this->createApiTokens($userId);
        return true;

    }

    public function getUser(string $email, string $password){
        $query = "SELECT * FROM users WHERE email = :email";
        $stmt = $this->conn->prepare($query);
        $stmt->execute([
            ':email' => $email
        ]);
        $user = $stmt->fetch();
        if($user && password_verify($password, $user['password'])){
            return true;
        }else{
            return false;
        }


    }

}