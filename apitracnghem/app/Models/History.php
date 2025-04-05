<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class History extends Model
{
    use HasFactory;

    protected $table = 'history';
    protected $fillable = ['Id', 'ExamId', 'UserId', 'TimeDoExam', 'Point', 'CreatedAt'];
    public $timestamps = false;

    protected $primaryKey = 'Id';
}
