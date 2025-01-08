<?php

namespace Src;

use App\Models\DB;


class Auth
{
    public static function check()
    {
        $headers = getallheaders();
        if(!isset($headers['Authorization'])){
            apiResponse(['error' => 'Unauthorized'], 403);
        }
        if(!str_starts_with( $headers['Authorization'], 'Bearer '))
        {
            apiResponse([
                'message' => 'Authorization format is invalid, allowed format is Bearer'
            ], 400);
        }
        $token = str_replace('Bearer ', '', $headers['Authorization']);
        $db = new DB();
        $pdo = $db->getConnectoin();
        $query = "SELECT * FROM user_api_token WHERE token = :token";;
        $stmt = $pdo->prepare($query);
        $stmt->execute([':token' => $token]);
        $apiToken = $stmt->fetch();
        if(!$apiToken){
            apiResponse([
                'error' => 'Unauthorized'
            ], 403);
        }
        return true;
    }
}