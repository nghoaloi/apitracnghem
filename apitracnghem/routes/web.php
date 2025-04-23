<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\ExamDetailController;
use App\Http\Controllers\HistoryController;
use App\Http\Controllers\HistoryDetailController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
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
Route::delete('/api/deletequestions/{id}', [QuestionController::class, 'destroy']);


Route::get('/api/exams', [ExamController::class, 'export']);
Route::get('/api/exams/{id}', [ExamController::class, 'exportById']);
Route::post('/api/exams', [ExamController::class, 'store']);
Route::delete('/api/deleteexams/{id}', [ExamController::class, 'destroy']);



Route::get('/api/examdetails', [ExamDetailController::class, 'export']);
Route::get('/api/examdetails/{id}', [ExamDetailController::class, 'exportById']);
Route::post('/api/examdetails', [ExamDetailController::class, 'store']);
Route::delete('/api/deleteexamdetails/{id}', [ExamDetailController::class, 'destroy']);
Route::get('api/examdetailsbyexamid/{examId}', [ExamDetailController::class, 'exportByExamId']);



Route::get('/api/histories', [HistoryController::class, 'export']);
Route::get('/api/histories/{id}', [HistoryController::class, 'exportById']);
Route::post('/api/histories', [HistoryController::class, 'store']);
Route::delete('/api/deletehistories/{id}', [HistoryController::class, 'destroy']);


Route::get('/api/historydetails', [HistoryDetailController::class, 'export']);
Route::get('/api/historydetails/{id}', [HistoryDetailController::class, 'exportById']);
Route::post('/api/historydetails', [HistoryDetailController::class, 'store']);
Route::delete('/api/deletehistorydetails/{id}', [HistoryDetailController::class, 'destroy']);

Route::get('/api/roles', [RoleController::class, 'export']);
Route::get('/api/roles/{id}', [RoleController::class, 'exportById']);

Route::get('/api/categories/{id}', [CategoryController::class, 'exportById']);
Route::get('/api/categories', [CategoryController::class, 'export']);
Route::post('/api/categories', [CategoryController::class, 'store']);
Route::delete('/api/deletecategories/{id}', [CategoryController::class, 'destroy']);

Route::post('/login', [UserController::class, 'login']);
Route::post('/api/users', [UserController::class, 'store']);
Route::delete('/api/deleteusers/{id}', [UserController::class, 'destroy']);

Route::get('/api/users/{id}', [UserController::class, 'exportById']);
Route::get('/api/users', [UserController::class, 'export']);
?>