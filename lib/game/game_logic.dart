import 'dart:math';

/// Preset date ranges, in the same order as the original Android app's
/// settings menu.
enum RangePreset {
  custom,
  thisMonth,
  thisYear,
  nextYear,
  last100Years,
  century20,
  century21,
  gregorianToToday,
  y1600to2099,
  y1to9999,
}

/// An inclusive range of calendar days. Both ends are UTC midnight.
class DateRange {
  const DateRange(this.start, this.end);

  final DateTime start;
  final DateTime end;

  int get lengthInDays => end.difference(start).inDays + 1;

  bool contains(DateTime day) => !day.isBefore(start) && !day.isAfter(end);
}

/// Midnight UTC on the given calendar day. Dart normalises overflowing
/// months and days, so `utcDay(2024, 13, 0)` is 2024-12-31.
DateTime utcDay(int year, int month, int day) => DateTime.utc(year, month, day);

/// Strips time of day and time zone from [date].
DateTime toUtcDay(DateTime date) => utcDay(date.year, date.month, date.day);

/// Resolves a preset to a concrete range. The calendar is proleptic
/// Gregorian throughout, which is what the usual mental-calculation
/// methods assume.
DateRange rangeForPreset(
  RangePreset preset, {
  required DateTime today,
  required DateTime customStart,
  required DateTime customEnd,
}) {
  final t = toUtcDay(today);
  switch (preset) {
    case RangePreset.custom:
      final s = toUtcDay(customStart);
      final e = toUtcDay(customEnd);
      return e.isBefore(s) ? DateRange(e, s) : DateRange(s, e);
    case RangePreset.thisMonth:
      return DateRange(
        utcDay(t.year, t.month, 1),
        utcDay(t.year, t.month + 1, 0),
      );
    case RangePreset.thisYear:
      return DateRange(utcDay(t.year, 1, 1), utcDay(t.year, 12, 31));
    case RangePreset.nextYear:
      return DateRange(utcDay(t.year + 1, 1, 1), utcDay(t.year + 1, 12, 31));
    case RangePreset.last100Years:
      return DateRange(utcDay(t.year - 100, t.month, t.day), t);
    case RangePreset.century20:
      return DateRange(utcDay(1901, 1, 1), utcDay(2000, 12, 31));
    case RangePreset.century21:
      return DateRange(utcDay(2001, 1, 1), utcDay(2100, 12, 31));
    case RangePreset.gregorianToToday:
      return DateRange(utcDay(1582, 10, 15), t);
    case RangePreset.y1600to2099:
      return DateRange(utcDay(1600, 1, 1), utcDay(2099, 12, 31));
    case RangePreset.y1to9999:
      return DateRange(utcDay(1, 1, 1), utcDay(9999, 12, 31));
  }
}

/// A uniformly random day in [range], both ends included.
DateTime randomDateIn(DateRange range, Random random) =>
    range.start.add(Duration(days: random.nextInt(range.lengthInDays)));

/// Weekday numbers in display order, starting at [first]
/// (1 = Monday ... 7 = Sunday, as in [DateTime.weekday]).
List<int> weekdayOrder(int first) =>
    List.generate(7, (i) => (first - 1 + i) % 7 + 1);

/// Formats an elapsed time as `mm:ss.cc`.
String formatElapsed(Duration elapsed) {
  String two(int n) => n.toString().padLeft(2, '0');
  final minutes = elapsed.inMinutes;
  final seconds = elapsed.inSeconds % 60;
  final centis = (elapsed.inMilliseconds % 1000) ~/ 10;
  return '${two(minutes)}:${two(seconds)}.${two(centis)}';
}

/// One question: a date to guess the weekday of, and when it was shown.
class Round {
  Round({required this.date, required this.startedAt});

  final DateTime date;
  final DateTime startedAt;

  int get correctWeekday => date.weekday;
}
