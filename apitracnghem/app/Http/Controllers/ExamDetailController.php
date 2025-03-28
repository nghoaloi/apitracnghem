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
}
