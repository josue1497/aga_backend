<?php

namespace App\Http\Controllers;

use App\AdvisoryReport;
use App\Consultant;
use Illuminate\Http\Request;

class AdvisoryReportController extends Controller
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
        $report = new AdvisoryReport();

        $data = $request->only($report->getFillable());

        if ($report->fill($data)->save()) {
            return json_encode('success');
        }else{
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

    public function get_all_reports(Request $request){
        $result = Consultant::join('datings', 'datings.consultant_id', '=', 'consultants.id')
        ->join('advisory_report','advisory_report.dating_id','=','datings.id')
        ->join('users', 'datings.user_id','=','users.id')
        ->select('advisory_report.*', 'consultants.name as consultant_name', 'consultants.lastname as consulant_lastname','datings.for_date', 'users.*')
        ->get();

        return json_encode($result);
    }
}
