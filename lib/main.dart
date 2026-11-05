import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'reminders/local_notifications_backend.dart';
import 'reminders/reminder_sync.dart';
import 'reminders/reminders.dart';
import 'reminders/reminders_scope.dart';
import 'settings/settings.dart';
import 'settings/settings_scope.dart';
import 'stats/stats.dart';
import 'stats/stats_scope.dart';
import 'ui/game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    GuessadayApp(
      settings: Settings(prefs),
      stats: Stats(prefs),
      reminders: Reminders(_reminderBackend()),
    ),
  );
}

/// Practice reminders exist where local notifications do.
ReminderBackend _reminderBackend() {
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)) {
    return LocalNotificationsBackend();
  }
  return const NoReminders();
}

class GuessadayApp extends StatelessWidget {
  const GuessadayApp({
    super.key,
    required this.settings,
    required this.stats,
    required this.reminders,
  });

  final Settings settings;
  final Stats stats;
  final Reminders reminders;

  static const _seed = Color(0xFF3F51B5);

  /// Libertinus Serif (bundled, OFL) for all text. Glyphs it lacks, e.g. in
  /// CJK or Arabic dates, fall back to the platform fonts automatically.
  static ThemeData _theme(Brightness brightness) {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seed,
        brightness: brightness,
      ),
      fontFamily: 'Libertinus Serif',
    );
    // Libertinus has a small x-height, so Material's default sizes read a
    // step smaller than intended. Lists, dialogs and the app bar get a bump.
    final text = base.textTheme;
    return base.copyWith(
      textTheme: text.copyWith(
        bodyLarge: text.bodyLarge?.copyWith(fontSize: 20),
        bodyMedium: text.bodyMedium?.copyWith(fontSize: 16),
        titleLarge: text.titleLarge?.copyWith(fontSize: 26),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: text.bodyLarge?.copyWith(fontSize: 20),
        subtitleTextStyle: text.bodyMedium?.copyWith(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      settings: settings,
      child: StatsScope(
        stats: stats,
        child: RemindersScope(
          reminders: reminders,
          child: MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context).appName,
            theme: _theme(Brightness.light),
            darkTheme: _theme(Brightness.dark),
            localizationsDelegates: const [
              FallbackAppLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: supportedLocales,
            builder: (context, child) => ReminderSync(child: child!),
            home: const GameScreen(),
          ),
        ),
      ),
    );
  }
}
