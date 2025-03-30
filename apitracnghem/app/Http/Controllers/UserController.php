<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function store(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'RoleId' => 'required|integer',
            'FullName' => 'required|string|max:255',
            'UserName' => 'required|string|max:255|unique:user,UserName',
            'Password' => 'required|string|min:6',
        ]);

        // Hash the password
        $validatedData['Password'] = md5($validatedData['Password']);

        // Tạo người dùng mới
        $user = User::create($validatedData);

        // Trả về người dùng vừa tạo
        return response()->json($user, 201);
    }

    public function destroy($id)
    {
        \Log::info("Deleting user with ID: $id");
        $user = User::find($id);

        if (!$user) {
            \Log::error("User not found for ID: $id");
            return response()->json(['error' => 'User not found'], 404);
        }

        $user->delete();
        \Log::info("User deleted successfully for ID: $id");
        return response()->json(['message' => 'User deleted successfully'], 200);
    }
}
