<h1><img align="left" alt="guessaday icon" src="./assets/icon/icon.png" width="45px">Guessaday</h1>

An app for training mental calendar calculations: it shows a random date,
you work out which day of the week it falls on and tap the right one.

For more information, please visit https://firsching.ch/guessaday

[<img src="https://f-droid.org/badge/get-it-on.png"
      alt="Get it on F-Droid"
      height="90">](https://f-droid.org/packages/com.goltzkiste.guessaday/)

Version 2 is a Flutter rewrite of the original Java Android app (see the
git history before the `flutter-rewrite` branch for that code). It targets
Android, iOS, Linux desktop and the web from one Dart codebase.

## Features

- Random dates from configurable ranges (this month, this year, the 20th
  century, the Gregorian era, year 1 to 9999, or your own start and end).
- Stopwatch for each guess.
- "Short date display": the date fades out after a configurable delay; tap
  anywhere to bring it back.
- Dates and weekday names follow the device language. The settings strings
  are translated into English and German.

## Development

Requires the [Flutter SDK](https://docs.flutter.dev/get-started/install).

```sh
flutter pub get
flutter gen-l10n          # regenerate lib/l10n/app_localizations*.dart
flutter test
flutter run               # on a connected device or emulator
flutter build apk         # Android release APK (F-Droid id)
flutter build linux       # Linux desktop
flutter build ios         # macOS only
```

## Store builds

The app has two Android application ids:

- `com.goltzkiste.guessaday` is the default and what F-Droid builds. It is
  the id the app has had since the first release.
- `ch.firsching.guessaday` is used on Google Play, where the old name was
  not available to the current developer account. Select it with a Gradle
  property:

```sh
flutter build appbundle --release -Pstore=play
```

Release signing reads `android/key.properties` (see the comment in
`android/app/build.gradle.kts`). Without that file the release build is
signed with the debug key, which is what F-Droid's build server needs.
Store listing texts live in `fastlane/metadata/android/`.

Launcher icons are generated from `assets/icon/icon.png`:

```sh
dart run flutter_launcher_icons
```

## Layout

- `lib/game/game_logic.dart` – date ranges, random dates, weekday order, timing. Pure Dart, unit tested.
- `lib/settings/` – persisted preferences and the `InheritedNotifier` that exposes them.
- `lib/ui/` – game screen, settings screen, about dialog.
- `lib/l10n/` – ARB translation sources and the generated localizations.

## Contribute

Feel free to improve this app! You can open an issue or make a pull request.

## Translating

Add an `app_<lang>.arb` file next to `lib/l10n/app_en.arb`, translate the
values, and run `flutter gen-l10n`. Pull requests are welcome.

## Calendar note

All dates use the proleptic Gregorian calendar, which is what Dart's
`DateTime` implements. This also applies to dates before 15 October 1582,
where the original Java app used the Julian calendar instead. The usual
mental-calculation methods assume Gregorian anyway.

## License

See [LICENSE](LICENSE).
