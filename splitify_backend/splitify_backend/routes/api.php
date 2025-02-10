<?php

use App\Http\Controllers\BillsController;
use App\Http\Controllers\DiscountsController;
use App\Http\Controllers\ItemsController;
use App\Http\Controllers\PeopleController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::resource("bills", BillsController::class);
Route::resource("people", PeopleController::class);
Route::resource("discounts", DiscountsController::class);
Route::resource("items", ItemsController::class);


