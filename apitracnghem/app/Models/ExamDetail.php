<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamDetail extends Model
{
    use HasFactory;

    protected $table = 'examdetail';
    protected $fillable = ['Id', 'ExamId', 'QuestionId', 'Order'];
    public $timestamps = false;
}
