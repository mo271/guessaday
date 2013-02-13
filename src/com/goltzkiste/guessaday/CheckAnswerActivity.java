package com.goltzkiste.guessaday;

import java.text.SimpleDateFormat;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

public class CheckAnswerActivity extends Activity {
	@SuppressLint("NewApi") 
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		//addPreferencesFromResource(R.xml.pref_general); 
		setContentView(R.layout.activity_check_answer);
		SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
		Boolean timingon = SP.getBoolean("example_checkbox", true);

	    // Get the message from the intent
	    Intent intent = getIntent();
	    String guess = intent.getStringExtra(MainActivity.GUESSEDDAY);
	    String correct = intent.getStringExtra(MainActivity.CORRECTDAY);
	    String longdate = intent.getStringExtra(MainActivity.LONGDATE);
	    long starttime=intent.getLongExtra(MainActivity.STARTTIME, 0L);
	    
	    
	    // Create the text view
	    TextView textView = (TextView) findViewById(R.id.textView1);
	    if (guess.equals(correct)) {
	    	textView.setTextColor(Color.GREEN);
	    }  else {
	    	textView.setTextColor(Color.RED);
	    }
	    //textView.setTextSize(40);
	    textView.setText(guess);
	    TextView textView2 = (TextView) findViewById(R.id.textView2);
	    //textView.setTextSize(40);
	    textView2.setText(correct);
	    TextView textView3 = (TextView) findViewById(R.id.textView3);
	    //textView.setTextSize(40);
	    textView3.setText(longdate);
	    TextView textView4 = (TextView) findViewById(R.id.textView4);
	    //textView.setTextSize(40);
		if (timingon){
		    SimpleDateFormat sdf = new SimpleDateFormat("mm:ss:SSS");
		    textView4.setText(sdf.format(System.currentTimeMillis()-starttime));
		}
	    // Set the text view as the activity layout
	    //setContentView(textView);

		
		//if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
		//	getActionBar().setDisplayHomeAsUpEnabled(true);
			// Show the Up button in the action bar.
		//}
		
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_main, menu);
		return true;
	}
	public boolean onOptionsItemSelected(MenuItem item)
	{
	    switch(item.getItemId())
	    {
	    case 0:
	        Intent in = new Intent(this, SettingsActivity.class);
	        startActivity(in);
	        //finish();
	        return true;

	    default:
	        Intent in2 = new Intent(this, SettingsActivity.class);
	        startActivity(in2);
	        //finish();
	        return true;
	    }
	}
	//@Override
	//public boolean onOptionsItemSelected(MenuItem item) {
		//switch (item.getItemId()) {
		//case android.R.id.home:
			// This ID represents the Home or Up button. In the case of this
			// activity, the Up button is shown. Use NavUtils to allow users
			// to navigate up one level in the application structure. For
			// more details, see the Navigation pattern on Android Design:
			//
			// http://developer.android.com/design/patterns/navigation.html#up-vs-back
			//
		//	NavUtils.navigateUpFromSameTask(this);
			//return true;
	   // case 0:
	     //   Intent in = new Intent(CheckAnswerActivity.this, SettingsActivity.class);
	    //    startActivity(in);
	        //finish();
	     //   return true;
	//	}
	//	return super.onOptionsItemSelected(item);
	//}
	
    public void finishActivity(View v){
    	Intent intent = new Intent(this, MainActivity.class);
		//String correct_day_name=mcalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
		// Do something in response to button
		CheckAnswerActivity.this.finish();
    	//MainActivity.this.finish();
		startActivity(intent);

    }
}
