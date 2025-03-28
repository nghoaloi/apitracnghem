<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HistoryDetail;

class HistoryDetailController extends Controller
{
    public function export()
    {
        $historyDetails = HistoryDetail::all();
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
}
