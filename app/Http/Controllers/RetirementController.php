<?php

namespace App\Http\Controllers;

use App\Consultant;
use Illuminate\Http\Request;
use App\Retirement;
use App\ConsultantHistory;

class RetirementController extends Controller
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
        //
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

    public function submit_retirement(Request $request)
    {

        $retirement = new Retirement();
        $data = $request->only($retirement->getFillable());


        if ($retirement->fill($data)->save()) {
            ConsultantHistory::add_to_history('Retiro', 'Solicitud de Retiro', $retirement->consultant_id);
            return json_encode('ok');
        }else{
            return json_encode('fail');
        }
        return json_encode($request);
    }

    public function get_retirement_consultant(Request $request){
        $consultant = Consultant::where('id',$request->consultant_id)->first();

        $result=$consultant->retirements;

        return json_encode($result);
    }
}
