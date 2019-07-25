<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Consultant;
use App\Career;
use App\BalanceConsultant;
use App\ConsultantHistory;

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

            $balance=new BalanceConsultant();
            $balance->amount=0;
            $balance->consultant_id=$career->id;
            $balance->save();

            ConsultantHistory::add_to_history('Registro',"Registro de Asesor",$career->id);


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
        $consultant = Consultant::where('email', '=', $mail)
            ->where('password', '=', $pass)->first();

        if ($consultant) {

            ConsultantHistory::add_to_history('Inicio de sesión',"Inicio de Sesión el ".@date("d/m/y"),$consultant->id);

            return json_encode($consultant);
        } else {
            return '0';
        }
    }

    public function consultant_balance(Request $request){
        $user = Consultant::where('id',$request->consultant_id)->first();
        $balance=$user->BalanceConsultant;

        return json_encode($balance);
    }

    public function all_consultants(Request $request){
        if('ALL'===$request->type){
            $consultants=Consultant::all();
        }else{
            $consultants=Consultant::join('career_consultant','career_consultant.consultant_id','=','consultants.id')
            ->join('careers','careers.id','=','career_consultant.career_id')
            ->select('consultants.*','careers.name as career_name')->where('careers.value','=',$request->type)
            ->get();
        }

        return json_encode($consultants);
    }
}
