<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class PatientController extends Controller
{
    public function index()
    {
        $patients = DB::connection('sqlsrv')
            ->table('tbl_pasien')
            ->select('id', 'nama_pasien', 'jenis_kelamin', 'no_mr')
            ->orderBy('id', 'desc')
            ->limit(100)
            ->get();

        return view('patients.index', [
            'patients' => $patients,
        ]);
    }
}
