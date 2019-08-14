<?php

namespace App\Http\Controllers;

use App\Deposit;
use Illuminate\Http\Request;
use App\TransactionUser;
use App\HistoryUser;
use Illuminate\Http\Response;
use App\BalanceUser;
use App\User;

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

    public function upload(Request $request)
    {

        if (!$request->hasFile('deposit')) {
            return response()->json(['upload_file_not_found'], 400);
        }

        $file = $request->file('deposit');
        if (!$file->isValid()) {
            return response()->json(['invalid_file_upload'], 400);
        }

        $path = public_path() . '/uploads/';
        $date = date("dmdYGi", time());
        $new_name = basename($file->getClientOriginalName(), '.' . $file->getClientOriginalExtension()) . $date . '.' . $file->getClientOriginalExtension();
        $file->move($path, $new_name);

        $deposit = new Deposit();
        $deposit->amount = $_POST['amount'];
        $deposit->bank_from = $_POST['bank'];
        $deposit->payment_method = $_POST['payment_method'];
        $deposit->referenceno = $_POST['referenceno'];
        $deposit->user_id = $_POST['user_id'];
        $deposit->deposit_status = 'P';
        $deposit->document = $new_name;

        if ($deposit->save()) {
            $transaction = new TransactionUser();
            $transaction->user_id = $deposit->user_id;
            $transaction->movement_id = $deposit->id;
            $transaction->transaction_type = 'Deposito';

            HistoryUser::add_to_history('Deposito', 'Ingreso de deposito por ' . $deposit->amount . '$, el' . @date("d/m/y"), $deposit->user_id);

            $transaction->save();
        }

        return response()->json($deposit);
    }

    public function deposit_user(Request $request)
    {
        $user = User::where('id', $request->user_id)->first();
        $result = $user->deposits;
        return json_encode($result);
    }

    public function get_all_deposits(Request $request)
    {
        $deposits = Deposit::join('users', 'users.id', '=', 'deposits.user_id')
            ->select('deposits.*', 'users.name as nameus', 'users.lastname as lastus')
            ->get();

        return json_encode($deposits);
    }

    public function get_all_pending_deposits(Request $request)
    {
        $deposits = Deposit::join('users', 'users.id', '=', 'deposits.user_id')
            ->select('deposits.*', 'users.name as nameus', 'users.lastname as lastus')
            ->where('deposits.deposit_status', 'P')
            ->get();

        return json_encode($deposits);
    }

    public function update_deposit_status(Request $request)
    {
        $deposit = Deposit::where('id', $request->deposit_id)->first();
        $deposit->deposit_status = $request->new_status;

        if ($deposit->save()) {
            $balance = BalanceUser::where('user_id', $deposit->user_id)->first();
            $balance->amount = ($balance->amount + $deposit->amount);
            $balance->save();
            if ('A' === $deposit->deposit_status) {
                HistoryUser::add_to_history('Deposito', 'Deposito ' . $deposit->referenceno . ' Aprobado', $deposit->user_id);
            } else if ('R' === $deposit->deposit_status) {
                HistoryUser::add_to_history('Deposito', 'Deposito ' . $deposit->referenceno . ' Rechazado', $deposit->user_id);
            }

            return json_encode('ok');
        }
        return json_encode('fail');
    }
}
