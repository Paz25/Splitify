<?php

namespace App\Http\Controllers;

use App\Models\Discounts;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DiscountsController extends Controller
{
    public function index()
    {
        try {
            $discounts = Discounts::all();
            return response()->json([
                "status" => true,
                "message" => "Discounts obtained successfully",
                "data"=> $discounts
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        try {
            $discounts = Discounts::findOrFail($id);
            return response()->json([
                "status"=> true,
                "message"=> "Discount found successfully",
                "data"=> $discounts
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'nominal' => 'required|numeric|min:0.01',
            ]);

            $discounts = Discounts::create($validatedData);

            return response()->json([
                'status'=> true,
                'message'=> 'Discount created successfully',
                'data'=> $discounts
            ], 201);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                "status" => false,
                "message" => $e->validator->errors()
            ], 400);
        } catch (\Exception $e) {
            return response()->json([
                "status" => false,
                "message" => $e->getMessage()
            ], status: 500);
        }
    }
    
    public function update(Request $request, $id)
    {
        try {
            $discount = Discounts::find($id);
            $validatedData = $request->validate([
                'nominal' => 'required|numeric|min:0.01',
            ]);
            $discount->update($validatedData);
            return response()->json([
                "status"=> true,
                "message"=> "Discount updated successfully",
                "data"=> $discount
            ], 200);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                "status" => false,
                "message" => $e->validator->errors()
            ], 400);
        } catch (\Exception $e) {
            return response()->json([
                "status" => false,
                "message" => $e->getMessage()
            ], 500);
        }
    }
    public function destroy($id)
    {
        try {
            $discount = Discounts::find($id);
            $discount->delete();
            return response()->json([
                "status"=> true,
                "message"=> "Discount deleted successfully",
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ],500);
        }
    }
}
