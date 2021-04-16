package com.example.caspianoutlets;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

public class SplashScreen extends Activity {
	
	//splash screen timer
    private static int SPLASH_TIME_OUT = 3000;


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_splash);
		
		
		new Handler().postDelayed(new Runnable() {

			@Override
			public void run() {
			
				
				//add intent runnable here
				Intent i = new Intent(com.example.caspianoutlets.SplashScreen.this,MainActivity.class);
				
				startActivity(i);
				
				//this will close the activity completely
				finish();
			}
			
			
			
		}, SPLASH_TIME_OUT);
	}
}
