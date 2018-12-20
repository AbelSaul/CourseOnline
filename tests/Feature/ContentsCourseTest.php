<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Http\Controllers\ContentsCourseController;
class ContentsCourseTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testShow()
    {
        $contents_course = new ContentsCourseController();
        $contents_course_object = $contents_course->show(1);
        $contents_course_array = json_encode($contents_course_object);
        $contents_course_array = json_decode($contents_course_array, true);
        $this->assertTrue(isset($contents_course_array['original']['contents_course']));
        $this->assertTrue(isset($contents_course_array['original']['name_course']));
    }

    public function testNameCourse()
    {
        $contents_course = new ContentsCourseController();
        $name_course = $contents_course->nameCourse(1);
        // have the same type and value.
        $this->assertSame('Expert PHP',$name_course);
    }
}
