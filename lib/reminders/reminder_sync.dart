import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../game/game_logic.dart';
import '../l10n/app_localizations.dart';
import '../settings/settings.dart';
import '../settings/settings_scope.dart';
import '../ui/weekday_names.dart';
import 'reminder_schedule.dart';
import 'reminders.dart';
import 'reminders_scope.dart';

/// Keeps the scheduled notifications in line with the settings.
///
/// Sits below [MaterialApp] (so it has localisations) and above the
/// navigator. Reminders are scheduled a week ahead; every start, resume or
/// relevant settings change replaces them with a fresh random week drawn
/// from the currently selected date range.
class ReminderSync extends StatefulWidget {
  const ReminderSync({super.key, required this.child});

  final Widget child;

  /// How far ahead reminders are scheduled.
  static const days = 7;

  @override
  State<ReminderSync> createState() => _ReminderSyncState();
}

class _ReminderSyncState extends State<ReminderSync>
    with WidgetsBindingObserver {
  final Random _random = Random();
  bool _initialized = false;
  late (ReminderKey, Locale) _key;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settings = SettingsScope.of(context);
    final key = (settings.reminderKey, Localizations.localeOf(context));
    if (!_initialized) {
      _initialized = true;
      _key = key;
      _initialize(settings);
    } else if (key != _key) {
      final wasEnabled = _key.$1.$1;
      _key = key;
      _sync(settings, cancelIfOff: wasEnabled);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _initialized) {
      _sync(SettingsScope.read(context));
    }
  }

  Future<void> _initialize(Settings settings) async {
    final reminders = RemindersScope.of(context);
    if (!reminders.supported) return;
    final l10n = AppLocalizations.of(context);
    await reminders.initialize(
      ReminderTexts(
        channelName: l10n.practiceReminders,
        channelDescription: l10n.practiceRemindersHint,
        reveal: l10n.reveal,
        practice: l10n.practice,
      ),
    );
    if (mounted) _sync(settings);
  }

  void _sync(Settings settings, {bool cancelIfOff = false}) {
    final reminders = RemindersScope.of(context);
    if (!reminders.supported) return;
    if (!settings.remindersEnabled) {
      if (cancelIfOff) reminders.backend.cancelAll();
      return;
    }
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final dateFormat = DateFormat.yMMMMd(locale);
    final now = DateTime.now();
    final range = rangeForPreset(
      settings.preset,
      today: now,
      customStart: settings.customStart,
      customEnd: settings.customEnd,
    );
    final times = reminderTimes(
      now: now,
      perDay: settings.remindersPerDay,
      startMinute: settings.reminderStartMinute,
      endMinute: settings.reminderEndMinute,
      days: ReminderSync.days,
      random: _random,
    );
    final requests = [
      for (final (i, at) in times.indexed)
        ReminderRequest(
          id: i + 1,
          at: at,
          title: l10n.reminderTitle,
          payload: _payloadFor(
            randomDateIn(range, _random),
            dateFormat,
            locale,
          ),
        ),
    ];
    reminders.backend.replaceSchedule(requests);
  }

  ReminderPayload _payloadFor(
    DateTime date,
    DateFormat dateFormat,
    String locale,
  ) => ReminderPayload(
    date: date,
    dateText: dateFormat.format(date),
    weekdayText: weekdayName(locale, date.weekday),
  );

  @override
  Widget build(BuildContext context) => widget.child;
}
