<?php

namespace App\Http\Controllers;

use App\Models\Bills;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BillsController extends Controller
{
    public function index()
    {
        try {
            $bills = Bills::all();
            return response()->json([
                "status" => true,
                "message" => "Bills obtained successfully",
                "data"=> $bills
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ],500);
        }
    }
    
    public function show($id)
    {
        try {
            $bill = Bills::findOrFail($id);
            return response()->json([
                "status"=> true,
                "message"=> "Bill found successfully",
                "data"=> $bill
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ],500);
        } 
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                'location' => 'required|string|max:255',
                'category' => 'required|string|max:255',
                'date' => 'required|date',
                'imageSrc' => 'required|string|max:255',
            ]);

            $bill = Bills::create($validatedData);

            return response()->json([
                "status" => true,
                "message" => "Bill created successfully",
                "data" => $bill
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
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $bill = Bills::findOrFail($id);
            $bill->update($request->all());
            return response()->json([
                "status"=> true,
                "message"=> "Bill updated successfully",
                "data"=> $bill
            ],200);
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
            $bill = Bills::findOrFail($id);
            $bill->delete();
            return response()->json([
                "status"=> true,
                "message"=> "BIll deleted successfully"
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ], 500);
        }
    }
}
