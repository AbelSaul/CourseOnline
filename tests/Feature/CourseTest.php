<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Http\Controllers\CourseController;
class CourseTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testIndex()
    {

    	$courses = new CourseController();
        $courses_object = $courses->index();
        $courses_array = json_encode($courses_object);
        $courses_array = json_decode($courses_array, true);
        $this->assertTrue(isset($courses_array['original']['courses']));
    }
}
