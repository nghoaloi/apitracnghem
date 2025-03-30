<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\History;

class HistoryController extends Controller
{
    public function export()
    {
        $histories = History::all();
        // Trả về trực tiếp mảng JSON
        return response()->json($histories);
    }

    public function exportById($id)
    {
        $history = History::find($id);

        if (!$history) {
            return response()->json(['error' => 'History not found'], 404);
        }

        return response()->json($history);
    }

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'ExamId' => 'required|integer',
            'UserId' => 'required|integer',
            'TimeDoExam' => 'required|numeric',
            'Point' => 'required|integer',
        ]);

        // Tạo lịch sử mới
        $history = History::create($validatedData);

        // Trả về lịch sử vừa tạo
        return response()->json($history, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting history with ID: $id");
        $history = History::find($id);

        if (!$history) {
            \Log::error("History not found for ID: $id");
            return response()->json(['error' => 'History not found'], 404);
        }

        $history->delete();
        \Log::info("History deleted successfully for ID: $id");
        return response()->json(['message' => 'History deleted successfully'], 200);
    }
}
