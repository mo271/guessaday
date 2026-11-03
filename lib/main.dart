import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'settings/settings.dart';
import 'settings/settings_scope.dart';
import 'ui/game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(GuessadayApp(settings: Settings(prefs)));
}

class GuessadayApp extends StatelessWidget {
  const GuessadayApp({super.key, required this.settings});

  final Settings settings;

  static const _seed = Color(0xFF3F51B5);

  @override
  Widget build(BuildContext context) {
    return SettingsScope(
      settings: settings,
      child: MaterialApp(
        onGenerateTitle: (context) => AppLocalizations.of(context).appName,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed)),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: _seed,
            brightness: Brightness.dark,
          ),
        ),
        localizationsDelegates: const [
          FallbackAppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: supportedLocales,
        home: const GameScreen(),
      ),
    );
  }
}
