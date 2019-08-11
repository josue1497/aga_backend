<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AccountConsultant;
use App\Consultant;
use App\ConsultantHistory;

class AccountConsultantController extends Controller
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
        $acct = new AccountConsultant();
        $data = $request->only($acct->getFillable());

        if ($acct->fill($data)->save()) {
            ConsultantHistory::add_to_history('Cuenta Bancaria', 'Adicion de nueva cuenta bancaria.', $acct->consultant_id);
            return json_encode('ok');
        } else {
            return json_encode('fail');
        }
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
    { }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = AccountConsultant::where('id', $id);
        $data = $request->all();

        if ($user->update($data)) {
            HistoryUser::add_to_history('Actualización de Perfil', "Modificacion de la informacion de perfil de usuario el " . @date("d/m/y"), $id);
            return response()->json(['Actualizacion Exitosa'], 200);
        }

        return response()->json(['Error al actualizar usuario'], 400);
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

    public function get_account_consultant(Request $request)
    {
        $consultant = Consultant::where('id', $request->consultant_id)->first();

        $accts = $consultant->AccountConsultant;

        return json_encode($accts);
    }

    public function update_use_acct(Request $request)
    {
        $acct = AccountConsultant::where('id', $request->id)->first();

        $acct->to_use = $request->to_use;

        if ($acct->save()) {
            return json_encode('ok');
        }

        return json_encode('fail');
    }
}
