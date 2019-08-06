<?php

namespace App\Http\Controllers;

use App\Dating;
use Illuminate\Http\Request;
use App\HistoryUser;
use App\ConsultantHistory;
use App\Consultant;
use Illuminate\Foundation\Auth\User;

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

        $dating->fill($data);
        // $date= strtotime($fecha);
        // $to_date=date('Y-m-d', $date);
        // $dating->for_date=$to_date;

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

        $result = Consultant::join('datings','datings.consultant_id','=','consultants.id')
        ->join('users','users.id','=','datings.user_id')
        ->select('datings.*','users.name as solname','users.lastname as solape')
        ->where('consultants.id',$request->consultant_id)
        ->where('datings.dating_status','Solicitado')
        ->get();

        return response()->json($result);
    }

    public function datings_by_user(Request $request){

        $result = User::join('datings','datings.user_id','=','users.id')
        ->join('consultants','consultants.id','=','datings.consultant_id')
        ->select('datings.*','consultants.name as conname','consultants.lastname as conape')
        ->where('users.id',$request->user_id)
        ->get();

        return response()->json($result);
    }

    public function response_request(Request $request){
        $dating = Dating::where('id',$request->id)->first();

        $data = $request->all();

        if ($dating->update($data)) {
            HistoryUser::add_to_history('Asesoria',"Asesoria ".$dating->title.": ".$dating->dating_status,$dating->user_id);
            ConsultantHistory::add_to_history('Asesoria',"Asesoria ".$dating->title.": ".$dating->dating_status,$dating->consultant_id);
            return json_encode('ok');
        }

        return json_encode('fail');
    }
}
