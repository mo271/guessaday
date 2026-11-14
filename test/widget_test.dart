import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/main.dart';
import 'package:guessaday/reminders/reminder_schedule.dart';
import 'package:guessaday/reminders/reminder_sync.dart';
import 'package:guessaday/reminders/reminders.dart';
import 'package:guessaday/settings/settings.dart';
import 'package:guessaday/stats/stats.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<GuessadayApp> freshApp([
    Map<String, Object> values = const {},
    ReminderBackend reminders = const NoReminders(),
  ]) async {
    SharedPreferences.setMockInitialValues(values);
    final prefs = await SharedPreferences.getInstance();
    return GuessadayApp(
      settings: Settings(prefs),
      stats: Stats(prefs),
      reminders: Reminders(reminders),
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

  testWidgets('landscape puts the weekdays beside the date', (tester) async {
    tester.view.physicalSize = const Size(932, 430);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(await freshApp());
    await tester.pumpAndSettle();

    final date = tester.getCenter(find.byType(AnimatedOpacity));
    final monday = tester.getRect(find.text('Monday'));
    expect(monday.left, greaterThan(date.dx));
    // Rows big enough to tap: the seven share the full height.
    final row = tester.getSize(
      find.ancestor(of: find.text('Monday'), matching: find.byType(InkWell)),
    );
    expect(row.height, greaterThanOrEqualTo(44));
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

  testWidgets('time in the background does not count', (tester) async {
    await tester.pumpWidget(await freshApp());
    await tester.pumpAndSettle();

    final binding = tester.binding;
    for (final state in [
      AppLifecycleState.inactive,
      AppLifecycleState.hidden,
      AppLifecycleState.paused,
    ]) {
      binding.handleAppLifecycleStateChanged(state);
    }
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 1500)),
    );
    for (final state in [
      AppLifecycleState.hidden,
      AppLifecycleState.inactive,
      AppLifecycleState.resumed,
    ]) {
      binding.handleAppLifecycleStateChanged(state);
    }
    await tester.tap(find.text('Wednesday'));
    await tester.pump();

    final timer = tester.widget<Text>(
      find.textContaining(RegExp(r'^\d\d:\d\d\.\d\d$')),
    );
    expect(timer.data, startsWith('00:00.'));
  });

  testWidgets('reminders per day go from never through the Fibonacci numbers', (
    tester,
  ) async {
    final backend = _RecordingReminders();
    await tester.pumpWidget(
      await freshApp({'remindersEnabled': true}, backend),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Reminders per day'), 100);

    Future<void> pick(Finder option) async {
      await tester.tap(find.text('Reminders per day'));
      await tester.pumpAndSettle();
      await tester.tap(option);
      await tester.pumpAndSettle();
    }

    final dialog = find.byType(SimpleDialog);
    await tester.tap(find.text('Reminders per day'));
    await tester.pumpAndSettle();
    final labels = [
      for (final tile in tester.widgetList<RadioListTile<int>>(
        find.descendant(of: dialog, matching: find.byType(RadioListTile<int>)),
      ))
        (tile.title! as Text).data,
    ];
    expect(labels, [
      'Never',
      'Once a day',
      'Once a day',
      'Twice a day',
      '3 times a day',
      '5 times a day',
      '8 times a day',
      '13 times a day',
      '21 times a day',
      '34 times a day',
    ]);
    // Close the dialog without changing anything.
    await tester.tapAt(const Offset(4, 4));
    await tester.pumpAndSettle();

    await pick(find.descendant(of: dialog, matching: find.text('Never')));
    expect(find.text('Never'), findsOneWidget);
    expect(backend.cancelled, isTrue);

    await pick(
      find.descendant(of: dialog, matching: find.text('Once a day')).last,
    );
    expect(find.text('Once a day'), findsOneWidget);
    // One a day for a week; today's may already be past.
    expect(
      backend.scheduled.length,
      inInclusiveRange(ReminderSync.maxDays - 1, ReminderSync.maxDays),
    );
  });
}

/// A backend that only remembers what it was asked to do.
class _RecordingReminders implements ReminderBackend {
  bool cancelled = false;
  List<ReminderRequest> scheduled = [];

  @override
  bool get supported => true;

  @override
  int get maxPending => 60;

  @override
  Future<void> initialize(
    ReminderTexts texts,
    void Function(ReminderPayload payload) onOpen,
  ) async {}

  @override
  Future<ReminderPayload?> launchPayload() async => null;

  @override
  Future<bool> requestPermission() async => true;

  @override
  Future<void> replaceSchedule(List<ReminderRequest> requests) async {
    scheduled = requests;
  }

  @override
  Future<void> cancelAll() async {
    cancelled = true;
  }
}
