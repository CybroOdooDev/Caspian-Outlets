<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Delivery extends Model
{
    protected $fillable = ['user_id', 'title', 'subtitle', 'price'];

    public $timestamps = false;

}