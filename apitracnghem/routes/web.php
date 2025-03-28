<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\ExamDetailController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\HistoryDetailController;
use App\Http\Controllers\RoleController;
Route::get('/', function () {
    return view('welcome');
});

// Swagger documentation route
Route::get('/api/documentation', function () {
    return view('l5-swagger::index');
});

// API routes
Route::get('/api/questions', [QuestionController::class, 'index']);
Route::get('/api/questions/{id}', [QuestionController::class, 'getQuestionById']);
Route::post('/api/questions', [QuestionController::class, 'store']);

Route::get('/api/exams', [ExamController::class, 'export']);
Route::get('/api/exams/{id}', [ExamController::class, 'exportById']);

Route::get('/api/examdetails', [ExamDetailController::class, 'export']);
Route::get('/api/examdetails/{id}', [ExamDetailController::class, 'exportById']);

Route::get('/api/histories', [HistoryController::class, 'export']);
Route::get('/api/histories/{id}', [HistoryController::class, 'exportById']);

Route::get('/api/historydetails', [HistoryDetailController::class, 'export']);
Route::get('/api/historydetails/{id}', [HistoryDetailController::class, 'exportById']);

Route::get('/api/roles', [RoleController::class, 'export']);
Route::get('/api/roles/{id}', [RoleController::class, 'exportById']);

Route::get('/api/categories/{id}', [CategoryController::class, 'exportById']);
Route::get('/api/categories', [CategoryController::class, 'export']);

?>