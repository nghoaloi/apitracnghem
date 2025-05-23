<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exam extends Model
{
    use HasFactory;

    protected $table = 'exam';
    protected $fillable = ['id', 'CategoryId', 'ExamName', 'Time', 'CreateAt', 'CreateBy', 'IsActive'];
    public $timestamps = false;

    protected $primaryKey = 'Id';
}
