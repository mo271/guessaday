package com.goltzkiste.guessaday;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Paint;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.format.DateFormat;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;

import android.view.animation.Animation;
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
import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity implements View.OnTouchListener {

    private DayAdapter listAdapter ;
    private ArrayAdapter<String> listAdapter2 ;
    //public static TextView timetext;
    private static String date_name;
    private static int state;
    private static int correctday;
    private static int guessedday;
    private static long starttime;
    private static AlphaAnimation alphaAnim = new AlphaAnimation(1.0f,0.0f);
    private static SharedPreferences prefs;
    private static SharedPreferences.OnSharedPreferenceChangeListener listener;
    public static String timeneeded;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        state=1;
        timeneeded="";
        prefs = PreferenceManager.getDefaultSharedPreferences(this);
        listener = new SharedPreferences.OnSharedPreferenceChangeListener() {
            public void onSharedPreferenceChanged(SharedPreferences prefs, String key) {
                switch (key) {
                    case "example_switch":
                        TextView timetext = (TextView) findViewById(R.id.textView);
                        //MainActivity.timetext.setText("");
                        Boolean timingon = prefs.getBoolean("example_switch", true);
                        if(state==0){
                            if ((timingon)) {
                                timetext.setText(timeneeded);
                            }
                            else {
                                timetext.setText("");
                            }
                        }
                        break;
                    case "firstweekday":
                        repopulatelist();
                        break;
                    case "pref_visi_switch":
                        if (prefs.getBoolean("pref_visi_switch",false)) {
                            Toast toast=Toast.makeText(MainActivity.this, "Tap on hidden date to make it reappear!",
                                    Toast.LENGTH_LONG);
                            toast.setGravity(Gravity.CENTER,0,0);
                            toast.show();
                        }
                        if (state==1){
                            TextView text = (TextView) findViewById(R.id.textView2);

                            if (prefs.getBoolean("pref_visi_switch",false)) {
                                ladealphaanim();
                                text.setAnimation(alphaAnim);
                                alphaAnim.start();
                            }
                            else {
                                alphaAnim.cancel();
                                text.setVisibility(View.VISIBLE);
                                text.setTextColor(Color.BLACK);
                            }
                        }
                        break;
                    case "visi_pref":
                        if (state==1) {
                            TextView text = (TextView) findViewById(R.id.textView2);

                            if (prefs.getBoolean("pref_visi_switch", false)) {
                                ladealphaanim();
                                text.setAnimation(alphaAnim);
                                alphaAnim.start();
                            }
                        }
                        break;
                    case "sync_frequency":
                        state=1;
                        loadActivity();
                        break;
                    case "startdate":
                        state=1;
                        loadActivity();
                        break;
                    case "enddate":
                        state=1;
                        loadActivity();
                        break;
                }
            }

        };
        prefs.registerOnSharedPreferenceChangeListener(listener);

        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        TextView text = (TextView) findViewById(R.id.textView2);
        text.setOnTouchListener(this);
        listenActivity();
        setSupportActionBar(toolbar);
        loadActivity();
        LinearLayout layout = (LinearLayout) findViewById(R.id.linearLayout1);
        layout.setOnTouchListener(this);

    }

    private void ladealphaanim(){
        final TextView text = (TextView) findViewById(R.id.textView2);

        alphaAnim.cancel();
        float f=Float.parseFloat(prefs.getString("visi_pref", "1"));
        float g=(Float.parseFloat(".02")+(f-Float.parseFloat(".1"))/Float.parseFloat("10"));
        alphaAnim.setStartOffset(Math.round(f*1000));                        // in Miilisec
        alphaAnim.setDuration(Math.round(g*1000));                    //add some fading
        //alphaAnim.setRepeatMode(Animation.RESTART);
        //alphaAnim.setRepeatCount(Animation.INFINITE);
        alphaAnim.setAnimationListener(new Animation.AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                // make invisible when animation completes, you could also remove the view from the layout
                text.setVisibility(View.INVISIBLE);
                //text.setTextColor(Color.TRANSPARENT);
            }

            public void onAnimationStart(Animation a) {
                text.setVisibility(View.VISIBLE);
                //text.setTextColor(Color.BLACK);
            }

            public void onAnimationRepeat(Animation a) {
            }
        });
    }
    private void loadActivity() {
            // Do all of your work here
            android.widget.ListView weekdaylistview = (android.widget.ListView) findViewById(R.id.listView);
            weekdaylistview.setClickable(true);
            weekdaylistview.setEnabled(true);
            LinearLayout layout = (LinearLayout) findViewById(R.id.linearLayout1);
            //yout.setClickable(false);
            //yout.setEnabled(false);
            //String[] weekdays = new String[]{};
            //List<String> someList = new ArrayList<String>();
            //weekdayList.addAll(Arrays.asList(weekdays));
            //listAdapter = new ArrayAdapter<String>(this, R.layout.simplerow, weekdayList);
            // Construct the data source

            ArrayList<Zeile> arrayOfDays = new ArrayList<Zeile>();

// Create the adapter to convert the array to views

            listAdapter = new DayAdapter(this, arrayOfDays);

// Attach the adapter to a ListView
            //ListView listView = (ListView) findViewById(R.id.lvItems);

            weekdaylistview.setAdapter(listAdapter);

            TimeZone MyTimezone = TimeZone.getTimeZone("UTC");
            TimeZone MeineTimezone = TimeZone.getDefault();
            Calendar rightnow = new GregorianCalendar(MeineTimezone);

            Calendar mcalendar = new GregorianCalendar(MyTimezone);
            Calendar ecalendar = new GregorianCalendar(MyTimezone);

            SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
            String epochstring = SP.getString("sync_frequency", "0");



            //Toast.makeText(MainActivity.this, startdate,
            //       Toast.LENGTH_LONG).show();

            int epochname = Integer.parseInt(epochstring);
            mcalendar.clear();
            ecalendar.clear();
            switch (epochname) {
                case 0:
                    String startdate=SP.getString("startdate","1900-01-01");
                    String enddate=SP.getString("enddate", "2050-12-31");
                    String[] spieces = startdate.split("-");
                    mcalendar.set(Integer.parseInt(spieces[0]), Integer.parseInt(spieces[1])-1,Integer.parseInt(spieces[2]));
                    String[] epieces = enddate.split("-");
                    ecalendar.set(Integer.parseInt(epieces[0]), Integer.parseInt(epieces[1])-1,Integer.parseInt(epieces[2]));
                    //ecalendar.set(sdf.parse(enddate));
                    break;
                case 1:
                    mcalendar.set(rightnow.get(Calendar.YEAR), rightnow.get(Calendar.MONTH), 1);
                    ecalendar.set(rightnow.get(Calendar.YEAR), rightnow.get(Calendar.MONTH), rightnow.getActualMaximum(Calendar.DAY_OF_MONTH));
                    break;
                case 4:
                    mcalendar.set(rightnow.get(Calendar.YEAR)-100,rightnow.get(Calendar.MONTH), rightnow.get(Calendar.DAY_OF_MONTH));
                    ecalendar = new GregorianCalendar(MyTimezone);
                    break;
                case 7:
                    mcalendar.set(1582, 9, 15);
                    ecalendar = new GregorianCalendar(MyTimezone);
                    break;
                case 9:
                    mcalendar.set(1, 0, 1);
                    ecalendar.set(9999,11,1);
                    break;
                case 2:
                    mcalendar.set(rightnow.get(Calendar.YEAR), 0, 1);
                    ecalendar.set(rightnow.get(Calendar.YEAR),11,31);
                    break;
                case 3:
                    mcalendar.set(rightnow.get(Calendar.YEAR)+1, 0, 1);
                    ecalendar.set(rightnow.get(Calendar.YEAR)+1,11,31);
                    break;
                case 5:
                    mcalendar.set(1901, 0, 1);
                    ecalendar.set(2000, 11, 31);
                    break;
                case 6:
                    mcalendar.set(2001, 0, 1);
                    ecalendar.set(2100, 11, 31);
                    break;
                case 8:
                    mcalendar.set(1600, 0, 1);
                    ecalendar.set(2099,11,1);
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
            java.text.DateFormat df = java.text.DateFormat.getDateInstance(java.text.DateFormat.LONG);;
            df.setTimeZone(TimeZone.getTimeZone("UTC"));
            date_name = df.format(mcalendar.getTime());

            final TextView text = (TextView) findViewById(R.id.textView2);
            text.setText(date_name);
            //text.setTextColor(Color.BLACK);
            //text.setVisibility(View.VISIBLE);
            //text.setClickable(true);
            //text.setEnabled(true);
            ladealphaanim();
//            alphaAnim.cancel();
//            float f=Float.parseFloat(SP.getString("visi_pref","1"));
//            float g=(Float.parseFloat(".02")+(f-Float.parseFloat(".1"))/Float.parseFloat("10"));
//            alphaAnim.setStartOffset(Math.round(f*1000));                        // in Miilisec
//            alphaAnim.setDuration(Math.round(g*1000));                    //add some fading
//            //alphaAnim.setRepeatMode(Animation.RESTART);
//            //alphaAnim.setRepeatCount(Animation.INFINITE);
//            alphaAnim.setAnimationListener(new Animation.AnimationListener() {
//                public void onAnimationEnd(Animation animation) {
//                    // make invisible when animation completes, you could also remove the view from the layout
//                    text.setVisibility(View.INVISIBLE);
//                    //text.setTextColor(Color.TRANSPARENT);
//                }
//
//                public void onAnimationStart(Animation a) {
//                    text.setVisibility(View.VISIBLE);
//                    //text.setTextColor(Color.BLACK);
//                }
//
//                public void onAnimationRepeat(Animation a) {
//                }
//            });
            if (SP.getBoolean("pref_visi_switch",false)){
                text.setAnimation(alphaAnim);
                alphaAnim.start();
            }
            TextView timetext = (TextView) findViewById(R.id.textView);
            timetext.setText("");

            int k=Integer.parseInt(SP.getString("firstweekday", "0"));
            correctday = (mcalendar.get(Calendar.DAY_OF_WEEK));

            repopulatelist();
            starttime = System.currentTimeMillis();
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
    private void repopulatelist(){
        SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
        int k = Integer.parseInt(SP.getString("firstweekday", "0"));
        listAdapter.clear();
        TimeZone MyTimezone = TimeZone.getDefault();
        Calendar calendar = new GregorianCalendar(MyTimezone);
        for (int i = 0; i < 7; i++) {
            calendar.set(1985, 10, 3 + i + k);
            String day_name = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
            Zeile newZeile = new Zeile(day_name, state, (i + k) % 7);
            listAdapter.add(newZeile);
        }
    }
        private void listenActivity() {
            if(state==1) {

                final android.widget.ListView weekdaylistview = (android.widget.ListView) findViewById(R.id.listView);

                weekdaylistview.setOnItemClickListener(
                        new AdapterView.OnItemClickListener() {
                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
                                int k = Integer.parseInt(SP.getString("firstweekday", "0"));
                                guessedday = (position + k) % 7;
                                state = 0;
                                repopulatelist();
//                                listAdapter.clear();
//                                TimeZone MyTimezone = TimeZone.getDefault();
//                                Calendar calendar = new GregorianCalendar(MyTimezone);
//                                for (int i = 0; i < 7; i++) {
//                                    calendar.set(1985, 10, 3 + i + k);
//                                    String day_name = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault());
//                                    Zeile newZeile = new Zeile(day_name, 0, (i + k) % 7);
//                                    listAdapter.add(newZeile);
//                                }
                                weekdaylistview.setClickable(false);
                                weekdaylistview.setEnabled(false);
                                Boolean timingon = SP.getBoolean("example_switch", true);
                                SimpleDateFormat sdf = new SimpleDateFormat("mm:ss:SSS");
                                sdf.setTimeZone(TimeZone.getTimeZone("UTC"));
                                //TextView timetext = (TextView) findViewById(R.id.textView);
                                TextView timetext = (TextView) findViewById(R.id.textView);
                                timeneeded=sdf.format(System.currentTimeMillis() - starttime).substring(0, 8);
                                if (timingon) {//hier durch prefence entscheiden ob Zeit angezeigt wird oder nicht.
                                    timetext.setText(timeneeded);
                                }
                                final TextView text = (TextView) findViewById(R.id.textView2);
                                alphaAnim.cancel();
                                text.setVisibility(View.VISIBLE);
                                //ext.setTextColor(Color.BLACK);
                                //text.setClickable(false);
                                //text.setEnabled(false);

                            }
                        }
                );

            }
        }

    public boolean onTouch(View v, MotionEvent event) {
        //Intent intent = new Intent(this, New1.class);
        //startActivity(intent);
        SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(getBaseContext());

        final TextView text = (TextView) findViewById(R.id.textView2);
        text.setText(date_name);
        if (state==0){
            state=1;
            loadActivity();
           // return true;

        }
        else if  (state==1){
            //text.setTextColor(Color.GREEN);
            if (SP.getBoolean("pref_visi_switch",false)){
                text.setAnimation(alphaAnim);
                alphaAnim.start();
            }



           // return false;
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

