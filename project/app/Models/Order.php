<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
	protected $fillable = ['user_id', 'cart', 'method','delivery', 'pickup_location', 'totalQty', 'pay_amount', 'txnid', 'charge_id', 'order_number', 'payment_status', 'customer_email', 'customer_name', 'customer_phone', 'customer_address', 'customer_city', 'customer_zip','delivery_name', 'delivery_email', 'delivery_phone', 'delivery_address', 'delivery_city', 'delivery_zip', 'order_note', 'status'];

    public function tracks()
    {
        return $this->hasMany('App\Models\OrderTrack','order_id');
    }

}
