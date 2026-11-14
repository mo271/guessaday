import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/main.dart';
import 'package:guessaday/reminders/local_notifications_backend.dart';
import 'package:guessaday/reminders/reminders.dart';
import 'package:guessaday/settings/settings.dart';
import 'package:guessaday/stats/stats.dart';
import 'package:guessaday/ui/weekday_names.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Walks through every screen on a real device or simulator and saves a
/// screenshot of each. Run with
///
///     flutter drive --driver=test_driver/integration_test.dart \
///         --target=integration_test/screenshots_test.dart -d <device>
///
/// The pictures land in screenshots/. On Android emulators with host GPU
/// rendering the screenshot capture fails under Impeller, so add
/// `--no-enable-impeller` there. CI runs this on the iOS Simulator, which
/// is the only way to see the iOS build without a Mac.
void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // flutter drive builds in debug mode; keep the DEBUG banner out of the
  // pictures so they can be used as store screenshots.
  WidgetsApp.debugAllowBannerOverride = false;

  testWidgets('screens render', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // The real notification backend, so that the plugin's start-up on this
    // platform is exercised too. It must not prompt for permission here.
    await tester.pumpWidget(
      GuessadayApp(
        settings: Settings(prefs),
        stats: Stats(prefs),
        reminders: Reminders(LocalNotificationsBackend()),
      ),
    );
    await tester.pumpAndSettle();
    if (Platform.isAndroid) await binding.convertFlutterSurfaceToImage();

    Future<void> back() async {
      await tester.tap(find.byType(BackButtonIcon));
      await tester.pumpAndSettle();
    }

    Future<void> shot(String name) async {
      await tester.pumpAndSettle();
      await binding.takeScreenshot(name);
    }

    await shot('1-game');

    // A few rounds, so that the statistics have something to show.
    final locale = Localizations.localeOf(
      tester.element(find.byType(Scaffold)),
    ).toString();
    Finder weekday(int day) => find.text(weekdayName(locale, day));
    for (var i = 0; i < 5; i++) {
      await tester.tap(weekday(DateTime.monday + i));
      await tester.pump(const Duration(milliseconds: 400));
      if (i == 0) await shot('2-answered');
      // The next round starts on the following tap.
      await tester.tap(weekday(DateTime.thursday));
      await tester.pump(const Duration(milliseconds: 400));
    }

    await tester.tap(find.byIcon(Icons.insights_outlined));
    await shot('3-statistics');
    await back();

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await shot('4-settings');
    await tester.drag(find.byType(ListView), const Offset(0, -2000));
    await shot('5-settings-end');
    await back();

    await tester.tap(find.byIcon(Icons.info_outline));
    await shot('6-about');
  });
}
