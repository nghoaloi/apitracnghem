<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\History;

class HistoryController extends Controller
{
    public function export()
    {
        $histories = History::all();
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
}
