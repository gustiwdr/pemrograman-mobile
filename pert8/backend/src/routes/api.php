<?php

use App\Filament\Admin\Resources\LoginResource\Api\Handlers\CreateHandler;
use App\Filament\Admin\Resources\LoginResource\Api\Handlers\DeleteHandler;
use App\Filament\Admin\Resources\LoginResource\Api\Handlers\DetailHandler;
use App\Filament\Admin\Resources\LoginResource\Api\Handlers\PaginationHandler;
use App\Filament\Admin\Resources\LoginResource\Api\Handlers\UpdateHandler;
use App\Http\Controllers\Auth\AuthenticationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('login', [AuthenticationController::class, 'login']);

// Route::prefix('login')->group(function () {
//     Route::post('/', [CreateHandler::class, 'handler'])->name('api.logins.create');
//     Route::get('/', [PaginationHandler::class, 'handler'])->name('api.logins.pagination');
//     Route::get('/{id}', [DetailHandler::class, 'handler'])->name('api.logins.detail');
//     Route::put('/{id}', [UpdateHandler::class, 'handler'])->name('api.logins.update');
//     Route::delete('/{id}', [DeleteHandler::class, 'handler'])->name('api.logins.delete');
// });
