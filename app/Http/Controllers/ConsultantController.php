<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Consultant;
use App\Career;

class ConsultantController extends Controller
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

        $career = new Consultant();

        $exist2=(new Consultant())->where('email', '=', $request->email)->first();
        $exist1 = (new Consultant())->where('identification_document', '=', $request->identification_document)->first();

        if($exist1){
            return json_encode('Ya existe Identificación esta registrada.');
        }

        if($exist2){
            return json_encode('Esta direccion de correo electrónico ya esta en Uso.');
        }

        $data = $request->only($career->getFillable());

        $career_rel=$request->career_id;
        $to_career=Career::where('id', $career_rel)->get();



        if ($career->fill($data)->save()) {
            $career->Careers()->attach($to_career);
            return json_encode('success');
        } else {
            return json_encode('fail');;
        }
        return $career;
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

    public function singin(Request $request)
    {
        $mail = $request->email;
        $pass = $request->password;
        $consultant = (new Consultant())->find(1)->where('email', '=', $mail)
            ->where('password', '=', $pass)->first();

        if ($consultant) {
            return json_encode($consultant);
        } else {
            return '0';
        }
    }
}
