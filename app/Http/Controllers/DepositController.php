<?php

namespace App\Http\Controllers;

use App\Deposit;
use Illuminate\Http\Request;
use App\TransactionUser;

class DepositController extends Controller
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
     * @param  \App\Deposit  $deposit
     * @return \Illuminate\Http\Response
     */
    public function show($deposit)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Deposit  $deposit
     * @return \Illuminate\Http\Response
     */
    public function edit($deposit)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Deposit  $deposit
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $deposit)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Deposit  $deposit
     * @return \Illuminate\Http\Response
     */
    public function destroy($deposit)
    {
        //
    }

    public function upload(Request $request){

    if(!$request->hasFile('deposit')) {
        return response()->json(['upload_file_not_found'], 400);
    }

    $file = $request->file('deposit');
    if(!$file->isValid()) {
        return response()->json(['invalid_file_upload'], 400);
    }

    $path = public_path() . '/uploads/';
    $date = date("dmdYGi", time());
    $new_name=basename($file->getClientOriginalName(), '.'.$file->getClientOriginalExtension()).$date.'.'.$file->getClientOriginalExtension();
    $file->move($path, $new_name);

    $deposit=new Deposit();
    $deposit->amount=$_POST['amount'];
    $deposit->user_id=$_POST['user_id'];
    $deposit->deposit_status='P';
    $deposit->document=$new_name;

    if($deposit->save()){
        $transaction = new TransactionUser();
        $transaction->user_id=$deposit->user_id;
        $transaction->movement_id=$deposit->id;
        $transaction->transaction_type='Deposito';

        $transaction->save();
    }

    return response()->json($deposit);

    return json_encode($file);
    }
}
