package com.goltzkiste.guessaday;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.text.format.DateFormat;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends Activity {
	public final static String GUESSEDDAY = "com.goltzkiste.guessaday.GD";
	public final static String CORRECTDAY = "com.goltzkiste.guessaday.CD";
	public final static String LONGDATE = "com.goltzkiste.guessaday.LD";
	public final static String  STARTTIME = "com.goltzkiste.guessaday.ST";
	private static String correct_day_name; //vielleicht nicht ok?!
	private static String date_name;
	private static long starttime;
	//private static String 
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);	
		SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
		String epochstring = SP.getString("example_list", "0");
		int epochname = Integer.parseInt(epochstring);
		
		//boolean bAppUpdates = SP.getBoolean("applicationUpdates",false);
		//String downloadType = SP.getString("downloadType","1");
		TimeZone MyTimezone = TimeZone.getDefault();
		Calendar mcalendar = new GregorianCalendar(MyTimezone);
		Calendar ecalendar = new GregorianCalendar(MyTimezone);
		//mcalendar.set(1900, 1, 1);
		//ecalendar.set(2100, 12, 31);
		mcalendar.clear();
		ecalendar.clear();
		switch (epochname) {
			case 0:
				mcalendar.set(1900, 0, 1);
				ecalendar.set(2050, 11, 31);
				break;
			case 1:
				mcalendar.set(1600, 0, 1);
				ecalendar.set(2100, 11, 31);
				break;
			case 2:
				mcalendar.set(1950, 0, 1);
	    		ecalendar = new GregorianCalendar(MyTimezone);
	    		break;
			case 3:
				mcalendar.clear();
				ecalendar.clear();
				mcalendar.set(1582, 9, 15);
    			ecalendar = new GregorianCalendar(MyTimezone);
    			break;
			case 4:
				mcalendar.clear();
				ecalendar.clear();
				mcalendar.set(1, 0, 1);
    			ecalendar.set(9999,11,1);
    			break;
			case 5:
				mcalendar.clear();
				ecalendar.clear();
				Calendar rightnow = new GregorianCalendar(MyTimezone);
				mcalendar.set(rightnow.get(Calendar.YEAR), 0, 1);
				ecalendar.set(rightnow.get(Calendar.YEAR),11,31);
				break;
			case 6:
				mcalendar.clear();
				ecalendar.clear();
				Calendar rightnow2 = new GregorianCalendar(MyTimezone);
				mcalendar.set(rightnow2.get(Calendar.YEAR),rightnow2.get(Calendar.MONTH), 1);
				ecalendar.set(rightnow2.get(Calendar.YEAR),rightnow2.get(Calendar.MONTH), rightnow2.getActualMaximum(Calendar.DAY_OF_MONTH));	
				break;
		}

		
		
		long delta= ecalendar.getTimeInMillis()-mcalendar.getTimeInMillis();
		delta = delta / 86400000; //convert from Millis to Days 86400000=1000*60*60*24: 
		//date_name = strUserName;
		//date_name=String.valueOf(epochname);
		//date_name+="t";
		//date_name+=DateFormat.getLongDateFormat(this).format(ecalendar.getTime());
		//date_name+=DateFormat.getLongDateFormat(this).format(mcalendar.getTime());
		mcalendar.add(Calendar.DATE, ((int) (Math.random()*delta)));
		date_name=DateFormat.getLongDateFormat(this).format(mcalendar.getTime());

			    
		//String date_name= mcalendar.toString();
		//		mcalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
		TextView text = (TextView) findViewById(R.id.textView2);
        //text.setText(String.valueOf((int) (Math.random()*10)));
		text.setText(date_name);
		MainActivity.correct_day_name=mcalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
		//intent.putExtra(GUESSEDDAY, buttonText);
		
		int[] buttonIDs = new int[] {R.id.button1, R.id.button2, R.id.button3, R.id.button4, R.id.button5, R.id.button6, R.id.button7};
		Calendar calendar = new GregorianCalendar(MyTimezone);
		for(int i=0; i<buttonIDs.length; i++) {
			calendar.set(1998, 1, i+1);
			String day_name=calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
			Button mtag = (Button) findViewById(buttonIDs[i]);
			mtag.setText(day_name);
		}
		starttime = System.currentTimeMillis();
		// ... the race 
		
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_main, menu);
		return true;
	}
	
	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
	    switch(item.getItemId())
	    {
	    case 0:
	        Intent in = new Intent(MainActivity.this, SettingsActivity.class);
	        startActivity(in);
	        //finish();
	        return true;

	    default:
	        Intent in2 = new Intent(MainActivity.this, SettingsActivity.class);
	        startActivity(in2);
	        //finish();
	        return true;
	    }
	}
	/** Called when the user clicks buttons */
	public void checkanswer(View view) {
		Intent intent = new Intent(this, CheckAnswerActivity.class);
		Button b = (Button)view;
		String buttonText = b.getText().toString();
		intent.putExtra(GUESSEDDAY, buttonText);
		//String correct_day_name=mcalendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
		intent.putExtra(CORRECTDAY, MainActivity.correct_day_name);
		intent.putExtra(LONGDATE, MainActivity.date_name);
		intent.putExtra(STARTTIME, MainActivity.starttime);
		// Do something in response to button
		finish();
		startActivity(intent);
	}
}
