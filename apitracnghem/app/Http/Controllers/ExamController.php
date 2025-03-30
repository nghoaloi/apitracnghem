<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;

class ExamController extends Controller
{
    public function export()
    {
        $exams = Exam::all();
        // Trả về trực tiếp mảng JSON
        return response()->json($exams);
    }

    public function exportById($id)
    {
        $exam = Exam::find($id);

        if (!$exam) {
            return response()->json(['error' => 'Exam not found'], 404);
        }

        return response()->json($exam);
    }
    
    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'CategoryId' => 'required|integer',
            'ExamName' => 'required|string|max:255',
            'Time' => 'required|integer',
            'CreateBy' => 'required|integer',
            'IsActive' => 'required|boolean',
        ]);

        // Tạo bài thi mới
        $exam = Exam::create($validatedData);

        // Trả về bài thi vừa tạo
        return response()->json($exam, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting exam with ID: $id");
        $exam = Exam::find($id);

        if (!$exam) {
            \Log::error("Exam not found for ID: $id");
            return response()->json(['error' => 'Exam not found'], 404);
        }

        $exam->delete();
        \Log::info("Exam deleted successfully for ID: $id");
        return response()->json(['message' => 'Exam deleted successfully'], 200);
    }
}
