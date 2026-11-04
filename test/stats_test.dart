import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/game/game_logic.dart';
import 'package:guessaday/stats/stats.dart';
import 'package:shared_preferences/shared_preferences.dart';

RoundResult r(bool correct, [int? millis]) =>
    RoundResult(rangeId: 'thisYear', correct: correct, millis: millis);

void main() {
  group('Summary', () {
    test('is empty for no rounds', () {
      final s = Summary.of(const []);
      expect(s.rounds, 0);
      expect(s.accuracy, isNull);
      expect(s.averageTime, isNull);
      expect(s.bestTime, isNull);
      expect(s.currentStreak, 0);
      expect(s.bestStreak, 0);
    });

    test('counts accuracy and times of correct rounds only', () {
      final s = Summary.of([r(true, 4000), r(false, 1000), r(true, 2000)]);
      expect(s.rounds, 3);
      expect(s.correct, 2);
      expect(s.accuracy, closeTo(2 / 3, 1e-9));
      expect(s.averageTime, const Duration(seconds: 3));
      expect(s.bestTime, const Duration(seconds: 2));
    });

    test('ignores untimed rounds for times but not for accuracy', () {
      final s = Summary.of([r(true), r(true, 5000), r(false)]);
      expect(s.accuracy, closeTo(2 / 3, 1e-9));
      expect(s.averageTime, const Duration(seconds: 5));
    });

    test('tracks the current streak with its own average', () {
      final s = Summary.of([
        r(true, 9000),
        r(true, 9000),
        r(false, 1000),
        r(true, 2000),
        r(true, 4000),
      ]);
      expect(s.currentStreak, 2);
      expect(s.currentStreakAverageTime, const Duration(seconds: 3));
      expect(s.bestStreak, 2);
    });

    test('remembers the best streak after it is broken', () {
      final s = Summary.of([r(true), r(true), r(true), r(false), r(true)]);
      expect(s.currentStreak, 1);
      expect(s.bestStreak, 3);
    });
  });

  test('lastN takes the most recent rounds', () {
    final rounds = [for (var i = 0; i < 5; i++) r(i.isEven, i)];
    expect(lastN(rounds, 2).map((x) => x.millis), [3, 4]);
    expect(lastN(rounds, 10).length, 5);
  });

  group('range ids', () {
    test('round-trip presets and custom ranges', () {
      expect(
        rangeIdFor(RangePreset.century20, utcDay(1, 1, 1), utcDay(1, 1, 1)),
        'century20',
      );
      final id = rangeIdFor(
        RangePreset.custom,
        utcDay(1900, 1, 1),
        utcDay(2050, 12, 31),
      );
      expect(id, 'custom:1900-01-01:2050-12-31');
      expect(parseRangeId(id), (
        RangePreset.custom,
        utcDay(1900, 1, 1),
        utcDay(2050, 12, 31),
      ));
      expect(parseRangeId('century20'), (RangePreset.century20, null, null));
      expect(parseRangeId('nonsense'), isNull);
    });
  });

  group('Stats persistence', () {
    test('records, reloads and clears', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final stats = Stats(prefs)
        ..record(r(true, 1500))
        ..record(
          RoundResult(
            rangeId: 'custom:1900-01-01:2050-12-31',
            correct: false,
            millis: null,
          ),
        );
      expect(stats.rounds.length, 2);
      expect(stats.rangeIds, ['custom:1900-01-01:2050-12-31', 'thisYear']);

      final reloaded = Stats(await SharedPreferences.getInstance());
      expect(reloaded.rounds.length, 2);
      expect(reloaded.rounds.first.millis, 1500);
      expect(reloaded.rounds.last.millis, isNull);
      expect(reloaded.forRange('thisYear').length, 1);

      reloaded.clear();
      expect(Stats(await SharedPreferences.getInstance()).rounds, isEmpty);
    });

    test('survives garbage in the preference', () async {
      SharedPreferences.setMockInitialValues({'rounds': '{not json'});
      expect(Stats(await SharedPreferences.getInstance()).rounds, isEmpty);
      SharedPreferences.setMockInitialValues({'rounds': '[1, {"r": 2}]'});
      expect(Stats(await SharedPreferences.getInstance()).rounds, isEmpty);
    });
  });
}
