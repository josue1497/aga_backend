<?php

namespace App\Http\Controllers;

use App\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
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
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
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
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function get_payments_users(Request $request)
    {
        $payments = DB::select('select b.title, b.for_date, concat(d.name,\' \',d.lastname)
                                as consultantname, a.dating_amount, a.payment_status
                                from payments a
                                inner join datings b on (a.dating_id=b.id)
                                inner join users c on (c.id=b.user_id)
                                inner join consultants d on (d.id=b.consultant_id)
                                where c.id=? order by a.created_at desc', [$request->user_id]);

        return json_encode($payments);
    }

    public function get_payments_consultant(Request $request)
    {
        $payments = DB::select('select b.title, b.for_date, concat(c.name,\' \',c.lastname) as username,
        a.dating_amount, a.payment_status from payments a
        inner join datings b on (a.dating_id=b.id)
        inner join users c on (c.id=b.user_id)
        inner join consultants d on (d.id=b.consultant_id)
        where d.id=?
        order by a.created_at desc', [$request->consultant_id]);

        return json_encode($payments);
    }
}
