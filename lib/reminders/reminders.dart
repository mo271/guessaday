import 'package:flutter/foundation.dart';

import 'reminder_schedule.dart';

/// Strings the platform needs when notifications are set up.
class ReminderTexts {
  const ReminderTexts({
    required this.channelName,
    required this.channelDescription,
    required this.reveal,
    required this.practice,
  });

  final String channelName;
  final String channelDescription;
  final String reveal;
  final String practice;
}

/// Platform side of reminders. The real one wraps local notifications;
/// tests and platforms without notifications use [NoReminders].
abstract class ReminderBackend {
  /// Whether reminders can be offered at all on this platform.
  bool get supported;

  /// Sets up the plugin. [onOpen] receives the payload whenever the user
  /// opens the app from a reminder while it is running.
  Future<void> initialize(
    ReminderTexts texts,
    void Function(ReminderPayload payload) onOpen,
  );

  /// The payload of the reminder that launched the app, if any.
  Future<ReminderPayload?> launchPayload();

  /// Asks the system for permission to show notifications. Only called when
  /// the user turns reminders on.
  Future<bool> requestPermission();

  /// Drops all pending reminders and schedules [requests] instead.
  Future<void> replaceSchedule(List<ReminderRequest> requests);

  /// Removes everything, pending or shown.
  Future<void> cancelAll();
}

/// No notifications: for tests and for platforms the plugin does not cover.
class NoReminders implements ReminderBackend {
  const NoReminders();

  @override
  bool get supported => false;

  @override
  Future<void> initialize(
    ReminderTexts texts,
    void Function(ReminderPayload payload) onOpen,
  ) async {}

  @override
  Future<ReminderPayload?> launchPayload() async => null;

  @override
  Future<bool> requestPermission() async => false;

  @override
  Future<void> replaceSchedule(List<ReminderRequest> requests) async {}

  @override
  Future<void> cancelAll() async {}
}

/// Practice reminders as seen by the widgets: a backend plus the date the
/// user asked to practise by opening a reminder.
class Reminders {
  Reminders(this.backend);

  final ReminderBackend backend;

  /// Set when the user opens the app from a reminder; the game screen picks
  /// it up, shows that date and clears it.
  final ValueNotifier<ReminderPayload?> practice = ValueNotifier(null);

  bool get supported => backend.supported;

  Future<void> initialize(ReminderTexts texts) async {
    await backend.initialize(texts, (payload) => practice.value = payload);
    final launch = await backend.launchPayload();
    if (launch != null) practice.value = launch;
  }

  Future<bool> requestPermission() => backend.requestPermission();
}
