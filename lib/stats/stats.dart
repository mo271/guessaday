import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../game/game_logic.dart';

/// One answered round, as stored.
@immutable
class RoundResult {
  const RoundResult({
    required this.rangeId,
    required this.correct,
    required this.millis,
  });

  /// Which date range the round was played in, see [rangeIdFor].
  final String rangeId;
  final bool correct;

  /// Time to answer, or null when the timer was off.
  final int? millis;

  Map<String, Object?> toJson() => {
    'r': rangeId,
    'c': correct,
    if (millis != null) 't': millis,
  };

  static RoundResult? fromJson(Object? json) {
    if (json is! Map) return null;
    final rangeId = json['r'];
    final correct = json['c'];
    final millis = json['t'];
    if (rangeId is! String || correct is! bool) return null;
    return RoundResult(
      rangeId: rangeId,
      correct: correct,
      millis: millis is int ? millis : null,
    );
  }
}

/// A stable identifier for a date range: the preset name, or for the
/// custom range its two dates.
String rangeIdFor(RangePreset preset, DateTime start, DateTime end) {
  if (preset != RangePreset.custom) return preset.name;
  String day(DateTime d) => d.toIso8601String().substring(0, 10);
  return 'custom:${day(start)}:${day(end)}';
}

/// The inverse of [rangeIdFor]. Returns null for unknown ids.
(RangePreset, DateTime?, DateTime?)? parseRangeId(String id) {
  if (id.startsWith('custom:')) {
    final parts = id.split(':');
    if (parts.length != 3) return null;
    final start = DateTime.tryParse(parts[1]);
    final end = DateTime.tryParse(parts[2]);
    if (start == null || end == null) return null;
    return (RangePreset.custom, toUtcDay(start), toUtcDay(end));
  }
  for (final preset in RangePreset.values) {
    if (preset.name == id) return (preset, null, null);
  }
  return null;
}

/// Aggregated numbers over a list of rounds, oldest first.
@immutable
class Summary {
  const Summary({
    required this.rounds,
    required this.correct,
    required this.timedRounds,
    required this.totalMillis,
    required this.bestMillis,
    required this.currentStreak,
    required this.currentStreakTimed,
    required this.currentStreakMillis,
    required this.bestStreak,
  });

  static const empty = Summary(
    rounds: 0,
    correct: 0,
    timedRounds: 0,
    totalMillis: 0,
    bestMillis: null,
    currentStreak: 0,
    currentStreakTimed: 0,
    currentStreakMillis: 0,
    bestStreak: 0,
  );

  factory Summary.of(Iterable<RoundResult> results) {
    var rounds = 0;
    var correct = 0;
    var timed = 0;
    var total = 0;
    int? best;
    var streak = 0;
    var streakTimed = 0;
    var streakMillis = 0;
    var bestStreak = 0;
    for (final r in results) {
      rounds++;
      final t = r.millis;
      if (r.correct) {
        correct++;
        streak++;
        if (streak > bestStreak) bestStreak = streak;
        if (t != null) {
          timed++;
          total += t;
          streakTimed++;
          streakMillis += t;
          if (best == null || t < best) best = t;
        }
      } else {
        streak = 0;
        streakTimed = 0;
        streakMillis = 0;
      }
    }
    return Summary(
      rounds: rounds,
      correct: correct,
      timedRounds: timed,
      totalMillis: total,
      bestMillis: best,
      currentStreak: streak,
      currentStreakTimed: streakTimed,
      currentStreakMillis: streakMillis,
      bestStreak: bestStreak,
    );
  }

  final int rounds;
  final int correct;

  /// Correct rounds that were timed. Times of wrong answers are not
  /// interesting, so averages and best times only count correct ones.
  final int timedRounds;
  final int totalMillis;
  final int? bestMillis;
  final int currentStreak;
  final int currentStreakTimed;
  final int currentStreakMillis;
  final int bestStreak;

  double? get accuracy => rounds == 0 ? null : correct / rounds;

  Duration? get averageTime => timedRounds == 0
      ? null
      : Duration(milliseconds: totalMillis ~/ timedRounds);

  Duration? get bestTime =>
      bestMillis == null ? null : Duration(milliseconds: bestMillis!);

  Duration? get currentStreakAverageTime => currentStreakTimed == 0
      ? null
      : Duration(milliseconds: currentStreakMillis ~/ currentStreakTimed);
}

/// Answered rounds, persisted with shared_preferences as one JSON list.
class Stats extends ChangeNotifier {
  Stats(this._prefs) : _rounds = _load(_prefs);

  static const _key = 'rounds';

  /// Oldest rounds are dropped beyond this, which keeps the stored string
  /// well under a megabyte.
  static const maxRounds = 20000;

  final SharedPreferences _prefs;
  final List<RoundResult> _rounds;

  /// All stored rounds, oldest first.
  List<RoundResult> get rounds => List.unmodifiable(_rounds);

  /// Range ids with at least one round, most recently played first.
  List<String> get rangeIds {
    final seen = <String>{};
    for (final r in _rounds.reversed) {
      seen.add(r.rangeId);
    }
    return seen.toList();
  }

  Iterable<RoundResult> forRange(String rangeId) =>
      _rounds.where((r) => r.rangeId == rangeId);

  void record(RoundResult result) {
    _rounds.add(result);
    if (_rounds.length > maxRounds) {
      _rounds.removeRange(0, _rounds.length - maxRounds);
    }
    _save();
    notifyListeners();
  }

  void clear() {
    _rounds.clear();
    _save();
    notifyListeners();
  }

  void _save() {
    _prefs.setString(_key, jsonEncode([for (final r in _rounds) r.toJson()]));
  }

  static List<RoundResult> _load(SharedPreferences prefs) {
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return [for (final item in decoded) ?RoundResult.fromJson(item)];
    } on FormatException {
      return [];
    }
  }
}

/// The last [n] of [results].
Iterable<RoundResult> lastN(List<RoundResult> results, int n) =>
    results.length <= n ? results : results.sublist(results.length - n);
