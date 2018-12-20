<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    //
    protected $fillable = [
        'name',
        'author',
        'description',
        'duration',
        'url_img'
    ];

    public function category(){
        return $this->belongsTo('App\Category');
    }
}
