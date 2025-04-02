<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function export()
    {
        $categories = Category::all();
        // Trả về trực tiếp mảng JSON
        return response()->json($categories);
    }

    public function exportById($id)
    {
        $category = Category::find($id);

        if (!$category) {
            return response()->json(['error' => 'Category not found'], 404);
        }

        return response()->json($category);
    }

    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'CategoryName' => 'required|string|max:255',
            'CreateAt' => 'required|date',
        ]);

        // Tạo danh mục mới
        // $category = Category::create($validatedData);
        $category = Category::create([
            'CategoryName' => $validatedData['CategoryName'],
            'CreateAt' => $validatedData['CreateAt'],  // Lưu giá trị CreateAt từ request
        ]);
        // Trả về danh mục vừa tạo
        return response()->json($category, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting category with ID: $id");
        $category = Category::find($id);

        if (!$category) {
            \Log::error("Category not found for ID: $id");
            return response()->json(['error' => 'Category not found'], 404);
        }

        $category->delete();
        \Log::info("Category deleted successfully for ID: $id");
        return response()->json(['message' => 'Category deleted successfully'], 200);
    }
}
