<?php

namespace App\Http\Controllers\API;

use App\Models\DB;

use App\Models\Option;

use App\Models\Question;

use App\Models\Quiz;

use Src\Auth;

use App\Traits\Validator;

class QuizController extends DB
{
    use Validator;

    public function index()
    {
        $quizzes = (new Quiz())->getByUserId(Auth::user()['id']);
        apiResponse([
            'data' => $quizzes
        ]);
    }

    public function store(): void
    {
        $quizItems = $this->validate([
            'title' => 'string',
            'description' => 'string',
            'timeLimit' => 'int',
            'questions' => 'array',
        ]);

        $quiz = new Quiz();
        $question = new Question();
        $option = new Option();

        $quizId = $quiz->create(
            Auth::user()['id'],
            $quizItems['title'],
            $quizItems['description'],
            $quizItems['timeLimit'],
        );

        $questions = $quizItems['questions'];

        foreach ($questions as $questionItem) {
            $question_id = $question->create($quizId, $questionItem['quiz']);
            $correct = $questionItem['correct'];
            foreach ($questionItem['options'] as $key => $optionItem) {
                $option->create($question_id, $optionItem, $correct == $key);
            }
        }

        apiResponse([
            'message' => 'Quiz created successfully',
        ], 201);
    }

    public function update(int $quizId): void
    {
        $quizItems = $this->validate([
            'title' => 'string',
            'description' => 'string',
            'timeLimit' => 'int',
            'questions' => 'array',
        ]);


        $quiz = new Quiz();
        $question = new Question();
        $option = new Option();

        // update quiz
        $quiz->update(
            Auth::user()['id'],
            $quizItems['title'],
            $quizItems['description'],
            $quizItems['timeLimit'],
        );



        $questions = $quizItems['questions'];

        foreach ($questions as $questionItem) {
            $question_id = $question->create($quizId, $questionItem['quiz']);
            $correct = $questionItem['correct'];
            foreach ($questionItem['options'] as $key => $optionItem) {
                $option->create($question_id, $optionItem, $correct == $key);
            }
        }

        apiResponse([
            'message' => 'Quiz created successfully',
        ], 201);

    }

    public function destroy(int $quizId)
    {
        $quiz = new Quiz();
        $quiz->delete($quizId);
        apiResponse([
            'message' => 'Quiz deleted successfully',
        ]);
    }

}