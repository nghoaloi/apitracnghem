<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoryDetail extends Model
{
    use HasFactory;

    protected $table = 'historydetail';
    protected $fillable = ['Id', 'HistoryId', 'QuestionId', 'AnswerSelect'];
    public $timestamps = false;
}
