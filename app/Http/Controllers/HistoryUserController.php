<?php

namespace App\Http\Controllers;

use App\HistoryUser;
use App\User;
use Illuminate\Http\Request;

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
        //
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
}
