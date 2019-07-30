<?php

namespace App\Http\Controllers;

use App\Dating;
use Illuminate\Http\Request;
use App\HistoryUser;
use App\ConsultantHistory;
use App\Consultant;

class DatingController extends Controller
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
        $dating = new Dating();

        $data = $request->only($dating->getFillable());
        $fecha = $request->for_date.' '.$request->for_time;

        $dating->fill($data);
        $date= strtotime($fecha);
        $to_date=date('Y-m-d h:i:s', $date);
        $dating->for_date=$to_date;

        if($dating->save()){
            HistoryUser::add_to_history('Solicitud de Asesoria',$dating->summary,$dating->user_id);
            ConsultantHistory::add_to_history('Asesoria solicitada',$dating->summary,$dating->consultant_id);
            return response()->json('ok');
        }

        return json_encode($dating);


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Dating  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Dating  $dating
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
     * @param  \App\Dating  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Dating  $dating
     * @return \Illuminate\Http\Response
     */
    public function destroy($dating)
    {
        //
    }

    public function datings_by_consultant(Request $request){

        $consultant = Consultant::where('id',$request->consultant_id)->first();

        return response()->json($consultant->datings);
    }
}
