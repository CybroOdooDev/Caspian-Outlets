package com.example.caspianoutlets;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Parcelable;
import android.provider.MediaStore;
import android.util.Log;
import android.view.KeyEvent;
import android.view.ViewGroup;
import android.webkit.GeolocationPermissions;
import android.webkit.PermissionRequest;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.gun0912.tedpermission.PermissionListener;
import com.gun0912.tedpermission.TedPermission;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MainActivity extends BaseActivity {
    private static final String TAG = com.example.caspianoutlets.MainActivity.class.getSimpleName();

    private WebView mWebView;

    ProgressBar progressBar;
    private ValueCallback<Uri> mUploadMessage;
    private final static int FILECHOOSER_RESULTCODE = 1;

    private static final int INPUT_FILE_REQUEST_CODE = 1;
    private Uri mCapturedImageURI = null;
    private ValueCallback<Uri[]> mFilePathCallback;
    private String mCameraPhotoPath;

    public static void deleteCache(Context context) {
        try {
            File dir = context.getCacheDir();
            deleteDir(dir);
        } catch (Exception e) { e.printStackTrace();}
    }

    public static boolean deleteDir(File dir) {
        if (dir != null && dir.isDirectory()) {
            String[] children = dir.list();
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
            return dir.delete();
        } else if(dir!= null && dir.isFile()) {
            return dir.delete();
        } else {
            return dir.delete();
        }
    }

    public static final String USER_AGENT_FAKE = "Mozilla/5.0 (Linux; Android 4.1.1; Galaxy Nexus Build/JRO03C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mobile Safari/535.19";

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            if (requestCode != INPUT_FILE_REQUEST_CODE || mFilePathCallback == null) {
                super.onActivityResult(requestCode, resultCode, data);
                return;
            }
            Uri[] results = null;
            // Check that the response is a good one
            if (resultCode == Activity.RESULT_OK) {
                if (data == null) {
                    // If there is not data, then we may have taken a photo
                    if (mCameraPhotoPath != null) {
                        results = new Uri[]{Uri.parse(mCameraPhotoPath)};
                    }
                } else {
                    String dataString = data.getDataString();
                    if (dataString != null) {
                        results = new Uri[]{Uri.parse(dataString)};
                    }
                }
            }
            mFilePathCallback.onReceiveValue(results);
            mFilePathCallback = null;
        } else if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.KITKAT) {
            if (requestCode != FILECHOOSER_RESULTCODE || mUploadMessage == null) {
                super.onActivityResult(requestCode, resultCode, data);
                return;
            }
            if (requestCode == FILECHOOSER_RESULTCODE) {
                if (null == this.mUploadMessage) {
                    return;
                }
                Uri result = null;
                try {
                    if (resultCode != RESULT_OK) {
                        result = null;
                    } else {
                        // retrieve from the private variable if the intent is null
                        result = data == null ? mCapturedImageURI : data.getData();
                    }
                } catch (Exception e) {
                    Toast.makeText(getApplicationContext(), "activity :" + e,
                            Toast.LENGTH_LONG).show();
                }
                mUploadMessage.onReceiveValue(result);
                mUploadMessage = null;
            }
        }
        return;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        init();
    }

    private void init() {
        ViewGroup contentView = findViewById(R.id.contentView);
        progressBar = (ProgressBar) findViewById(R.id.progressbar);

        if (null == contentView) {
            DialogHelper.alert(this, "The contentView does not exist.");
            finish();
            return;
        }

        // add webView
        final WebView webView = new WebView(getContext());
        ViewGroup.LayoutParams params = new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        contentView.addView(webView, params);

        webView.getSettings().setUserAgentString(USER_AGENT_FAKE);

        // setup webView
        setupWebView(webView);

        if (!(haveNetworkConnection())){
            webView.loadUrl("about:blank");
            Toast.makeText(this, "No Internet Connection", Toast.LENGTH_SHORT).show();
        }

        webView.loadUrl("https://coutlet.com/");

        // http://127.0.0.1:8000/

        mWebView = webView;


        //wv.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient()
        {
            public boolean shouldOverrideUrlLoading(WebView view, String url)
            {

              if (url.contains("maps?saddr="))
                {
                    webView.loadUrl(url);
                }

                else if (url.startsWith("tel:") || url.contains("tel:") || url.startsWith("sms:") || url.startsWith("smsto:") || url.startsWith("mms:") || url.startsWith("mmsto:"))
                {
                    Intent intent = new Intent(Intent.ACTION_VIEW,Uri.parse(url));
                    startActivity(intent);
                    return true;
                }else if (url.contains("whatsapp:"))
                {
                    try {
                        Intent intent = Intent.parseUri(view.getUrl().toString(), Intent.URI_INTENT_SCHEME);
                        if(intent.resolveActivity(getPackageManager()) != null)
                            startActivity(intent);
                        return true;
                    } catch (URISyntaxException use) {
                        Log.e(TAG, use.getMessage());
                    }
                }

                return false;
            }

            @Override
            public void onPageFinished(WebView view, String url)
            {
                // TODO Auto-generated method stub
                super.onPageFinished(view, url);

                String url_new = view.getUrl();

                Log.v("","Webview Function URL: "+url_new);

                if (!(haveNetworkConnection())){
                    Toast.makeText(com.example.caspianoutlets.MainActivity.this, "No Internet Connection",
                            Toast.LENGTH_LONG).show();
                }
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon)
            {
                // TODO Auto-generated method stub
                super.onPageStarted(view, url, favicon);

                String url_new = view.getUrl();

                Log.v("","Webview Function URL: "+url_new);

               if (!(haveNetworkConnection())){
                    webView.loadUrl("about:blank");
                    Toast.makeText(com.example.caspianoutlets.MainActivity.this, "No Internet Connection",
                            Toast.LENGTH_LONG).show();
                } else {

                    Toast.makeText(com.example.caspianoutlets.MainActivity.this, "Loading...",
                            Toast.LENGTH_LONG).show();
                }

            }
        });


    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

      //  deleteCache(MainActivity.this);

        if (null != mWebView) {
            try {
                mWebView.setWebChromeClient(null);
                mWebView.setWebViewClient(null);
                mWebView.destroy();
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        }
        mWebView = null;
    }

    @SuppressLint("SetJavaScriptEnabled")
    private void setupWebView(final WebView webView) {
        webView.getSettings().setJavaScriptEnabled(true);

        webView.getSettings().setGeolocationEnabled(true);

        webView.getSettings().setUseWideViewPort(true);

        webView.getSettings().setSupportZoom(false);
        webView.getSettings().setBuiltInZoomControls(false);
        webView.getSettings().setDisplayZoomControls(false);

        webView.getSettings().setAppCacheEnabled(false);

        webView.getSettings().setLoadWithOverviewMode(true);
        webView.getSettings().setUseWideViewPort(true);

        webView.setBackgroundResource(R.drawable.background);
        webView.setBackgroundColor(0x00000000);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            webView.getSettings().setMixedContentMode(WebSettings.MIXED_CONTENT_COMPATIBILITY_MODE);
        }



        webView.setWebChromeClient(new WebChromeClient() {

            private File createImageFile() throws IOException {
                // Create an image file name
                String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
                String imageFileName = "JPEG_" + timeStamp + "_";
                File storageDir = Environment.getExternalStoragePublicDirectory(
                        Environment.DIRECTORY_PICTURES);
                File imageFile = File.createTempFile(
                        imageFileName,  /* prefix */
                        ".jpg",         /* suffix */
                        storageDir      /* directory */
                );
                return imageFile;
            }



            // For Android 5.0
            public boolean onShowFileChooser(WebView view, ValueCallback<Uri[]> filePath, FileChooserParams fileChooserParams) {
                // Double check that we don't have any existing callbacks
                if (mFilePathCallback != null) {
                    mFilePathCallback.onReceiveValue(null);
                }
                mFilePathCallback = filePath;
                Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
                    // Create the File where the photo should go
                    File photoFile = null;
                    try {
                        photoFile = createImageFile();
                        takePictureIntent.putExtra("PhotoPath", mCameraPhotoPath);
                    } catch (IOException ex) {
                        // Error occurred while creating the File
                        Log.e(TAG, "Unable to create Image File", ex);
                    }
                    // Continue only if the File was successfully created
                    if (photoFile != null) {
                        mCameraPhotoPath = "file:" + photoFile.getAbsolutePath();
                        takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT,
                                Uri.fromFile(photoFile));
                    } else {
                        takePictureIntent = null;
                    }
                }
                Intent contentSelectionIntent = new Intent(Intent.ACTION_GET_CONTENT);
                contentSelectionIntent.addCategory(Intent.CATEGORY_OPENABLE);
                contentSelectionIntent.setType("image/*");
                Intent[] intentArray;
                if (takePictureIntent != null) {
                    intentArray = new Intent[]{takePictureIntent};
                } else {
                    intentArray = new Intent[0];
                }
                Intent chooserIntent = new Intent(Intent.ACTION_CHOOSER);
                chooserIntent.putExtra(Intent.EXTRA_INTENT, contentSelectionIntent);
                chooserIntent.putExtra(Intent.EXTRA_TITLE, "Image Chooser");
                chooserIntent.putExtra(Intent.EXTRA_INITIAL_INTENTS, intentArray);
                startActivityForResult(chooserIntent, INPUT_FILE_REQUEST_CODE);
                return true;
            }
            // openFileChooser for Android 3.0+
            public void openFileChooser(ValueCallback<Uri> uploadMsg, String acceptType) {
                mUploadMessage = uploadMsg;
                // Create AndroidExampleFolder at sdcard
                // Create AndroidExampleFolder at sdcard
                File imageStorageDir = new File(
                        Environment.getExternalStoragePublicDirectory(
                                Environment.DIRECTORY_PICTURES)
                        , "AndroidExampleFolder");
                if (!imageStorageDir.exists()) {
                    // Create AndroidExampleFolder at sdcard
                    imageStorageDir.mkdirs();
                }
                // Create camera captured image file path and name
                File file = new File(
                        imageStorageDir + File.separator + "IMG_"
                                + String.valueOf(System.currentTimeMillis())
                                + ".jpg");
                mCapturedImageURI = Uri.fromFile(file);
                // Camera capture image intent
                final Intent captureIntent = new Intent(
                        MediaStore.ACTION_IMAGE_CAPTURE);
                captureIntent.putExtra(MediaStore.EXTRA_OUTPUT, mCapturedImageURI);
                Intent i = new Intent(Intent.ACTION_GET_CONTENT);
                i.addCategory(Intent.CATEGORY_OPENABLE);
                i.setType("image/*");
                // Create file chooser intent
                Intent chooserIntent = Intent.createChooser(i, "Image Chooser");
                // Set camera intent to file chooser
                chooserIntent.putExtra(Intent.EXTRA_INITIAL_INTENTS
                        , new Parcelable[] { captureIntent });
                // On select image call onActivityResult method of activity
                startActivityForResult(chooserIntent, FILECHOOSER_RESULTCODE);
            }
            // openFileChooser for Android < 3.0
            public void openFileChooser(ValueCallback<Uri> uploadMsg) {
                openFileChooser(uploadMsg, "");
            }
            //openFileChooser for other Android versions
            public void openFileChooser(ValueCallback<Uri> uploadMsg,
                                        String acceptType,
                                        String capture) {
                openFileChooser(uploadMsg, acceptType);
            }




            public void onProgressChanged(WebView view, int progress) {
                progressBar.setProgress(progress);
            }

            // Geolocation
            @Override
            public void onPermissionRequest(PermissionRequest request) {
                Log.i(TAG, "onPermissionRequest: request[" + request + "]");
                super.onPermissionRequest(request);
            }

            // Geolocation
            @Override
            public void onPermissionRequestCanceled(PermissionRequest request) {
                Log.i(TAG, "onPermissionRequestCanceled: request[" + request + "]");
                super.onPermissionRequestCanceled(request);
            }

            // Geolocation
            @Override
            public void onGeolocationPermissionsHidePrompt() {
                Log.i(TAG, "onGeolocationPermissionsHidePrompt");
                super.onGeolocationPermissionsHidePrompt();
            }

            // Geolocation
            @Override
            public void onGeolocationPermissionsShowPrompt(final String origin, final GeolocationPermissions.Callback callback) {
                Log.i(TAG, "onGeolocationPermissionsShowPrompt : origin[" + origin + "] callback[" + callback + "]");
                String[] permission = new String[] {
                        // Dangerous Permission
                        Manifest.permission.ACCESS_FINE_LOCATION,
                        Manifest.permission.ACCESS_COARSE_LOCATION,
                };

                // request permission
                TedPermission.with(getContext())
                        .setPermissionListener(new PermissionListener() {
                            @Override
                            public void onPermissionGranted() {
                                Log.i(TAG, "onGeolocationPermissionsShowPrompt : onPermissionGranted : origin[" + origin + "] callback[" + callback + "]");
                                callback.invoke(origin, true, false);
                            }

                            @Override
                            public void onPermissionDenied(List<String> deniedPermissions) {
                                Log.i(TAG, "onGeolocationPermissionsShowPrompt : onPermissionDenied : origin[" + origin + "] callback[" + callback + "]");
                                callback.invoke(origin, false, false);
                            }
                        })
                        .setPermissions(permission)
                        .check();

                super.onGeolocationPermissionsShowPrompt(origin, callback);
            }

        });

    }


    private boolean haveNetworkConnection() {
        boolean haveConnectedWifi = false;
        boolean haveConnectedMobile = false;

        ConnectivityManager cm = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo[] netInfo = cm.getAllNetworkInfo();
        for (NetworkInfo ni : netInfo) {
            if (ni.getTypeName().equalsIgnoreCase("WIFI"))
                if (ni.isConnected())
                    haveConnectedWifi = true;
            if (ni.getTypeName().equalsIgnoreCase("MOBILE"))
                if (ni.isConnected())
                    haveConnectedMobile = true;
        }
        return haveConnectedWifi || haveConnectedMobile;
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (event.getAction() == KeyEvent.ACTION_DOWN) {
            switch (keyCode) {
                case KeyEvent.KEYCODE_BACK:
                    if (mWebView.canGoBack()) {
                        mWebView.goBack();
                    } else {
                        finish();
                    }
                    return true;
            }

        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public void onResume(){
        super.onResume();

     //   mWebView.loadUrl("https://www.adTunez.com/sweetCMobile");

    }

}