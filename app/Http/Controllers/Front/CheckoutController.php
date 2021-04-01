<?php

namespace App\Http\Controllers\Front;

use App\Classes\GeniusMailer;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Coupon;
use App\Models\Currency;
use App\Models\Generalsetting;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderTrack;
use App\Models\PaymentGateway;
use App\Models\Pickup;
use App\Models\Product;
use App\Models\Transaction;
use App\Models\User;
use Auth;
use DB;
use Illuminate\Http\Request;
use Session;

class CheckoutController extends Controller
{
    public function loadpayment($slug1,$slug2)
    {
        if (Session::has('currency')) {
            $curr = Currency::find(Session::get('currency'));
        }
        else {
            $curr = Currency::where('is_default','=',1)->first();
        }
        $payment = $slug1;
        $pay_id = $slug2;
        $gateway = '';
        if($pay_id != 0) {
            $gateway = PaymentGateway::findOrFail($pay_id);
        }
        return view('load.payment',compact('payment','pay_id','gateway','curr'));
    }

    public function checkout()
    {
        $this->code_image();
        if (!Session::has('cart')) {
            return redirect()->route('front.cart')->with('success',"You don't have any product to checkout.");
        }
        $gs = Generalsetting::findOrFail(1);
        $dp = 1;
        $vendor_delivery_id = 0;
        $vendor_packing_id = 0;
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }

// If a user is Authenticated then there is no problm user can go for checkout

        if(Auth::guard('web')->check())
        {
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $products = $cart->items;

                // Delivery Method
                $delivery_data  = DB::table('shippings')->where('user_id','=',0)->get();

                // Packaging
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();

                foreach ($products as $prod) {
                    if($prod['item']['type'] == 'Physical')
                    {
                        $dp = 0;
                        break;
                    }
                }
                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;     
                $total = $total + 0;               
                }
                else {
                $total = Session::get('coupon_total');  
                $total = $total + round(0 * $curr->value, 2); 
                }
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'delivery_cost' => 0, 'digital' => $dp, 'curr' => $curr,'delivery_data' => $delivery_data,'package_data' => $package_data, 'vendor_delivery_id' => $vendor_delivery_id, 'vendor_packing_id' => $vendor_packing_id]);             
        }

        else

        {
// If guest checkout is activated then user can go for checkout
           	if($gs->guest_checkout == 1)
              {
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $products = $cart->items;

                // Delivery Method
                $delivery_data  = DB::table('shippings')->where('user_id','=',0)->get();

                // Packaging
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();

                foreach ($products as $prod) {
                    if($prod['item']['type'] == 'Physical')
                    {
                        $dp = 0;
                        break;
                    }
                }
                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;     
                $total = $total + 0;               
                }
                else {
                $total = Session::get('coupon_total');  
                $total =  str_replace($curr->sign,'',$total) + round(0 * $curr->value, 2); 
                }
                foreach ($products as $prod) {
                    if($prod['item']['type'] != 'Physical')
                    {
                        if(!Auth::guard('web')->check())
                        {
                $ck = 1;
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'delivery_cost' => 0, 'checked' => $ck, 'digital' => $dp, 'curr' => $curr,'delivery_data' => $delivery_data,'package_data' => $package_data, 'vendor_delivery_id' => $vendor_delivery_id, 'vendor_packing_id' => $vendor_packing_id]);  
                        }
                    }
                }
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'delivery_cost' => 0, 'digital' => $dp, 'curr' => $curr,'delivery_data' => $delivery_data,'package_data' => $package_data, 'vendor_delivery_id' => $vendor_delivery_id, 'vendor_packing_id' => $vendor_packing_id]);                 
               }

// If guest checkout is Deactivated then display pop up form with proper error message

                    else{
                $gateways =  PaymentGateway::where('status','=',1)->get();
                $pickups = Pickup::all();
                $oldCart = Session::get('cart');
                $cart = new Cart($oldCart);
                $products = $cart->items;

                // Delivery Method
                $delivery_data  = DB::table('shippings')->where('user_id','=',0)->get();

                // Packaging
                $package_data  = DB::table('packages')->where('user_id','=',0)->get();



                $total = $cart->totalPrice;
                $coupon = Session::has('coupon') ? Session::get('coupon') : 0;
                if($gs->tax != 0)
                {
                    $tax = ($total / 100) * $gs->tax;
                    $total = $total + $tax;
                }
                if(!Session::has('coupon_total'))
                {
                $total = $total - $coupon;     
                $total = $total + 0;               
                }
                else {
                $total = Session::get('coupon_total');  
                $total = $total + round(0 * $curr->value, 2); 
                }
                $ck = 1;
        return view('front.checkout', ['products' => $cart->items, 'totalPrice' => $total, 'pickups' => $pickups, 'totalQty' => $cart->totalQty, 'gateways' => $gateways, 'delivery_cost' => 0, 'checked' => $ck, 'digital' => $dp, 'curr' => $curr,'delivery_data' => $delivery_data,'package_data' => $package_data, 'vendor_delivery_id' => $vendor_delivery_id, 'vendor_packing_id' => $vendor_packing_id]);                 
                    }
        }

    }
    public function makePaymentMoMoANDCard(request $request)
    {
        Session::put('request',$request->all());
        // dd($request->all());
        // print_r($request->get('total'));
        $total=$request->get('total');
        $totalAmount=$request->get('total')."GHS";
        $user_id = $request->get('user_id');
        $randStr=time().rand(0,100000000000);
        $encrypted_userID = $user_id . '@' . $randStr;
        $exttrid=$encrypted_userID;
        if($request->get('paymentMethod') == '9')
        {
        //  orchard code 
        
        $service_url = 'https://payments.anmgw.com/third_party_request';
        $service_id = "1277";
        $client_key = "f4Jd8/G+JfKni2NBxQxSH/OWADS+B4mMkwjpXFrVScQv56JEMSJT4buASsLwO+DMrJWKry88pIx0YQN1Qfp4YQ==";
        $secret_key = "hJP2W2I8Dj8lJxhv4cVeJYjPzTS0VDtvq8jwHTcY0LU+88eCY3vGAujU0EsfHwgO7te3bl7+LHEcmxx33OTaVQ==";
        $reference = 'caspianoutletsProduct';
        $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
        $callback_url = $actual_link.'/api/callBackMoMoANDCard';
        $landingPageURL = $actual_link.'/checkout/payment/return';
        $mode_of_payment = 'CRM';
        $currency_code = 'GHS';
        $user_id = $request->get('user_id');
  
        $date = new \DateTime("now", new \DateTimeZone('UTC') );
        $ts = $date->format('Y-m-d H:i:s');
        // echo $ts;
        
        // exit;
        $data = array('amount' => $total,'exttrid'=>$exttrid,'reference'=>$reference,'callback_url'=>$callback_url,'service_id'=>$service_id,'ts'=>$ts,'landing_page'=>$landingPageURL,'payment_mode'=>$mode_of_payment,'currency_code'=>$currency_code,'currency_val'=>$totalAmount);
        $data_string = json_encode($data);
        $signature =  hash_hmac ( 'sha256' , $data_string , $secret_key );
        // pxit;rint_r($signature);
        // e
        $auth = $client_key.':'.$signature;
        // print_r($data_string);
        // exit;
        $ch = curl_init($service_url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");   
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Authorization: '.$auth,
        'Content-Type: application/json',
        'timeout: 180',
        'open_timeout: 180'
        )
  );

  $response = curl_exec($ch);

  if($response){

    $decoded = json_decode($response);

    if(isset($decoded->redirect_url)){

    $resp_code = $decoded->resp_code;
    $resp_desc = $decoded->resp_desc;
    $redirect_url = $decoded->redirect_url;
              
    $transaction = new Transaction();
    $transaction->user_id = $user_id;
    $transaction->amount = $total;
    $transaction->exttrid = $exttrid;
    $transaction->reference = $reference;
    $transaction->service_id = $service_id;
    $transaction->ts = $ts;
    $transaction->currency_code = $currency_code;
    $transaction->currency_value = $totalAmount;
    $transaction->mode_of_payment = $mode_of_payment;
    $transaction->redirect_url = $decoded->redirect_url;;
    $transaction->callback_url = $callback_url;
    $transaction->landingPageURL = $landingPageURL;
    $transaction->status = 0;
    $transaction->responseCode = $decoded->resp_code;
    $transaction->responseMessage = $decoded->resp_desc;
    $transaction->save();

    // Redirect to payment Page 
    echo '<script type="text/javascript">window.location = "'.$redirect_url.'"</script>';

    } else {
        dd('Unauthorized IP Address. Please contact the SysAdmin for Support');
    }

  }

        // END MOMO / CARD PAYMENT
            
        }
        else
        {
            // CASH ON DELIVERY

            $req=$request->all();
            $this->cashondelivery($req);
        }
        exit;
    }

    public function landingPage()
    {
       
        
    }

    public function callBackMoMoANDCard(Request $request){

        $date = new \DateTime("now", new \DateTimeZone('UTC') );
        $ts = $date->format('Y-m-d H:i:s');

        $rs = $request->all();
        $encrypted_userID = $rs['trans_status'];
        $user_id = substr($encrypted_userID, 0, strpos($encrypted_userID, "@"));

        if(@$rs['trans_status']==='000' || @$rs['trans_status']==='200'){

            Transaction::where('exttrid', $rs["trans_ref"])->update(array(
                     'status'=>1,
                     'responseCode'=>$rs["trans_status"],
                     'responseMessage'=>$rs["message"],
                     'transaction_id'=>$rs["trans_id"],
                     'ts'=>$ts,
                        ));
                        
            // SEND EMAIL //
            //////////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////////////////////////

            $getUsersOrderDetails = \DB::table('users')
              ->select(\DB::raw("*"))
              ->join('orders', 'users.id', '=', 'orders.user_id')
              ->where("users.id", "=", $user_id)
              ->get();
    
            foreach ($getUsersOrderDetails as $orderDetails) {

            
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////

            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
            $gs = Generalsetting::findOrFail(1);
            $oldCart = Session::get('cart');
            $cart = new Cart($oldCart);
            foreach($cart->items as $key => $prod)
            {
            if(!empty($prod['item']['license']) && !empty($prod['item']['license_qty']))
            {
                    foreach($prod['item']['license_qty']as $ttl => $dtl)
                    {
                        if($dtl != 0)
                        {
                            $dtl--;
                            $produc = Product::findOrFail($prod['item']['id']);
                            $temp = $produc->license_qty;
                            $temp[$ttl] = $dtl;
                            $final = implode(',', $temp);
                            $produc->license_qty = $final;
                            $produc->update();
                            $temp =  $produc->license;
                            $license = $temp[$ttl];
                            $oldCart = Session::has('cart') ? Session::get('cart') : null;
                            $cart = new Cart($oldCart);
                            $cart->updateLicense($prod['item']['id'],$license);  
                            Session::put('cart',$cart);
                            break;
                        }                    
                    }
            }
            }
            $order = new Order;
            // $success_url = action('Front\PaymentController@payreturn');
            $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
            $success_url = $actual_link.'/checkout/payment/return';
            $item_name = $gs->title." Order";
            $item_number = str_random(4).time();
            $order['user_id'] = $orderDetails['user_id'];
            $order['cart'] = utf8_encode(bzcompress(serialize($cart), 9)); 
            $order['totalQty'] = $orderDetails['totalQty'];
            $order['pay_amount'] = round($orderDetails['total'] / $curr->value, 2) + $request['delivery_cost'] + $orderDetails['packing_cost'];
            $order['method'] = 'Cash on Delivery';
            $order['delivery'] = $orderDetails['delivery'];
            $order['pickup_location'] = @$orderDetails['pickup_location'];
            $order['customer_email'] = $orderDetails['email'];
            $order['customer_name'] = $orderDetails['name'];
            $order['delivery_cost'] = $orderDetails['delivery_cost'];
            $order['packing_cost'] = $orderDetails['packing_cost'];
            $order['tax'] = $orderDetails['tax'];
            $order['customer_phone'] = $orderDetails['phone'];
            $order['order_number'] = str_random(4).time();
            $order['customer_address'] = $orderDetails['address'];
            $order['customer_country'] = $orderDetails['customer_country'];
            $order['status'] = 'Completed';
            $order['payment_status'] = 'Completed';
            $order['txnid'] = 'trans_id';
            $order['customer_city'] = $orderDetails['city'];
            $order['customer_zip'] = $orderDetails['zip'];
            $order['delivery_email'] = $orderDetails['delivery_email'];
            $order['delivery_name'] = $orderDetails['delivery_name'];
            $order['delivery_phone'] = $orderDetails['delivery_phone'];
            $order['delivery_address'] = $orderDetails['delivery_address'];
            $order['delivery_country'] = $orderDetails['delivery_country'];
            $order['delivery_city'] = $orderDetails['delivery_city'];
            $order['delivery_zip'] = $orderDetails['delivery_zip'];
            $order['order_note'] = $orderDetails['order_notes'];
            $order['coupon_code'] = $orderDetails['coupon_code'];
            $order['coupon_discount'] = $orderDetails['coupon_discount'];
            $order['dp'] = $orderDetails['dp'];
            $order['payment_status'] = "Pending";
            $order['currency_sign'] = $curr->sign;
            $order['currency_value'] = $curr->value;
            $order['vendor_delivery_id'] = $orderDetails['vendor_delivery_id'];
            $order['vendor_packing_id'] = $orderDetails['vendor_packing_id'];

                if (Session::has('affilate')) 
                {
                    $val = $request['total'] / 100;
                    $sub = $val * $gs->affilate_charge;
                    $user = User::findOrFail(Session::get('affilate'));
                    $user->affilate_income += $sub;
                    $user->update();
                    $order['affilate_user'] = $user->name;
                    $order['affilate_charge'] = $sub;
                }
            $order->save();

            $track = new OrderTrack;
            $track->title = 'Pending';
            $track->text = 'You have successfully placed your order.';
            $track->order_id = $order->id;
            $track->save();

            $notification = new Notification;
            $notification->order_id = $order->id;
            $notification->save();
                        if($orderDetails['coupon_id'] != "")
                        {
                        $coupon = Coupon::findOrFail($orderDetails['coupon_id']);
                        $coupon->used++;
                        if($coupon->times != null)
                        {
                                $i = (int)$coupon->times;
                                $i--;
                                $coupon->times = (string)$i;
                        }
                            $coupon->update();

                        }

            foreach($cart->items as $prod)
            {
                $x = (string)$prod['size_qty'];
                if(!empty($x))
                {
                    $product = Product::findOrFail($prod['item']['id']);
                    $x = (int)$x;
                    $x = $x - $prod['qty'];
                    $temp = $product->size_qty;
                    $temp[$prod['size_key']] = $x;
                    $temp1 = implode(',', $temp);
                    $product->size_qty =  $temp1;
                    $product->update();               
                }
            }


            foreach($cart->items as $prod)
            {
                $x = (string)$prod['stock'];
                if($x != null)
                {

                    $product = Product::findOrFail($prod['item']['id']);
                    $product->stock =  $prod['stock'];
                    $product->update();  
                    if($product->stock <= 5)
                    {
                        $notification = new Notification;
                        $notification->product_id = $product->id;
                        $notification->save();                    
                    }              
                }
            }

            Session::put('temporder',$order);
            Session::put('tempcart',$cart);

            Session::forget('cart');

            Session::forget('already');
            Session::forget('coupon');
            Session::forget('coupon_total');
            Session::forget('coupon_total1');
            Session::forget('coupon_percentage');

            // Save the session to ensure that the session is truly forgotten
            Session::save();

//////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            // $to = $orderDetails->email;
            // $subject = "Your Order Placed!!";
            // $msg = "Hello ".$orderDetails->name."!\nYou have placed a new order.\nYour order number is ".$orderDetails->order_number.".Please wait for your delivery. \nThank you.";
            // $headers = "From: Caspian Outlets<myorder@caspianoutlets.com>";
            // $response2= mail($to,$subject,$msg,$headers);
            
            // $to2 = 'myorder@caspianoutlets.com';
            // $subject2 = "New Order Recieved!!";
            // $msg2 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$orderDetails->order_number.".Please login to your panel to check. \nThank you.";
            // $headers2 = "From: Caspian Outlets<myorder@caspianoutlets.com>";
            // $response=  mail($to2,$subject2,$msg2,$headers2);
            
            // $to1 = 'dipti@pearlorganisation.com';
            // $subject1 = "New Order Recieved!!";
            // $msg1 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$orderDetails->order_number.".Please login to your panel to check. \nThank you.";
            // $headers1 = "From: Caspian Outlets<myorder@caspianoutlets.com>";
            // mail($to1,$subject1,$msg1,$headers1);

            }
            
            //////////////////////////////////////////////////////////////////////////////////////////
            //////////////////////////////////////////////////////////////////////////////////////////
             
            echo json_encode($ar=array("trans_status"=>$rs["trans_status"],"message"=>$rs["message"]));
            
            } else {
            
            echo json_encode($ar=array("responseCode"=>"000","responseMessage"=>"Callback acknowledged successfully"));
            
            }
                        
        }

    public function cashondelivery($request)
    {
    //    // print_r($request);
    //    echo '<script type="text/javascript">
    //    alert("Order has been made successfully");
    //    </script>';
    //    echo '<script type="text/javascript">
    //        window.location = "/"
    //   </script>';

    //   exit;

        if (!Session::has('cart')) {
            return redirect()->route('front.cart')->with('success',"You don't have any product to checkout.");
        }
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
        $gs = Generalsetting::findOrFail(1);
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        foreach($cart->items as $key => $prod)
        {
        if(!empty($prod['item']['license']) && !empty($prod['item']['license_qty']))
        {
                foreach($prod['item']['license_qty']as $ttl => $dtl)
                {
                    if($dtl != 0)
                    {
                        $dtl--;
                        $produc = Product::findOrFail($prod['item']['id']);
                        $temp = $produc->license_qty;
                        $temp[$ttl] = $dtl;
                        $final = implode(',', $temp);
                        $produc->license_qty = $final;
                        $produc->update();
                        $temp =  $produc->license;
                        $license = $temp[$ttl];
                         $oldCart = Session::has('cart') ? Session::get('cart') : null;
                         $cart = new Cart($oldCart);
                         $cart->updateLicense($prod['item']['id'],$license);  
                         Session::put('cart',$cart);
                        break;
                    }                    
                }
        }
        }
        $order = new Order;
        // $success_url = action('Front\PaymentController@payreturn');
        $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";
        $success_url = $actual_link.'/checkout/payment/return';
        $item_name = $gs->title." Order";
        $item_number = str_random(4).time();
        $order['user_id'] = $request['user_id'];
        $order['cart'] = utf8_encode(bzcompress(serialize($cart), 9)); 
        $order['totalQty'] = $request['totalQty'];
        $order['pay_amount'] = round($request['total'] / $curr->value, 2) + $request['delivery_cost'] + $request['packing_cost'];
        $order['method'] = 'Cash on Delivery';
        $order['delivery'] = $request['delivery'];
        $order['pickup_location'] = @$request['pickup_location'];
        $order['customer_email'] = $request['email'];
        $order['customer_name'] = $request['name'];
        $order['delivery_cost'] = $request['delivery_cost'];
        $order['packing_cost'] = $request['packing_cost'];
        $order['tax'] = $request['tax'];
        $order['customer_phone'] = $request['phone'];
        $order['order_number'] = str_random(4).time();
        $order['customer_address'] = $request['address'];
        $order['customer_country'] = $request['customer_country'];
        $order['customer_city'] = $request['city'];
        $order['customer_zip'] = $request['zip'];
        $order['delivery_email'] = $request['delivery_email'];
        $order['delivery_name'] = $request['delivery_name'];
        $order['delivery_phone'] = $request['delivery_phone'];
        $order['delivery_address'] = $request['delivery_address'];
        $order['delivery_country'] = $request['delivery_country'];
        $order['delivery_city'] = $request['delivery_city'];
        $order['delivery_zip'] = $request['delivery_zip'];
        $order['order_note'] = $request['order_notes'];
        $order['coupon_code'] = $request['coupon_code'];
        $order['coupon_discount'] = $request['coupon_discount'];
        $order['dp'] = $request['dp'];
        $order['payment_status'] = "Pending";
        $order['currency_sign'] = $curr->sign;
        $order['currency_value'] = $curr->value;
        $order['vendor_delivery_id'] = $request['vendor_delivery_id'];
        $order['vendor_packing_id'] = $request['vendor_packing_id'];

            if (Session::has('affilate')) 
            {
                $val = $request['total'] / 100;
                $sub = $val * $gs->affilate_charge;
                $user = User::findOrFail(Session::get('affilate'));
                $user->affilate_income += $sub;
                $user->update();
                $order['affilate_user'] = $user->name;
                $order['affilate_charge'] = $sub;
            }
        $order->save();

        $track = new OrderTrack;
        $track->title = 'Pending';
        $track->text = 'You have successfully placed your order.';
        $track->order_id = $order->id;
        $track->save();

        $notification = new Notification;
        $notification->order_id = $order->id;
        $notification->save();
                    if($request['coupon_id'] != "")
                    {
                       $coupon = Coupon::findOrFail($request['coupon_id']);
                       $coupon->used++;
                       if($coupon->times != null)
                       {
                            $i = (int)$coupon->times;
                            $i--;
                            $coupon->times = (string)$i;
                       }
                        $coupon->update();

                    }

        foreach($cart->items as $prod)
        {
            $x = (string)$prod['size_qty'];
            if(!empty($x))
            {
                $product = Product::findOrFail($prod['item']['id']);
                $x = (int)$x;
                $x = $x - $prod['qty'];
                $temp = $product->size_qty;
                $temp[$prod['size_key']] = $x;
                $temp1 = implode(',', $temp);
                $product->size_qty =  $temp1;
                $product->update();               
            }
        }


        foreach($cart->items as $prod)
        {
            $x = (string)$prod['stock'];
            if($x != null)
            {

                $product = Product::findOrFail($prod['item']['id']);
                $product->stock =  $prod['stock'];
                $product->update();  
                if($product->stock <= 5)
                {
                    $notification = new Notification;
                    $notification->product_id = $product->id;
                    $notification->save();                    
                }              
            }
        }

        Session::put('temporder',$order);
        Session::put('tempcart',$cart);

        Session::forget('cart');

        Session::forget('already');
        Session::forget('coupon');
        Session::forget('coupon_total');
        Session::forget('coupon_total1');
        Session::forget('coupon_percentage');

        // Save the session to ensure that the session is truly forgotten
        Session::save();
            
        //Sending Email To Buyer
        
        $to = $request['email'];
        $subject = "Your Order Placed!!";
        $msg = "Hello ".$request['name']."!\nYou have placed a new order.\nYour order number is ".$order->order_number.".Please wait for your delivery. \nThank you.";
        $headers = "From: Caspian Outlets<myorder@caspianoutlets.com>";
        // $response2= mail($to,$subject,$msg,$headers);
        
        $to2 = 'myorder@caspianoutlets.com';
        $subject2 = "New Order Recieved!!";
        $msg2 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
        $headers2 = "From: Caspian Outlets<myorder@caspianoutlets.com>";
        // $response=  mail($to2,$subject2,$msg2,$headers2);
           
        $to1 = 'dipti@pearlorganisation.com';
        $subject1 = "New Order Recieved!!";
        $msg1 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
        $headers1 = "From: Caspian Outlets<myorder@caspianoutlets.com>";
        // mail($to1,$subject1,$msg1,$headers1);
        
        // if($response)
        // {
        //    return redirect($success_url);
        // }

        echo '<script type="text/javascript">
            window.location = "'.$success_url.'"
        </script>';
        
        
/*
        if($gs->is_smtp == 1)
        {
        $data = [
            'to' => $request->email,
            'type' => "new_order",
            'cname' => $request->name,
            'oamount' => "",
            'aname' => "",
            'aemail' => "",
            'wtitle' => "",
            'onumber' => $order->order_number,
        ];

        $mailer = new GeniusMailer();
        $mailer->sendAutoOrderMail($data,$order->id);            
        }
        else
        {
           $to = $request->email;
           $subject = "Your Order Placed!!";
           $msg = "Hello ".$request->name."!\nYou have placed a new order.\nYour order number is ".$order->order_number.".Please wait for your delivery. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);            
        }
        //Sending Email To Admin
        if($gs->is_smtp == 1)
        {
            $data = [
                'to' => $gs->email,
                'subject' => "New Order Recieved!!",
                'body' => "Hello Admin!<br>Your store has received a new order.<br>Order Number is ".$order->order_number.".Please login to your panel to check. <br>Thank you.",
            ];

            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);            
        }
        else
        {
           $to = $gs->email;
           $subject = "New Order Recieved!!";
           $msg = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);
        }
*/
     
    }

    public function gateway(Request $request)
    {
        if($request->pass_check) {
            $users = User::where('email','=',$request->personal_email)->get();
            if(count($users) == 0) {
                if ($request->personal_pass == $request->personal_confirm){
                    $user = new User;
                    $user->name = $request->personal_name; 
                    $user->email = $request->personal_email;   
                    $user->password = bcrypt($request->personal_pass);
                    $token = md5(time().$request->personal_name.$request->personal_email);
                    $user->verification_link = $token;
                    $user->affilate_code = md5($request->name.$request->email);
                    $user->save();
                    Auth::guard('web')->login($user);                     
                }else{
                    return redirect()->back()->with('unsuccess',"Confirm Password Doesn't Match.");     
                }
            }
            else {
                return redirect()->back()->with('unsuccess',"This Email Already Exist.");  
            }
        }

        $gs = Generalsetting::findOrFail(1);
        if (!Session::has('cart')) {
            return redirect()->route('front.cart')->with('success',"You don't have any product to checkout.");
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
            if (Session::has('currency')) 
            {
              $curr = Currency::find(Session::get('currency'));
            }
            else
            {
                $curr = Currency::where('is_default','=',1)->first();
            }
        foreach($cart->items as $key => $prod)
        {
        if(!empty($prod['item']['license']) && !empty($prod['item']['license_qty']))
        {
                foreach($prod['item']['license_qty']as $ttl => $dtl)
                {
                    if($dtl != 0)
                    {
                        $dtl--;
                        $produc = Product::findOrFail($prod['item']['id']);
                        $temp = $produc->license_qty;
                        $temp[$ttl] = $dtl;
                        $final = implode(',', $temp);
                        $produc->license_qty = $final;
                        $produc->update();
                        $temp =  $produc->license;
                        $license = $temp[$ttl];
                         $oldCart = Session::has('cart') ? Session::get('cart') : null;
                         $cart = new Cart($oldCart);
                         $cart->updateLicense($prod['item']['id'],$license);  
                         Session::put('cart',$cart);
                        break;
                    }                    
                }
        }
        }
        $settings = Generalsetting::findOrFail(1);
        $order = new Order;
        $success_url = action('Front\PaymentController@payreturn');
        $item_name = $settings->title." Order";
        $item_number = str_random(4).time();
        $order['user_id'] = $request->user_id;
        $order['cart'] = utf8_encode(bzcompress(serialize($cart), 9));
        $order['totalQty'] = $request->totalQty;
        $order['pay_amount'] = round($request->total / $curr->value, 2) + $request->delivery_cost + $request->packing_cost;
        $order['method'] = $request->method;
        $order['delivery'] = $request->delivery;
        $order['pickup_location'] = $request->pickup_location;
        $order['customer_email'] = $request->email;
        $order['customer_name'] = $request->name;
        $order['delivery_cost'] = $request->delivery_cost;
        $order['packing_cost'] = $request->packing_cost;
        $order['tax'] = $request->tax;
        $order['customer_phone'] = $request->phone;
        $order['order_number'] = str_random(4).time();
        $order['customer_address'] = $request->address;
        $order['customer_country'] = $request->customer_country;
        $order['customer_city'] = $request->city;
        $order['customer_zip'] = $request->zip;
        $order['delivery_email'] = $request->delivery_email;
        $order['delivery_name'] = $request->delivery_name;
        $order['delivery_phone'] = $request->delivery_phone;
        $order['delivery_address'] = $request->delivery_address;
        $order['delivery_country'] = $request->delivery_country;
        $order['delivery_city'] = $request->delivery_city;
        $order['delivery_zip'] = $request->delivery_zip;
        $order['order_note'] = $request->order_notes;
        $order['txnid'] = $request->txn_id4;
        $order['coupon_code'] = $request->coupon_code;
        $order['coupon_discount'] = $request->coupon_discount;
        $order['dp'] = $request->dp;
        $order['payment_status'] = "Pending";
        $order['currency_sign'] = $curr->sign;
        $order['currency_value'] = $curr->value;
        $order['vendor_delivery_id'] = $request->vendor_delivery_id;
        $order['vendor_packing_id'] = $request->vendor_packing_id;        
            if (Session::has('affilate')) 
            {
                $val = $request->total / 100;
                $sub = $val * $gs->affilate_charge;
                $user = User::findOrFail(Session::get('affilate'));
                $user->affilate_income += $sub;
                $user->update();
                $order['affilate_user'] = $user->name;
                $order['affilate_charge'] = $sub;
            }
        $order->save();

        $track = new OrderTrack;
        $track->title = 'Pending';
        $track->text = 'You have successfully placed your order.';
        $track->order_id = $order->id;
        $track->save();
        
        $notification = new Notification;
        $notification->order_id = $order->id;
        $notification->save();
                    if($request->coupon_id != "")
                    {
                       $coupon = Coupon::findOrFail($request->coupon_id);
                       $coupon->used++;
                       if($coupon->times != null)
                       {
                            $i = (int)$coupon->times;
                            $i--;
                            $coupon->times = (string)$i;
                       }
                        $coupon->update();

                    }

        foreach($cart->items as $prod)
        {
            $x = (string)$prod['size_qty'];
            if(!empty($x))
            {
                $product = Product::findOrFail($prod['item']['id']);
                $x = (int)$x;
                $x = $x - $prod['qty'];
                $temp = $product->size_qty;
                $temp[$prod['size_key']] = $x;
                $temp1 = implode(',', $temp);
                $product->size_qty =  $temp1;
                $product->update();               
            }
        }


        foreach($cart->items as $prod)
        {
            $x = (string)$prod['stock'];
            if($x != null)
            {

                $product = Product::findOrFail($prod['item']['id']);
                $product->stock =  $prod['stock'];
                $product->update();  
                if($product->stock <= 5)
                {
                    $notification = new Notification;
                    $notification->product_id = $product->id;
                    $notification->save();                    
                }              
            }
        }

        Session::put('temporder',$order);
        Session::put('tempcart',$cart);
        Session::forget('cart');
        Session::forget('already');
        Session::forget('coupon');
        Session::forget('coupon_total');
        Session::forget('coupon_total1');
        Session::forget('coupon_percentage');



        

        //Sending Email To Buyer
        
        
          
         $to = $request->email;
           $subject = "Your Order Placed!!";
           $msg = "Hello ".$request->name."!\nYou have placed a new order.\nYour order number is ".$order->order_number.".Please wait for your delivery. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);
           
            $to2 = 'myorder@caspianoutlets.com';
           $subject2 = "New Order Recieved!!";
           $msg2 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
            $headers2 = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to2,$subject2,$msg2,$headers2);
           
          
           
           
            $to1 = 'dipti@pearlorganisation.com';
           $subject1 = "New Order Recieved!!";
           $msg1 = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
            $headers1 = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to1,$subject1,$msg1,$headers1);
           
  /*      if($gs->is_smtp == 1)
        {
        $data = [
            'to' => $request->email,
            'type' => "new_order",
            'cname' => $request->name,
            'oamount' => "",
            'aname' => "",
            'aemail' => "",
            'wtitle' => "",
            'onumber' => $order->order_number,
        ];

        $mailer = new GeniusMailer();
        $mailer->sendAutoOrderMail($data,$order->id);            
        }
        else
        {
           $to = $request->email;
           $subject = "Your Order Placed!!";
           $msg = "Hello ".$request->name."!\nYou have placed a new order.\nYour order number is ".$order->order_number.".Please wait for your delivery. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);            
        }
        //Sending Email To Admin
        if($gs->is_smtp == 1)
        {
            $data = [
                'to' => $gs->email,
                'subject' => "New Order Recieved!!",
                'body' => "Hello Admin!<br>Your store has received a new order.<br>Order Number is ".$order->order_number.".Please login to your panel to check. <br>Thank you.",
            ];

            $mailer = new GeniusMailer();
            $mailer->sendCustomMail($data);            
        }
        else
        {
           $to = $gs->email;
           $subject = "New Order Recieved!!";
           $msg = "Hello Admin!\nYour store has recieved a new order.\nOrder Number is ".$order->order_number.".Please login to your panel to check. \nThank you.";
            $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
           mail($to,$subject,$msg,$headers);
        }
        
        */

        return redirect($success_url);
    }


    // Capcha Code Image
    private function  code_image()
    {
        $actual_path = str_replace('project','',public_path());
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);

        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = $actual_path.'\assets\front\fonts\NotoSans-Bold.ttf';
        $allowed_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        $length = strlen($allowed_letters);
        $letter = $allowed_letters[rand(0, $length-1)];
        $word='';
        //$text_color = imagecolorallocate($image, 8, 186, 239);
        $text_color = imagecolorallocate($image, 0, 0, 0);
        $cap_length=6;// No. of character in image
        for ($i = 0; $i< $cap_length;$i++)
        {
            $letter = $allowed_letters[rand(0, $length-1)];
            imagettftext($image, 25, 1, 35+($i*25), 35, $text_color, $font, $letter);
            $word.=$letter;
        }
        $pixels = imagecolorallocate($image, 8, 186, 239);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixels);
        }
        session(['captcha_string' => $word]);
        imagepng($image, $actual_path."\assets\images\capcha_code.png");
    }

}
