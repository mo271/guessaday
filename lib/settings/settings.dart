import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../game/game_logic.dart';

/// Reminder settings that matter for scheduling, see [Settings.reminderKey].
typedef ReminderKey = (bool, int, int, int, RangePreset, DateTime, DateTime);

/// User preferences, persisted with shared_preferences.
class Settings extends ChangeNotifier {
  Settings(this._prefs)
    : timerEnabled = _prefs.getBool(_kTimer) ?? true,
      preset =
          RangePreset.values[(_prefs.getInt(_kPreset) ?? 0).clamp(
            0,
            RangePreset.values.length - 1,
          )],
      customStart = _readDate(_prefs, _kStart) ?? utcDay(1900, 1, 1),
      customEnd = _readDate(_prefs, _kEnd) ?? utcDay(2050, 12, 31),
      firstWeekday = _prefs.getInt(_kFirstWeekday) ?? 0,
      hideDate = _prefs.getBool(_kHide) ?? false,
      hideAfterSeconds = _prefs.getDouble(_kHideAfter) ?? 1.0,
      recentWindow = _prefs.getInt(_kRecentWindow) ?? 20,
      remindersEnabled = _prefs.getBool(_kReminders) ?? false,
      remindersPerDay = (_prefs.getInt(_kRemindersPerDay) ?? 5).clamp(
        1,
        maxRemindersPerDay,
      ),
      reminderStartMinute = _prefs.getInt(_kReminderStart) ?? 7 * 60,
      reminderEndMinute = _prefs.getInt(_kReminderEnd) ?? 22 * 60;

  static const _kTimer = 'timerEnabled';
  static const _kPreset = 'rangePreset';
  static const _kStart = 'customStart';
  static const _kEnd = 'customEnd';
  static const _kFirstWeekday = 'firstWeekday';
  static const _kHide = 'hideDate';
  static const _kHideAfter = 'hideAfterSeconds';
  static const _kRecentWindow = 'recentWindow';
  static const _kReminders = 'remindersEnabled';
  static const _kRemindersPerDay = 'remindersPerDay';
  static const _kReminderStart = 'reminderStartMinute';
  static const _kReminderEnd = 'reminderEndMinute';

  /// Choices for how long the date stays visible, in seconds.
  static const hideAfterOptions = <double>[
    0.1, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.5, 5, 10, 25, 60, //
  ];

  /// Choices for how many recent rounds the "recent" statistics cover.
  static const recentWindowOptions = <int>[5, 10, 20, 50, 100];

  /// Upper bound for practice reminders per day.
  static const maxRemindersPerDay = 24;

  final SharedPreferences _prefs;

  bool timerEnabled;
  RangePreset preset;
  DateTime customStart;
  DateTime customEnd;

  /// 0 means "use the locale's first day of the week", otherwise
  /// 1 = Monday ... 7 = Sunday.
  int firstWeekday;
  bool hideDate;
  double hideAfterSeconds;

  /// How many of the latest rounds the "recent" statistics cover.
  int recentWindow;

  /// Random practice reminders as notifications. Off until the user turns
  /// them on, which is also when notification permission is requested.
  bool remindersEnabled;
  int remindersPerDay;

  /// Reminders only arrive between these two times of day, given as
  /// minutes since midnight. The window may wrap past midnight.
  int reminderStartMinute;
  int reminderEndMinute;

  /// Everything that determines when and what to remind.
  ReminderKey get reminderKey => (
    remindersEnabled,
    remindersPerDay,
    reminderStartMinute,
    reminderEndMinute,
    preset,
    customStart,
    customEnd,
  );

  /// Everything that determines which dates can be asked.
  (RangePreset, DateTime, DateTime) get rangeKey =>
      (preset, customStart, customEnd);

  void setTimerEnabled(bool value) {
    timerEnabled = value;
    _prefs.setBool(_kTimer, value);
    notifyListeners();
  }

  void setPreset(RangePreset value) {
    preset = value;
    _prefs.setInt(_kPreset, value.index);
    notifyListeners();
  }

  void setCustomStart(DateTime value) {
    customStart = toUtcDay(value);
    if (customEnd.isBefore(customStart)) {
      customEnd = customStart;
      _writeDate(_kEnd, customEnd);
    }
    _writeDate(_kStart, customStart);
    notifyListeners();
  }

  void setCustomEnd(DateTime value) {
    customEnd = toUtcDay(value);
    if (customStart.isAfter(customEnd)) {
      customStart = customEnd;
      _writeDate(_kStart, customStart);
    }
    _writeDate(_kEnd, customEnd);
    notifyListeners();
  }

  void setFirstWeekday(int value) {
    firstWeekday = value;
    _prefs.setInt(_kFirstWeekday, value);
    notifyListeners();
  }

  void setHideDate(bool value) {
    hideDate = value;
    _prefs.setBool(_kHide, value);
    notifyListeners();
  }

  void setHideAfterSeconds(double value) {
    hideAfterSeconds = value;
    _prefs.setDouble(_kHideAfter, value);
    notifyListeners();
  }

  void setRecentWindow(int value) {
    recentWindow = value;
    _prefs.setInt(_kRecentWindow, value);
    notifyListeners();
  }

  void setRemindersEnabled(bool value) {
    remindersEnabled = value;
    _prefs.setBool(_kReminders, value);
    notifyListeners();
  }

  void setRemindersPerDay(int value) {
    remindersPerDay = value.clamp(1, maxRemindersPerDay);
    _prefs.setInt(_kRemindersPerDay, remindersPerDay);
    notifyListeners();
  }

  void setReminderStartMinute(int value) {
    reminderStartMinute = value;
    _prefs.setInt(_kReminderStart, value);
    notifyListeners();
  }

  void setReminderEndMinute(int value) {
    reminderEndMinute = value;
    _prefs.setInt(_kReminderEnd, value);
    notifyListeners();
  }

  static DateTime? _readDate(SharedPreferences prefs, String key) {
    final raw = prefs.getString(key);
    if (raw == null) return null;
    final parsed = DateTime.tryParse(raw);
    return parsed == null ? null : toUtcDay(parsed.toUtc());
  }

  void _writeDate(String key, DateTime value) {
    _prefs.setString(key, value.toIso8601String());
  }
}
