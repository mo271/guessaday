package com.goltzkiste.guessaday;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.format.DateFormat;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.TimeZone;

public class MainActivity extends AppCompatActivity implements View.OnTouchListener {

    private DayAdapter listAdapter ;
    private ArrayAdapter<String> listAdapter2 ;

    private static String date_name;
    private static int state;
    private static int correctday;
    private static int guessedday;
    private static long starttime;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        state=1;

        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        loadActivity();
        LinearLayout layout = (LinearLayout) findViewById(R.id.linearLayout1);
        layout.setOnTouchListener(this);

        listenActivity();

    }


        private void loadActivity() {
            // Do all of your work here
            android.widget.ListView weekdaylistview = (android.widget.ListView) findViewById(R.id.listView);
            weekdaylistview.setClickable(true);
            weekdaylistview.setEnabled(true);
            //String[] weekdays = new String[]{};
            //ArrayList<String> weekdayList = new ArrayList<String>();
            //weekdayList.addAll(Arrays.asList(weekdays));
            //listAdapter = new ArrayAdapter<String>(this, R.layout.simplerow, weekdayList);
            // Construct the data source

            ArrayList<Zeile> arrayOfDays = new ArrayList<Zeile>();

// Create the adapter to convert the array to views

            listAdapter = new DayAdapter(this, arrayOfDays);

// Attach the adapter to a ListView
            //ListView listView = (ListView) findViewById(R.id.lvItems);

            weekdaylistview.setAdapter(listAdapter);

            TimeZone MyTimezone = TimeZone.getDefault();

            Calendar mcalendar = new GregorianCalendar(MyTimezone);
            Calendar ecalendar = new GregorianCalendar(MyTimezone);

            SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
            String epochstring = SP.getString("sync_frequency", "0");
            String startdate=SP.getString("startdate","0");
            Toast.makeText(MainActivity.this, startdate,
                    Toast.LENGTH_LONG).show();

            int epochname = Integer.parseInt(epochstring);
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
                    Calendar rightnow3 = new GregorianCalendar(MyTimezone);
                    mcalendar.set(rightnow3.get(Calendar.YEAR)+1, 0, 1);
                    ecalendar.set(rightnow3.get(Calendar.YEAR)+1,11,31);
                    break;
                case 7:
                    mcalendar.clear();
                    ecalendar.clear();
                    mcalendar.set(1900, 0, 1);
                    ecalendar.set(1999, 11, 31);
                    break;
                case 8:
                    mcalendar.clear();
                    ecalendar.clear();
                    mcalendar.set(2000, 0, 1);
                    ecalendar.set(2099, 11, 31);
                    break;
            }

            //hier daten aus den Settings nehmen!
            //mcalendar.clear();
            //ecalendar.clear();
            //mcalendar.set(1900, 0, 1);
            //ecalendar.set(2050, 11, 31);

            long delta = ecalendar.getTimeInMillis() - mcalendar.getTimeInMillis();
            delta = delta / 86400000; //convert from Millis to Days 86400000=1000*60*60*24:
            mcalendar.add(Calendar.DATE, ((int) (Math.random() * delta)));
            date_name = DateFormat.getLongDateFormat(this).format(mcalendar.getTime());
            TextView text = (TextView) findViewById(R.id.textView2);
            text.setText(date_name);
            correctday = mcalendar.get(Calendar.DAY_OF_WEEK);
            TextView timetext = (TextView) findViewById(R.id.textView);
            timetext.setText("");
            Calendar calendar = new GregorianCalendar(MyTimezone);
            for (int i = 0; i < 7; i++) {
                calendar.set(1985, 10, 3 + i);
                String day_name = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
                Zeile newZeile = new Zeile(day_name,state,i);
                listAdapter.add(newZeile);
            }
            starttime = System.currentTimeMillis();
            //weekdaylistview.setAdapter(listAdapter);
        }
    public class Zeile {
        public String tag;
        public int status;
        public int zeilenr;

       public Zeile(String tag, int status, int zeilenr) {
            this.tag = tag;
            this.status = status;
            this.zeilenr = zeilenr;
        }

    }
    public class DayAdapter extends ArrayAdapter<Zeile>{
        public DayAdapter(Context context, ArrayList<Zeile> zeilen) {
            super(context, 0, zeilen);
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            // Get the data item for this position
            Zeile zeile = getItem(position);
            // Check if an existing view is being reused, otherwise inflate the view
            if (convertView == null) {
                convertView = LayoutInflater.from(getContext()).inflate(R.layout.simplerow, parent, false);
            }
            // Lookup view for data population
            TextView tagName = (TextView) convertView.findViewById(R.id.rowTextView);
            //TextView tvHome = (TextView) convertView.findViewById(R.id.tvHome);
            // Populate the data into the template view using the data object
            if (zeile.status==1) {
                tagName.setText(zeile.tag);
            }
            else if(zeile.zeilenr==guessedday){
                tagName.setText(zeile.tag);
                if(zeile.zeilenr!=correctday-1){
                    //tagName.setTextColor(Color.RED);
                    tagName.setPaintFlags(tagName.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
                }
            }
            else if(zeile.zeilenr==correctday-1) {
                tagName.setText(zeile.tag);
                //tagName.setTextColor(Color.GREEN);
            }
            else {
                tagName.setText("");
            }

            //tvHome.setText(user.hometown);
            // Return the completed view to render on screen
            return convertView;

        }
    }
        private void listenActivity() {
            if(state==1) {
                final android.widget.ListView weekdaylistview = (android.widget.ListView) findViewById(R.id.listView);

                weekdaylistview.setOnItemClickListener(
                        new AdapterView.OnItemClickListener() {
                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                                guessedday=position;

                                listAdapter.clear();
                                TimeZone MyTimezone = TimeZone.getDefault();
                                Calendar calendar = new GregorianCalendar(MyTimezone);
                                for (int i = 0; i < 7; i++) {
                                    calendar.set(1985, 10, 3 + i);
                                    String day_name = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
                                    Zeile newZeile = new Zeile(day_name,0,i);
                                    listAdapter.add(newZeile);
                                }
                                weekdaylistview.setClickable(false);
                                weekdaylistview.setEnabled(false);
                                SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
                                Boolean timingon = SP.getBoolean("example_switch", true);
                                if (timingon){//hier durch prefence entscheiden ob Zeit angezeigt wird oder nicht.
                                    SimpleDateFormat sdf = new SimpleDateFormat("mm:ss:SSS");
                                    sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                                    TextView timetext = (TextView) findViewById(R.id.textView);
                                    timetext.setText(sdf.format(System.currentTimeMillis()-starttime).substring(0,8));
                                }

                                state=0;

                            }
                        }
                );

            }
        }

    public boolean onTouch(View v, MotionEvent event) {
        //Intent intent = new Intent(this, New1.class);
        //startActivity(intent);
        if (state==0){
            state=1;
            loadActivity();

        }
        return true;
    }

        @Override
        public boolean onCreateOptionsMenu (Menu menu){
            // Inflate the menu; this adds items to the action bar if it is present.
            getMenuInflater().inflate(R.menu.menu_main, menu);
            return true;
        }

        @Override
        public boolean onOptionsItemSelected (MenuItem item){
            // Handle action bar item clicks here. The action bar will
            // automatically handle clicks on the Home/Up button, so long
            // as you specify a parent activity in AndroidManifest.xml.
            int id = item.getItemId();

            //noinspection SimplifiableIfStatement
            if (id == R.id.action_settings) {
                Intent intent = new Intent(MainActivity.this, SettingsActivity.class);
                startActivity(intent);
                //finish();
                //return true;
            }

            return super.onOptionsItemSelected(item);
        }




}

