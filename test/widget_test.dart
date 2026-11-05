import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/main.dart';
import 'package:guessaday/reminders/reminders.dart';
import 'package:guessaday/settings/settings.dart';
import 'package:guessaday/stats/stats.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<GuessadayApp> freshApp([Map<String, Object> values = const {}]) async {
    SharedPreferences.setMockInitialValues(values);
    final prefs = await SharedPreferences.getInstance();
    return GuessadayApp(
      settings: Settings(prefs),
      stats: Stats(prefs),
      reminders: Reminders(const NoReminders()),
    );
  }

  testWidgets('shows a date, seven weekdays, and reacts to a guess', (
    tester,
  ) async {
    await tester.pumpWidget(await freshApp());
    await tester.pumpAndSettle();

    for (final day in [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ]) {
      expect(find.text(day), findsOneWidget);
    }
    // No timer before answering.
    expect(find.textContaining(RegExp(r'^\d\d:\d\d\.\d\d$')), findsNothing);

    await tester.tap(find.text('Wednesday'));
    await tester.pump();

    expect(find.textContaining(RegExp(r'^\d\d:\d\d\.\d\d$')), findsOneWidget);
  });

  testWidgets('settings screen opens and shows the date range', (tester) async {
    await tester.pumpWidget(await freshApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();

    expect(find.text('Date range'), findsOneWidget);
    expect(find.text('Pick your own'), findsOneWidget);
    expect(find.text('Jan 1, 1900'), findsOneWidget);
  });

  testWidgets('hidden-date mode fades the date out after the delay', (
    tester,
  ) async {
    await tester.pumpWidget(
      await freshApp({'hideDate': true, 'hideAfterSeconds': 0.5}),
    );
    await tester.pumpAndSettle();

    final opacity = find.byType(AnimatedOpacity);
    expect(tester.widget<AnimatedOpacity>(opacity).opacity, 1);

    await tester.pump(const Duration(milliseconds: 600));
    expect(tester.widget<AnimatedOpacity>(opacity).opacity, 0);
    await tester.pumpAndSettle();
  });
}
