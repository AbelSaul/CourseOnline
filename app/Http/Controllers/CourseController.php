<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Course;

class CourseController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');


    }
    
    public function index()
    {
        $courses = Course::all();
        
        return response()->json([
            'courses'    => $courses,
        ], 200);
    

        // $theobject= response()->json([
        //     'courses'    => $courses,
        // ], 200);
        // $thearray = (array) $theobject;
        // echo '<pre>';
        // print_r( $thearray );
        // echo '</pre>';
        // exit;

    }

}
