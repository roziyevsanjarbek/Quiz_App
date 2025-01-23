<?php

namespace App\Http\Controllers\WEB;

use App\Models\Quiz;

class QuizController
{
    public static function takeQuiz(string $uniqueValue): void
    {
        view('quiz/take_quiz', [
            'uniqueValue' => $uniqueValue
        ]);
    }
}