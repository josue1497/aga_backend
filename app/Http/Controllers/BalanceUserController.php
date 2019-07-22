<?php

namespace App\Http\Controllers;

use App\BalanceUser;
use Illuminate\Http\Request;

class BalanceUserController extends Controller
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
     * @param  \App\BalanceUser  $balanceUser
     * @return \Illuminate\Http\Response
     */
    public function show($balanceUser)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\BalanceUser  $balanceUser
     * @return \Illuminate\Http\Response
     */
    public function edit($balanceUser)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\BalanceUser  $balanceUser
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $balanceUser)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\BalanceUser  $balanceUser
     * @return \Illuminate\Http\Response
     */
    public function destroy($balanceUser)
    {
        //
    }

    public function get_balance(Request $request){
        $balance = BalanceUser::where('user_id',$request->user_id)->first();

        if($balance){
            return json_encode($balance->amount);
        }else{
            return json_encode('Saldo no Disponible para este usuario');
        }
    }
}
