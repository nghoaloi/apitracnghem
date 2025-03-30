<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HistoryDetail;

class HistoryDetailController extends Controller
{
    public function export()
    {
        $historyDetails = HistoryDetail::all();
        // Trả về trực tiếp mảng JSON
        return response()->json($historyDetails);
    }

    public function exportById($id)
    {
        $historyDetail = HistoryDetail::find($id);

        if (!$historyDetail) {
            return response()->json(['error' => 'HistoryDetail not found'], 404);
        }

        return response()->json($historyDetail);
    }

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'HistoryId' => 'required|integer',
            'QuestionId' => 'required|integer',
            'AnswerSelect' => 'required|string|max:255',
        ]);

        // Tạo chi tiết lịch sử mới
        $historyDetail = HistoryDetail::create($validatedData);

        // Trả về chi tiết lịch sử vừa tạo
        return response()->json($historyDetail, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting history detail with ID: $id");
        $historyDetail = HistoryDetail::find($id);

        if (!$historyDetail) {
            \Log::error("History detail not found for ID: $id");
            return response()->json(['error' => 'History detail not found'], 404);
        }

        $historyDetail->delete();
        \Log::info("History detail deleted successfully for ID: $id");
        return response()->json(['message' => 'History detail deleted successfully'], 200);
    }
}
