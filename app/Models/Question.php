<?php

namespace App\Models;

use App\Models\DB;

class Question extends DB
{
    public function create(int $quizId, string $questionText): int
    {
        $query = "INSERT INTO questions (quiz_id, question_text, updated_at,created_at) 
            VALUES (:quizId,:questionText,NOW(),NOW())";
        $stmt = $this->conn->prepare($query);
        $stmt->execute([
            ':quizId' => $quizId,
            ':questionText' => $questionText,
        ]);
        return $this->conn->lastInsertId();
    }

    public function deleteByQuizId($questionId): bool
    {
        $query = "DELETE FROM questions WHERE id = :questionId";
        $stmt = $this->conn->prepare($query);
        return $stmt->execute([
            ':questionId' => $questionId,
        ]);
    }
    public function getWithOptions(int $quizId)
    {
        $stmt = $this->conn->prepare("SELECT * FROM questions WHERE quiz_id = :quizId");
        $stmt->execute([
            ':quizId' => $quizId,
        ]);
        $questions = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        $questionsIds = array_column($questions, 'id');
        $placeholders = rtrim(str_repeat('?,', count($questionsIds)) , ',');

        $query = "SELECT * FROM options WHERE question_id IN ($placeholders)";
        $stmt = $this->conn->prepare($query);
        $stmt->execute($questionsIds);
        $options = $stmt->fetchAll(\PDO::FETCH_ASSOC);

        $groupedOptions = [];
        foreach ($options as $option) {
            $groupedOptions[$option['question_id']][] = $option;
        }

        foreach ($questions as &$question) {
            $question['options'] = $groupedOptions[$question['id']] ?? [];
        }

        apiResponse($questions);

    }
}