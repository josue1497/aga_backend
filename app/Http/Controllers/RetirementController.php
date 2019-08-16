<?php

namespace App\Http\Controllers;

use App\BalanceConsultant;
use App\Consultant;
use Illuminate\Http\Request;
use App\Retirement;
use Illuminate\Support\Facades\DB;
use App\ConsultantHistory;

class RetirementController extends Controller
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

    public function submit_retirement(Request $request)
    {

        $retirement = new Retirement();
        $data = $request->only($retirement->getFillable());


        if ($retirement->fill($data)->save()) {
            ConsultantHistory::add_to_history('Retiro', 'Solicitud de Retiro', $retirement->consultant_id);
            return json_encode('ok');
        }else{
            return json_encode('fail');
        }
        return json_encode($request);
    }

    public function get_retirement_consultant(Request $request){
        $consultant = Consultant::where('id',$request->consultant_id)->first();

        $result=$consultant->retirements;

        return json_encode($result);
    }

    public function get_request_retirements(Request $request){
        $result=DB::select('select a.*, concat(b.name,\' \',b.lastname) as consultant_name from retirement a
        inner join consultants b
        on (a.consultant_id=b.id)
        where a.retirement_status=\'P\' order by a.created_at desc',[]);

        return json_encode($result);
    }

    public function upload(Request $request){

        $retirement=Retirement::where('id',$request->id)->first();

        if($retirement){
            if (!$request->hasFile('file')) {
                return response()->json(['upload_file_not_found'], 400);
            }

            $file = $request->file('file');
            if (!$file->isValid()) {
                return response()->json(['invalid_file_upload'], 400);
            }

            $path = public_path() . '/uploads/';
            $date = date("dmdYGi", time());
            $new_name = basename($file->getClientOriginalName(), '.' . $file->getClientOriginalExtension()) . $date . '.' . $file->getClientOriginalExtension();
            $file->move($path, $new_name);

            $retirement->referenceno = $_POST['referenceno'];
            $retirement->retirement_status = 'A';
            $retirement->document = $new_name;

            if ($retirement->save()) {
                $balance = BalanceConsultant::where('consultant_id', $retirement->consultant_id)->first();
                $balance->amount = ($balance->amount-$retirement->amount);
                $balance->save();

                return json_encode('ok');
            }
        }else{
            return json_encode('fail');
        }
    }

    public function reject_retirement(Request $request){
        $retirement=Retirement::where('id',$request->id)->first();
        $retirement->retirement_status='R';

        if($retirement->save()){
            return json_encode('ok');
        }else{
            return json_encode('fail');
        }
    }

}
