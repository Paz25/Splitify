<?php

namespace App\Http\Controllers;

use App\Models\People;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class PeopleController extends Controller
{
    public function index()
    {
        try {
            $people = People::all();
            return response()->json([
                "status" => true,
                "message" => "People obtained successfully",
                "data"=> $people
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
            $people = People::findOrFail($id);
            return response()->json([
                "status"=> true,
                "message"=> "Person found successfully",
                "data"=> $people
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
                'name' => 'required|string|max:255',
            ]);

            $people = People::create($validatedData);

            return response()->json([
                'status'=> true,
                'message'=> 'Person created successfully',
                'data'=> $people
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
            $person = People::findOrFail($id);
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
            ]);
            $person->update($validatedData);
            return response()->json([
                'status'=> true,
                'message'=> 'Person updated successfully',
                'data'=> $person
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
            $person = People::findOrFail($id);
            $person->delete();
            return response()->json([
                "status"=> true,
                "message"=> "Person deleted successfully"
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                "status"=> false,
                "message"=> $e->getMessage()
            ],500);
        }
    }
}
