<?php

namespace App\Http\Controllers;

use App\Models\Item;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ItemsController extends Controller
{
    public function index()
    {
        try {
            $items = Item::all();
            return response()->json([
                "status" => true,
                "message" => "Items obtained successfully",
                "data"=> $items
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
            $item = Item::findOrFail($id); 
            return response()->json([
                "status" => true,
                "message" => "Item found successfully",
                "data" => $item
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status" => false,
                "message" => $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $validatedData = $request->validate([
                "name" => "required|string|max:255",
                "individualPrice" => "required|numeric|min:0.01",
                "quantity" => "required|integer|min:1", 
                "bill_id" => "required|exists:bills,id", 
                "person_id" => "required|exists:people,id",
                "discount_id" => "nullable|exists:discounts,id", 
            ]);

            $item = Item::create($validatedData);

            return response()->json([
                "status" => true,
                "message" => "Item created successfully",
                "data" => $item
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
            $item = Item::findOrFail($id);

            $validatedData = $request->validate([
                "name" => "sometimes|string|max:255",
                "individualPrice" => "sometimes|numeric|min:0.01",
                "quantity" => "sometimes|nullable|integer|min:0",
                "bill_id" => "sometimes|exists:bills,id",
                "person_id" => "sometimes|exists:people,id",
                "discount_id" => "sometimes|nullable|exists:discounts,id",
            ]);

            $item->update($validatedData);

            return response()->json([
                "status" => true,
                "message" => "Item updated successfully",
                "data" => $item
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
            $item = Item::findOrFail($id);
            $item->delete();
            return response()->json([
                "status" => true,
                "message" => "Item deleted successfully",
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status" => false,
                "message" => $e->getMessage()
            ], 500);
        }
    }
}
