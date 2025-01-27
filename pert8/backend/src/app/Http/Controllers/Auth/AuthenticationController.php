<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthenticationController extends Controller
{
    public function login(LoginRequest $request)
    {
        $request->validated();

        $user = User::whereEmail($request->email)->first();
        if (! $user || ! Hash::check($request->password, $user->password)) {
            return response([
                'message' => 'Invalid credentials',
            ], 401);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        return response([
            'user' => $user,
            'token' => $token,
        ], 200);
    }
}
