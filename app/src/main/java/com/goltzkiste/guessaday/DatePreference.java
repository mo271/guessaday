package com.goltzkiste.guessaday;

/**
 * Created by mo on 3/6/16. see http://stackoverflow.com/questions/4216082
 */
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.preference.DialogPreference;
import android.preference.PreferenceManager;
import android.util.AttributeSet;
import android.view.View;
import android.widget.DatePicker;
import android.os.Build;


public class DatePreference extends DialogPreference {
    private int lastDate = 1;
    private int lastMonth = 0;
    private int lastYear = 0;
    private String dateval;
    private CharSequence mSummary;
    private DatePicker picker = null;
    public static int getYear(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[0]));
    }

    public static int getMonth(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[1]));
    }

    public static int getDate(String dateval) {
        String[] pieces = dateval.split("-");
        return (Integer.parseInt(pieces[2]));
    }

    public DatePreference(Context ctxt, AttributeSet attrs) {
        super(ctxt, attrs);

        setPositiveButtonText("Set");
        setNegativeButtonText("Cancel");
    }

    @Override
    protected View onCreateDialogView() {
        picker = new DatePicker(getContext());

        // setCalendarViewShown(false) attribute is only available from API level 11
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            picker.setCalendarViewShown(false);
        }

        return (picker);
    }

    @Override
    protected void onBindDialogView(View v) {
        super.onBindDialogView(v);
        SharedPreferences SP=this.getSharedPreferences();
        //SharedPreferences SP = PreferenceManager.getDefaultSharedPreferences(this.getDialog().getBaseContext());


        TimeZone MyTimezone = TimeZone.getTimeZone("UTC");
        Calendar cal = new GregorianCalendar(MyTimezone);

        if (this.getKey().equals("startdate")){
            cal.set(1, 0, 1);
            picker.setMinDate(cal.getTimeInMillis());
            String enddate=SP.getString("enddate", "2050-12-31");
            String[] spieces = enddate.split("-");
            cal.set(Integer.parseInt(spieces[0]), Integer.parseInt(spieces[1])-1, Integer.parseInt(spieces[2]));
            picker.setMaxDate(cal.getTimeInMillis());


        }
        if (this.getKey().equals("enddate")) {
            String startdate=SP.getString("startdate", "1900-01-01");
            String[] spieces = startdate.split("-");
            cal.set(Integer.parseInt(spieces[0]), Integer.parseInt(spieces[1])-1, Integer.parseInt(spieces[2]));
            picker.setMinDate(cal.getTimeInMillis());
            cal.set(lastYear + 1000, 11, 31);
            picker.setMaxDate(cal.getTimeInMillis());
        }
        picker.updateDate(lastYear, lastMonth-1, lastDate);


    }

    @Override
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);

        if (positiveResult) {
            lastYear = picker.getYear();
            lastMonth = (picker.getMonth()+1);
            lastDate = picker.getDayOfMonth();

            String dateval = String.valueOf(lastYear) + "-"
                    + String.format("%02d",lastMonth) + "-"
                    + String.format("%02d",lastDate);

            if (callChangeListener(dateval)) {
                persistString(dateval);
            }
        }
    }

    @Override
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return (a.getString(index));
    }

    @Override
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        dateval = null;

        if (restoreValue) {
            if (defaultValue == null) {
                Calendar cal = Calendar.getInstance();
                SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                String formatted = format1.format(cal.getTime());
                dateval = getPersistedString(formatted);
            } else {
                dateval = getPersistedString(defaultValue.toString());
            }
        } else {
            dateval = defaultValue.toString();
        }
        lastYear = getYear(dateval);
        lastMonth = getMonth(dateval);
        lastDate = getDate(dateval);
        setSummary(dateval);
    }

    public void setText(String text) {
        final boolean wasBlocking = shouldDisableDependents();

        dateval = text;

        persistString(text);

        final boolean isBlocking = shouldDisableDependents();
        if (isBlocking != wasBlocking) {
            notifyDependencyChange(isBlocking);
        }
    }

    public String getText() {
        return dateval;
    }

    public CharSequence getSummary() {
        return mSummary;
    }

    public void setSummary(CharSequence summary) {
        if (summary == null && mSummary != null || summary != null
                && !summary.equals(mSummary)) {
            mSummary = summary;
            notifyChanged();
        }
    }
}