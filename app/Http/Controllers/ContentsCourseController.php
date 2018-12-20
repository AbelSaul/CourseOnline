<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ContentsCourse;
use App\Course;
class ContentsCourseController extends Controller
{
   public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('Subscribed');
    }
    
    public function index(Request $request)
    {


 
    }

    public function show($course_id){    
        
        $contents_course = ContentsCourse::where('course_id',$course_id)->get();
        $name_course = $this->nameCourse($course_id);
        return response()->json([
            'contents_course'    => $contents_course, 'name_course' => $name_course
        ], 200);

    } 

    public function nameCourse($course_id){
        $course = Course::where('id',$course_id)->get();
        $name = '';
        foreach ($course as $c) {
            $name = $c->name;
            return $name;
        }
    }
}
