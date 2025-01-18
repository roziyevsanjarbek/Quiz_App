<?php

namespace App\Models;

use PDO;

class DB
{
    private string $host;
    private string $user;
    private string $pass;
    private string $db_name;
    protected PDO $conn;

    public function __construct()
    {
        $this->host = $_ENV['DB_HOST'];
        $this->user = $_ENV['DB_USER'];
        $this->pass = $_ENV['DB_PASS'];
        $this->db_name = $_ENV['DB_NAME'];
        $this->conn = new PDO("mysql:host=$this->host;dbname=$this->db_name",
            $this->user, $this->pass,
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ]
        );
    }

    public function getConnectoin()
    {
        return $this->conn;
    }
}