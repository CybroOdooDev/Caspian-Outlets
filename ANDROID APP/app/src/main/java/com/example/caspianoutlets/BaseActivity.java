package com.example.caspianoutlets;

import android.content.Context;

import androidx.appcompat.app.AppCompatActivity;

public abstract class BaseActivity extends AppCompatActivity {

    protected Context getContext() {
        return this;
    }

}
