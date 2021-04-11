<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Generalsetting extends Model
{
    protected $fillable = ['logo', 'favicon', 'title','header_email','header_phone', 'footer','copyright','colors','loader','admin_loader','talkto','map_key','disqus','stripe_key','stripe_secret','currency_format','withdraw_fee','withdraw_charge','tax','delivery_cost','smtp_host','smtp_port','smtp_user','smtp_pass','from_email','from_name','add_cart','out_stock','already_cart','add_wish','already_wish','wish_remove','add_compare','already_compare','compare_remove','color_change','coupon_found','no_coupon','already_coupon','order_title','order_text','is_affilate','affilate_charge','affilate_banner','fixed_commission','percentage_commission','cod_text','paypal_text','stripe_text','header_color','footer_color','copyright_color','menu_color','menu_hover_color','is_verification_email','instamojo_key','instamojo_token','instamojo_text','instamojo_sandbox','paystack_key','paystack_email','paystack_text','wholesell','is_capcha','error_banner','popup_title','popup_text','popup_background','invoice_logo','user_image','is_secure','paypal_username','paypal_mode','paypal_password','paypal_secret','footer_logo'];

    public $timestamps = false;


    public function upload($name,$file,$oldname)
    {
                $file->move('assets/images',$name);
                if($oldname != null)
                {
                    if (file_exists(public_path().'\assets\images\\'.$oldname)) {
                        unlink(public_path().'\assets\images\\'.$oldname);
                    }
                }  
    }
}
