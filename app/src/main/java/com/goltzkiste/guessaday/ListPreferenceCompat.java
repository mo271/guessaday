package com.goltzkiste.guessaday;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.preference.EditTextPreference;
import android.preference.ListPreference;
import android.text.TextUtils;
import android.util.AttributeSet;


public class ListPreferenceCompat extends ListPreference {
    //private final String CLASS_NAME = this.getClass().getSimpleName();
    private String dependentValue = "2";
    public ListPreferenceCompat(Context context) {
        this(context, null);
    }
    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    public ListPreferenceCompat(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ListPreferenceCompat);
            dependentValue = a.getString(R.styleable.ListPreferenceCompat_dependentValue);
            a.recycle();
        }
    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    public ListPreferenceCompat(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ListPreferenceCompat);
            dependentValue = a.getString(R.styleable.ListPreferenceCompat_dependentValue);
            a.recycle();
        }
    }

    public ListPreferenceCompat(Context context, AttributeSet attrs) {
        super(context, attrs);
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ListPreferenceCompat);
           dependentValue = a.getString(R.styleable.ListPreferenceCompat_dependentValue);
           a.recycle();
        }
    }




    // NOTE:
    // The framework forgot to call notifyChanged() in setValue() on previous versions of android.
    // This bug has been fixed in android-4.4_r0.7.
    // Commit: platform/frameworks/base/+/94c02a1a1a6d7e6900e5a459e9cc699b9510e5a2
    // Time: Tue Jul 23 14:43:37 2013 -0700
    // see http://stackoverflow.com/q/10119852
    // However on previous versions, we have to workaround it by ourselves.
    @Override
    public void setValue(String value) {
            String oldValue = getValue();
            super.setValue(value);
            if (!TextUtils.equals(value, oldValue)) {
                if (Build.VERSION.SDK_INT < Build.VERSION_CODES.KITKAT) {
                    notifyChanged();
                }
                    notifyDependencyChange(shouldDisableDependents());

                }

        }
        //----hier http://stackoverflow.com/questions/3969807/
       // String mOldValue = getValue();
       // if (!value.equals(oldValue)) {
        //    notifyDependencyChange(shouldDisableDependents());





    @Override
    public boolean shouldDisableDependents() {
        boolean shouldDisableDependents = super.shouldDisableDependents();
        String value = getValue();
        //return shouldDisableDependents || value == null || !value.equals(dependentValue);
        return shouldDisableDependents  || !TextUtils.equals(value,dependentValue);
    }


}