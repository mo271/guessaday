import 'dart:convert';
import 'dart:math';

/// Minutes in a day.
const minutesPerDay = 24 * 60;

/// Length in minutes of the daily window from [startMinute] to [endMinute]
/// (both minutes since midnight). A window that ends at or before it starts
/// wraps past midnight; start == end means the whole day.
int windowLength(int startMinute, int endMinute) {
  final length = (endMinute - startMinute) % minutesPerDay;
  return length == 0 ? minutesPerDay : length;
}

/// Random moments for practice reminders, in local time and sorted.
///
/// Each of the next [days] days (starting today) gets [perDay] moments inside
/// the window. The window is cut into [perDay] equal slots and one moment is
/// drawn in each, so reminders are spread out rather than clustered. Moments
/// that are not at least a minute after [now] are dropped.
List<DateTime> reminderTimes({
  required DateTime now,
  required int perDay,
  required int startMinute,
  required int endMinute,
  required int days,
  required Random random,
}) {
  assert(perDay > 0 && days > 0);
  final length = windowLength(startMinute, endMinute);
  final slot = length / perDay;
  final earliest = now.add(const Duration(minutes: 1));
  final times = <DateTime>[];
  for (var d = 0; d < days; d++) {
    // DateTime normalises an overflowing day, so this handles month ends.
    final dayStart = DateTime(now.year, now.month, now.day + d, 0, startMinute);
    for (var i = 0; i < perDay; i++) {
      final offset = (i * slot + random.nextDouble() * slot).floor();
      final t = dayStart.add(Duration(minutes: offset));
      if (!t.isBefore(earliest)) times.add(t);
    }
  }
  times.sort();
  return times;
}

/// Everything a notification needs to carry so that the app, or the
/// background handler for "Reveal", can act on it without any other state.
class ReminderPayload {
  const ReminderPayload({
    required this.date,
    required this.dateText,
    required this.weekdayText,
  });

  /// The asked day, UTC midnight.
  final DateTime date;

  /// The date as shown to the user, e.g. "14 March 1987".
  final String dateText;

  /// The answer as shown to the user, e.g. "Saturday".
  final String weekdayText;

  String encode() => jsonEncode({
    'd': date.toIso8601String(),
    't': dateText,
    'w': weekdayText,
  });

  static ReminderPayload? decode(String? raw) {
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final date = DateTime.tryParse(map['d'] as String);
      if (date == null) return null;
      return ReminderPayload(
        date: DateTime.utc(date.year, date.month, date.day),
        dateText: map['t'] as String,
        weekdayText: map['w'] as String,
      );
    } on Object {
      return null;
    }
  }
}

/// One notification to schedule.
class ReminderRequest {
  const ReminderRequest({
    required this.id,
    required this.at,
    required this.title,
    required this.payload,
  });

  final int id;

  /// Local time at which to show it.
  final DateTime at;

  /// Notification title; the body is the payload's date text.
  final String title;
  final ReminderPayload payload;
}
