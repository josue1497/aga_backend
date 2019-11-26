<?php

namespace App\Http\Controllers;

use App\Attached;
use App\Dating;
use Illuminate\Http\Request;

class AttachedController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id = $request->dating_id;

        $files = $_FILES;

        $DOCS_STRING = 'docs';

        $saved_files = 0;

        for ($i = 0; $i <= count($files); $i++) {

            if (!$request->hasFile($DOCS_STRING . $i)) {
                return response()->json(['upload_file_not_found'], 400);
            }

            $file = $request->file($DOCS_STRING . $i);
            if (!$file->isValid()) {
                return response()->json(['invalid_file_upload'], 400);
            }

            $path = public_path() . '/uploads/';
            $date = date("dmdYGi", time());
            $new_name = basename($file->getClientOriginalName(), '.' . $file->getClientOriginalExtension()) . $date . '.' . $file->getClientOriginalExtension();
            $file->move($path, $new_name);

            $record = new Attached();
            $record->dating_id = $id;
            $record->url = $new_name;
            $record->name = $new_name;

            if ($record->save()) {
                $saved_files++;
            }else{
                $file->delete($path);
            }
        }

        if ($saved_files > 0) {
            $response = ['response' => 'ok', 'saved_files' => $saved_files];
        }else{
            $response = ['response' => 'fail', 'saved_files' => 0];
        }

        return json_encode($response);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function get_all_attached(Request $request)
    {
        $dating = Dating::where('id', $request->dating_id)->first();
        $data = $dating->attached;
        return json_encode($data);
    }
}
