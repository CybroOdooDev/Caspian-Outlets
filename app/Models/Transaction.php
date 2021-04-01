<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = ['user_id', 'amount', 'exttrid', 'reference', 'service_id', 'ts', 'currency_code', 'currency_value', 'mode_of_payment', 'redirect_url', 'callback_url', 'landingPageURL', 'status', 'responseCode', 'responseMessage'];
    public $timestamps = false;
}