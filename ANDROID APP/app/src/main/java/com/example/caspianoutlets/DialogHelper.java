package com.example.caspianoutlets;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.util.Log;

public class DialogHelper {

	private DialogHelper() {

	}

	public static void alert(Activity activity, String message) {
		alert(activity,
				message,
				activity.getResources().getString(android.R.string.ok),
				(dialog, which) -> {

				});
	}

	private static void alert(Activity activity, String message, String buttonText, DialogInterface.OnClickListener listener) {
		if (null == activity || activity.isFinishing()) {
			return;
		}

		Dialog dialog;
		try {
			AlertDialog.Builder builder = new AlertDialog.Builder(activity);
			builder.setTitle("");
			builder.setMessage(message);
			builder.setView(null);
			builder.setNegativeButton(buttonText, listener);
			builder.setCancelable(true);

			dialog = builder.show();
			dialog.setCanceledOnTouchOutside(false);

		} catch (android.view.WindowManager.BadTokenException e) {
			Log.e(activity.getClass().getSimpleName(), Log.getStackTraceString(e));
		}
	}

}
