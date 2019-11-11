<?php

namespace App\Http\Controllers;

use App\HistoryUser;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HistoryUserController extends Controller
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
        $item = new HistoryUser();

        $data = $request->only($item->getFillable());

        if ($item->fill($data)->save()){
            json_encode('ok');
        }else{
            json_encode('fail');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\HistoryUser  $historyUser
     * @return \Illuminate\Http\Response
     */
    public function show($historyUser)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\HistoryUser  $historyUser
     * @return \Illuminate\Http\Response
     */
    public function edit($historyUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\HistoryUser  $historyUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $historyUser)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\HistoryUser  $historyUser
     * @return \Illuminate\Http\Response
     */
    public function destroy($historyUser)
    {
        //
    }

    public function all_histories(Request $request){
        $user = User::where('id',$request->user_id)->first();

        $histories=$user->histories;

        return json_encode($histories);

    }

    public function global_history(Request $request){
        $data = DB::select('select \'Usuario\' as type_user,concat(b.name,\' \',b.lastname) as name, a.movement_type, a.description, a.created_at from history_user a
        inner join users b on (a.user_id=b.id)
        where movement_type in (\'Inicio de sesion\',\'Enlace Caido\',\'Entrada a sala de conferencia\')
        union
        select \'Asesor\' as type_user, concat(d.name,\' \',d.lastname) as name, c.movement_type,c.description, c.created_at from consultant_history c
        inner join consultants d on (c.consultant_id=d.id)
        where movement_type=\'Inicio de sesion\'
        order by created_at desc;', []);

        return json_encode($data);

    }
}
