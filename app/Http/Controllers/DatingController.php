<?php

namespace App\Http\Controllers;

use App\BalanceConsultant;
use App\Dating;
use Illuminate\Http\Request;
use App\HistoryUser;
use App\ConsultantHistory;
use App\Consultant;
use Illuminate\Foundation\Auth\User;
use App\BalanceUser;
use App\Payment;
use Illuminate\Support\Facades\DB;
use Symfony\Component\HttpFoundation\Response;

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

        $balance = BalanceUser::where('user_id', $request->user_id)->first();

        if($balance->amount<$data['price']){
            return json_encode('No tiene fondo suficientes para cubrir esta asesoria.');
        }

        if(strtotime(date("d-m-Y H:i:00",time()))>strtotime($data['for_date'])){
            return json_encode('No puede apartar citas para días pasados.');
        }

        $dating->fill($data);

        if($dating->save()){
            $balance = BalanceUser::where('user_id', $dating->user_id)->first();
            $balance->amount = ($balance->amount-$dating->price);
            $balance->save();

            $payment=new Payment();
            $payment->dating_id=$dating->id;
            $payment->dating_amount=$dating->price;
            $payment->payment_status='P';
            $payment->save();

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
        ->orderBy('datings.for_date', 'DESC')
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

    public function cancelled_dating(Request $request){
        $dating = Dating::where('id',$request->dating_id)->first();

        $dating->dating_status='Cancelada';
        if($dating->save()){

            $balance = BalanceUser::where('user_id', $dating->user_id)->first();
            $balance->amount = ($balance->amount+$dating->price);
            $balance->save();

            $payment=Payment::where('dating_id',$dating->id)->first();
            if($payment){
                $payment->payment_status='A';
                $payment->save();
            }


            HistoryUser::add_to_history('Cancelacion de Asesoria.','Cancelo una solicitud de asesoria para el dia '.$dating->for_date, $dating->user_id);
            return json_encode('ok');
        }

        return json_encode('fail');
    }

    public function finished_dating(Request $request){
        $dating = Dating::where('id',$request->dating_id)->first();

        $dating->dating_status='Finalizada';
        if($dating->save()){

            $balance = BalanceConsultant::where('consultant_id', $dating->consultant_id)->first();
            $balance->amount = ($balance->amount+$dating->price);
            $balance->save();

            $payment=Payment::where('dating_id',$dating->id)->first();

            if($payment){
                $payment->payment_status='PG';
                $payment->save();
            }

            HistoryUser::add_to_history('Cierre de Asesoria.','Cierre de una asesoria para el dia '.$dating->for_date, $dating->user_id);
            return json_encode('ok');
        }

        return json_encode('fail');
    }

    public function report_for_states(Request $request){
        $report=DB::select('select count(b.state) counter, b.state from datings a
        inner join users b on (a.user_id=b.id)
        group by b.state
        order by count(b.state) desc', []);

        return json_encode($report);

    }

    public function report_for_careers(Request $request){
        $report=DB::select('select count(d.name) as counter, d.name career, month(a.for_date) mes, year(a.for_date) anio from datings a
        inner join consultants b on (a.consultant_id=b.id)
        inner join career_consultant c on (c.consultant_id=b.id)
        inner join careers d on (c.career_id=d.id)
        group by d.name, month(a.for_date), year(a.for_date)
        order by a.for_date', []);

        return json_encode($report);
    }

}
