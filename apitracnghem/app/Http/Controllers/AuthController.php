<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('UserName', 'Password');

        $user = User::where('UserName', $credentials['UserName'])->first();

        if ($user && $user->Password === md5($credentials['Password'])) {
            $token = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'message' => 'Login successful',
                'token' => $token,
                'user' => [
                    'Id' => $user->id,
                    'RoleId' => $user->role_id,
                    'FullName' => $user->full_name,
                    'UserName' => $user->username,
                    'CreateAt' => $user->created_at,
                ],
            ]);
        }

        return response()->json(['error' => 'Invalid credentials'], 401);
    }
}
