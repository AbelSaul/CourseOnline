<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //Fields fillables
	 protected $fillable =[
        'name','description'
    ];

    public function courses()
    {
        return $this->hasMany('App\Course');
    }
 
}
