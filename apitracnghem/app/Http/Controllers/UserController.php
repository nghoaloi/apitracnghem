<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function export()
    {
        $user = User::all();
        // Trả về trực tiếp mảng JSON
        return response()->json($user);
    }

    public function exportById($id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json(['error' => 'user not found'], 404);
        }

        return response()->json($user);
    }

    public function store(Request $request)
{   
    try {
        // Validate dữ liệu đầu vào
        $validatedData = $request->validate([
            'RoleId' => 'required|integer',
            'FullName' => 'required|string|max:255',
            'UserName' => 'required|string|max:255|unique:user,UserName',
            'Password' => 'required|string|min:6',
        ]);

        // Hash mật khẩu
        $validatedData['Password'] = md5($validatedData['Password']);

        // Tạo người dùng mới
        $user = User::create($validatedData);

        // Trả về người dùng vừa tạo
        return response()->json($user, 201);
    } catch (\Exception $e) {
        // Trả về thông báo lỗi nếu có
        return response()->json([
            'error' => $e->getMessage(),
        ], 500);
    }
}
    public function destroy($id)
    {    
        try {
            $user = User::find($id);

            if (!$user) {
                \Log::error("User not found for ID: $id");
                return response()->json(['error' => 'User not found'], 404);
            }

            $user->delete();
            \Log::info("User deleted successfully for ID: $id");
            return response()->json(['message' => 'User deleted successfully'], 200);
        } catch (\Exception $e) {
            \Log::error('Error deleting user: ' . $e->getMessage());
            return response()->json(['error' => 'lỗi khi xoá vướng ràng buột'], 500);
        }
    }
    public function login(Request $request)
    {
        // Validate dữ liệu đầu vào
        $validator = Validator::make($request->all(), [
            'UserName' => 'required|string',
            'Password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => 'Thông tin đăng nhập không hợp lệ',
                'errors' => $validator->errors()
            ], 422);
        }

        // Tìm user theo username
        $user = User::where('UserName', $request->UserName)->first();

        // Nếu không tìm thấy user
        if (!$user) {
            return response()->json([
                'message' => 'Sai tên đăng nhập hoặc mật khẩu'
            ], 401);
        }

            // Kiểm tra mật khẩu
            if (md5($request->Password) !== $user->Password) {
                return response()->json([
                    'message' => 'Sai tên đăng nhập hoặc mật khẩu'
                ], 401);
            }

        // Tạo token
        $token = $user->createToken('apitracnghiem')->plainTextToken;
        
        // Cập nhật thời gian hết hạn của token (1 giờ sau khi tạo)
        $user->tokens()->latest()->first()->update([
            'expires_at' => now()->addHour()  // Thêm thời gian hết hạn sau 1 giờ
        ]);

        return response()->json([
            'message' => 'Đăng nhập thành công',
            'token' => $token,
            'UserName' => $user->UserName,
            'RoleId'=>$user->RoleId,
        ]);
    }
}
