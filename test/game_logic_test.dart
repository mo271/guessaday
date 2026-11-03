import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/game/game_logic.dart';

void main() {
  final today = DateTime(2026, 11, 2, 15, 30); // a Monday, local time
  DateRange range(RangePreset preset) => rangeForPreset(
    preset,
    today: today,
    customStart: utcDay(1900, 1, 1),
    customEnd: utcDay(2050, 12, 31),
  );

  group('rangeForPreset', () {
    test('custom uses the stored dates', () {
      final r = range(RangePreset.custom);
      expect(r.start, utcDay(1900, 1, 1));
      expect(r.end, utcDay(2050, 12, 31));
    });

    test('custom swaps reversed dates instead of failing', () {
      final r = rangeForPreset(
        RangePreset.custom,
        today: today,
        customStart: utcDay(2000, 1, 1),
        customEnd: utcDay(1990, 1, 1),
      );
      expect(r.start, utcDay(1990, 1, 1));
      expect(r.end, utcDay(2000, 1, 1));
    });

    test('this month covers the whole month', () {
      final r = range(RangePreset.thisMonth);
      expect(r.start, utcDay(2026, 11, 1));
      expect(r.end, utcDay(2026, 11, 30));
      expect(r.lengthInDays, 30);
    });

    test('this month handles December', () {
      final r = rangeForPreset(
        RangePreset.thisMonth,
        today: DateTime(2026, 12, 5),
        customStart: today,
        customEnd: today,
      );
      expect(r.end, utcDay(2026, 12, 31));
    });

    test('this year and next year', () {
      expect(range(RangePreset.thisYear).start, utcDay(2026, 1, 1));
      expect(range(RangePreset.thisYear).end, utcDay(2026, 12, 31));
      expect(range(RangePreset.nextYear).start, utcDay(2027, 1, 1));
      expect(range(RangePreset.nextYear).end, utcDay(2027, 12, 31));
    });

    test('last 100 years ends today', () {
      final r = range(RangePreset.last100Years);
      expect(r.start, utcDay(1926, 11, 2));
      expect(r.end, utcDay(2026, 11, 2));
    });

    test('fixed ranges', () {
      expect(range(RangePreset.century20).start, utcDay(1901, 1, 1));
      expect(range(RangePreset.century20).end, utcDay(2000, 12, 31));
      expect(range(RangePreset.century21).start, utcDay(2001, 1, 1));
      expect(range(RangePreset.century21).end, utcDay(2100, 12, 31));
      expect(range(RangePreset.gregorianToToday).start, utcDay(1582, 10, 15));
      expect(range(RangePreset.gregorianToToday).end, utcDay(2026, 11, 2));
      expect(range(RangePreset.y1600to2099).start, utcDay(1600, 1, 1));
      expect(range(RangePreset.y1600to2099).end, utcDay(2099, 12, 31));
    });

    test('year 1 to 9999 has the right number of Gregorian days', () {
      final r = range(RangePreset.y1to9999);
      expect(r.start, utcDay(1, 1, 1));
      expect(r.end, utcDay(9999, 12, 31));
      // 9999 * 365 + 2424 leap days.
      expect(r.lengthInDays, 3652059);
    });
  });

  test('randomDateIn stays inside the range and reaches both ends', () {
    final r = DateRange(utcDay(2024, 2, 27), utcDay(2024, 3, 1));
    final random = Random(1);
    final seen = <DateTime>{};
    for (var i = 0; i < 500; i++) {
      final d = randomDateIn(r, random);
      expect(r.contains(d), isTrue, reason: '$d outside $r');
      seen.add(d);
    }
    expect(seen.length, 4);
    expect(seen, contains(utcDay(2024, 2, 29)));
  });

  test('weekdays of well-known dates (proleptic Gregorian)', () {
    expect(utcDay(1, 1, 1).weekday, DateTime.monday);
    expect(utcDay(1582, 10, 15).weekday, DateTime.friday);
    expect(utcDay(2000, 1, 1).weekday, DateTime.saturday);
    expect(utcDay(2026, 11, 2).weekday, DateTime.monday);
    expect(utcDay(9999, 12, 31).weekday, DateTime.friday);
  });

  test('weekdayOrder starts at the given day and wraps', () {
    expect(weekdayOrder(1), [1, 2, 3, 4, 5, 6, 7]);
    expect(weekdayOrder(7), [7, 1, 2, 3, 4, 5, 6]);
    expect(weekdayOrder(3), [3, 4, 5, 6, 7, 1, 2]);
  });

  test('formatElapsed renders mm:ss.cc', () {
    expect(formatElapsed(Duration.zero), '00:00.00');
    expect(
      formatElapsed(const Duration(minutes: 1, seconds: 2, milliseconds: 345)),
      '01:02.34',
    );
    expect(
      formatElapsed(const Duration(seconds: 59, milliseconds: 999)),
      '00:59.99',
    );
  });
}
