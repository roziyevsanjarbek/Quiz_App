<?php

namespace App\Http\Controllers\API;

use App\Models\Question;
use App\Models\Quiz;
use App\Models\Result;
use App\Traits\Validator;
use Src\Auth;

class ResultController
{
    use Validator;
    public function store()
    {
       $resultItems =  $this->validate([
            'quiz_id' => 'int',
        ]);
       $quiz = (new Quiz())->find($resultItems['quiz_id']);

       if ($quiz) {
           $result = new Result();
           $userResult = $result->getUserResult(Auth::user()['id'], $quiz['id']);
           if($userResult){
               $startedAt = strtotime($userResult['started_at']);
               $finishedAt = strtotime($userResult['finished_at']);
               $diff = abs($finishedAt - $startedAt);
               $years = floor($diff / (365*60*60*24));
               $months = floor(($diff - $years * 365*60*60*24)/ (30*60*60*24));
               $days = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));
               $hour = floor(($diff - $years * 365 *60 *60*24 - $months*30*60*60*24 - $days*60*60*24)/ (60*60));

               apiResponse([
                   'errors' => [
                       'message' => 'You have already taken this quiz.',
                   ],
                   'data' => [
                       'result' => [
                           'id' => $resultItems['id'],
                           'quiz_id' => $resultItems['quiz_id'],
                           'started_at' => $resultItems['started_at'],
                           'time_taken' => floor(($diff - $years * 365 * 60 *60 * 24 - $months *30 * 60 *60 * 24 - $days *60 * 60 * 24 - $hour * 60 * 60)/(60)),
                       ]
                   ]
               ], 400);
           }

            $resultData = $result->create(
                Auth::user()['id'],
                $quiz['id'],
                $quiz['time_limit'],
            );
            apiResponse([
                'message' => 'Result created successfully',
                'result' => $resultData,
            ]);
       }
        apiResponse([
            'errors' => [
                'message' => 'Quiz not found',
            ]
        ]);


    }
}