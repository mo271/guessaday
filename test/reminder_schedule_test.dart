import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/reminders/reminder_schedule.dart';
import 'package:guessaday/reminders/reminder_sync.dart';

void main() {
  group('windowLength', () {
    test('plain, wrapping and whole-day windows', () {
      expect(windowLength(9 * 60, 21 * 60), 12 * 60);
      expect(windowLength(22 * 60, 2 * 60), 4 * 60);
      expect(windowLength(8 * 60, 8 * 60), 24 * 60);
    });
  });

  group('reminderTimes', () {
    final now = DateTime(2026, 11, 5, 10, 30);

    test('gives perDay moments per day inside the window, sorted', () {
      final times = reminderTimes(
        now: DateTime(2026, 11, 5, 0, 0),
        perDay: 3,
        startMinute: 9 * 60,
        endMinute: 21 * 60,
        days: 7,
        random: Random(1),
      );
      expect(times, hasLength(21));
      for (var i = 1; i < times.length; i++) {
        expect(times[i].isAfter(times[i - 1]), isTrue);
      }
      for (final t in times) {
        final minute = t.hour * 60 + t.minute;
        expect(minute, inInclusiveRange(9 * 60, 21 * 60 - 1));
      }
      expect(times.where((t) => t.day == 5), hasLength(3));
      expect(times.last.day, 11);
    });

    test('drops moments that are not after now', () {
      final times = reminderTimes(
        now: now,
        perDay: 2,
        startMinute: 9 * 60,
        endMinute: 21 * 60,
        days: 1,
        random: Random(2),
      );
      expect(times.length, lessThanOrEqualTo(2));
      for (final t in times) {
        expect(t.isAfter(now), isTrue);
      }
    });

    test('spreads moments over equal slots', () {
      for (var seed = 0; seed < 20; seed++) {
        final times = reminderTimes(
          now: DateTime(2026, 11, 5, 0, 0),
          perDay: 4,
          startMinute: 8 * 60,
          endMinute: 20 * 60,
          days: 1,
          random: Random(seed),
        );
        // Four three-hour slots starting at 8:00.
        for (final (i, t) in times.indexed) {
          expect(t.hour, inInclusiveRange(8 + 3 * i, 8 + 3 * i + 2));
        }
      }
    });

    test('wraps past midnight', () {
      final times = reminderTimes(
        now: DateTime(2026, 11, 5, 0, 0),
        perDay: 1,
        startMinute: 23 * 60,
        endMinute: 1 * 60,
        days: 1,
        random: Random(3),
      );
      expect(times, hasLength(1));
      final t = times.single;
      expect(t.hour == 23 || t.hour == 0, isTrue);
      expect(t.day, t.hour == 23 ? 5 : 6);
    });
  });

  group('ReminderPayload', () {
    test('encodes and decodes', () {
      final payload = ReminderPayload(
        date: DateTime.utc(1987, 3, 14),
        dateText: 'March 14, 1987',
        weekdayText: 'Saturday',
      );
      final decoded = ReminderPayload.decode(payload.encode())!;
      expect(decoded.date, DateTime.utc(1987, 3, 14));
      expect(decoded.dateText, 'March 14, 1987');
      expect(decoded.weekdayText, 'Saturday');
    });

    test('rejects garbage', () {
      expect(ReminderPayload.decode(null), isNull);
      expect(ReminderPayload.decode('nope'), isNull);
      expect(ReminderPayload.decode('{"d":"x"}'), isNull);
      expect(ReminderPayload.decode('[1]'), isNull);
    });
  });

  group('ReminderSync.daysFor', () {
    test('keeps the pending count within the platform limit', () {
      expect(ReminderSync.daysFor(1, 60), 7);
      expect(ReminderSync.daysFor(8, 60), 7);
      expect(ReminderSync.daysFor(9, 60), 6);
      expect(ReminderSync.daysFor(99, 60), 1);
      expect(ReminderSync.daysFor(99, 300), 3);
      for (final limit in [60, 300]) {
        for (var n = 1; n <= 200; n++) {
          final days = ReminderSync.daysFor(n, limit);
          expect(days, inInclusiveRange(1, 7));
          // One day may exceed the limit; the caller truncates the list.
          if (days > 1) expect(n * days, lessThanOrEqualTo(limit));
        }
      }
    });
  });
}
