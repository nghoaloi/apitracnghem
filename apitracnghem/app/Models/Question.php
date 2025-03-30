<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    use HasFactory;

    // Tên bảng trong cơ sở dữ liệu
    protected $table = 'question';

    // Các cột có thể được điền dữ liệu
    protected $fillable = [
        'Id',           // ID của câu hỏi
        'CategoryId',   // ID danh mục
        'Content',      // Nội dung câu hỏi
        'AnswerA',      // Đáp án A
        'AnswerB',      // Đáp án B
        'AnswerC',      // Đáp án C
        'AnswerD',      // Đáp án D
        'AnswerCorrect',// Đáp án đúng
        'CreatedAt',    // Thời gian tạo
        'CreatedBy',    // Người tạo
    ];

    // Tắt timestamps mặc định của Laravel vì bảng đã có cột CreatedAt
    public $timestamps = false;

    protected $primaryKey = 'Id'; // Đặt khóa chính là cột 'Id'
    public $incrementing = true;  // Đặt thành true nếu 'Id' là auto-increment
    protected $keyType = 'int';   // Định dạng của khóa chính
}
