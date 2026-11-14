import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/game/game_logic.dart';
import 'package:guessaday/main.dart';
import 'package:guessaday/reminders/reminder_schedule.dart';
import 'package:guessaday/reminders/reminders.dart';
import 'package:guessaday/settings/settings.dart';
import 'package:guessaday/stats/stats.dart';
import 'package:guessaday/ui/weekday_names.dart';
import 'package:integration_test/integration_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// App Store screenshots: a question, a correct answer, statistics with a
/// believable history, and the settings, in English and German. Run on the
/// iPhone 6.9" and iPad 13" Simulators with
///
/// ```sh
/// flutter drive --driver=test_driver/integration_test.dart \
///     --target=integration_test/store_screenshots_test.dart \
///     --dart-define=DEVICE=iphone -d DEVICE_ID
/// ```
///
/// The pictures land in `screenshots/LOCALE/DEVICE-N-NAME.png`.
/// Simulators only run debug builds, so the debug banner is switched off.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const device = String.fromEnvironment('DEVICE', defaultValue: 'device');

  for (final (store, locale) in [('en-US', 'en'), ('de-DE', 'de')]) {
    testWidgets('store screenshots $store', (tester) async {
      WidgetsApp.debugAllowBannerOverride = false;
      tester.platformDispatcher.localesTestValue = [Locale(locale)];
      addTearDown(tester.platformDispatcher.clearLocalesTestValue);

      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      await prefs.setInt('rangePreset', RangePreset.century20.index);
      await prefs.setBool('remindersEnabled', true);
      await prefs.setString('rounds', _history());

      await tester.pumpWidget(
        GuessadayApp(
          settings: Settings(prefs),
          stats: Stats(prefs),
          reminders: Reminders(_SilentReminders()),
        ),
      );
      await tester.pumpAndSettle();

      Future<void> shot(String name) async {
        await tester.pumpAndSettle();
        await binding.takeScreenshot('$store/$device-$name');
      }

      Future<void> back() async {
        await tester.tap(find.byType(BackButtonIcon));
        await tester.pumpAndSettle();
      }

      await shot('1-question');

      // Answer correctly, a few seconds in, so the timer reads plausibly.
      final dateText = tester
          .widget<Text>(
            find.descendant(
              of: find.byType(AnimatedOpacity),
              matching: find.byType(Text),
            ),
          )
          .data!;
      final date = DateFormat.yMMMMd(locale).parse(dateText);
      await Future<void>.delayed(const Duration(milliseconds: 6400));
      // Calls the row's handler instead of a simulated tap: on the Simulator
      // the tap's ink highlight stays visible in the screenshot, which it
      // does not on a phone.
      final row = find.ancestor(
        of: find.text(weekdayName(locale, date.weekday)),
        matching: find.byType(InkWell),
      );
      tester.widget<InkWell>(row).onTap!();
      await shot('2-answer');

      await tester.tap(find.byIcon(Icons.insights_outlined));
      await shot('3-statistics');
      await back();

      await tester.tap(find.byIcon(Icons.settings_outlined));
      await shot('4-settings');
      await tester.drag(find.byType(ListView), const Offset(0, -2000));
      await shot('5-reminders');
      await back();
    });
  }
}

/// About 300 rounds in the 20th century, getting faster and more accurate,
/// plus a few in this year's range.
String _history() {
  final random = Random(7);
  final rounds = <Map<String, Object>>[];
  for (var i = 0; i < 300; i++) {
    final progress = i / 300;
    rounds.add({
      'r': 'century20',
      'c': random.nextDouble() < 0.78 + 0.18 * progress,
      't': (14000 - 8000 * progress + random.nextInt(4000)).round(),
    });
  }
  for (var i = 0; i < 40; i++) {
    rounds.insert(random.nextInt(rounds.length), {
      'r': 'thisYear',
      'c': random.nextDouble() < 0.97,
      't': 2500 + random.nextInt(2500),
    });
  }
  // The latest rounds form a streak, as after a good session.
  for (final r
      in rounds.reversed.where((r) => r['r'] == 'century20').take(23)) {
    r['c'] = true;
  }
  return jsonEncode(rounds);
}

/// Shows the reminder settings without touching real notifications.
class _SilentReminders implements ReminderBackend {
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
  Future<void> replaceSchedule(List<ReminderRequest> requests) async {}

  @override
  Future<void> cancelAll() async {}
}
