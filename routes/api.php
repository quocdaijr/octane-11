<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

require __DIR__.'/error.php';
require __DIR__.'/benchmark.php';
