<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ExamDetail;

class ExamDetailController extends Controller
{
    public function export()
    {
        $examDetails = ExamDetail::all();
        return response()->json($examDetails);
    }

    public function exportById($id)
    {
        $examDetail = ExamDetail::find($id);

        if (!$examDetail) {
            return response()->json(['error' => 'ExamDetail not found'], 404);
        }

        return response()->json($examDetail);
    }

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'ExamId' => 'required|integer',
            'QuestionId' => 'required|integer',
            'Order' => 'required|integer',
        ]);

        // Tạo chi tiết bài thi mới
        $examDetail = ExamDetail::create($validatedData);

        // Trả về chi tiết bài thi vừa tạo
        return response()->json($examDetail, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting exam detail with ID: $id");
        $examDetail = ExamDetail::find($id);

        if (!$examDetail) {
            \Log::error("Exam detail not found for ID: $id");
            return response()->json(['error' => 'Exam detail not found'], 404);
        }

        $examDetail->delete();
        \Log::info("Exam detail deleted successfully for ID: $id");
        return response()->json(['message' => 'Exam detail deleted successfully'], 200);
    }
}
