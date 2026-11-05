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
- Statistics per date range: accuracy, times and streaks.
- Optional practice reminders: a few random dates a day arrive as
  notifications, with "Reveal" and "Practice" buttons. Off by default; the
  notification permission is only requested when you turn them on.
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

Releasing a new version:

1. Bump `version` in `pubspec.yaml` (`x.y.z+N`, with `N` strictly increasing)
   and add `fastlane/metadata/android/*/changelogs/N.txt`.
2. Commit, tag `vx.y.z` and push the tag.
3. Google Play: build the bundle with `-Pstore=play` and upload it.
4. F-Droid: nothing to do. Its update bot sees the tag and reuses the build
   recipe in [fdroiddata](https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.goltzkiste.guessaday.yml).
   Both that recipe and CI read the exact Flutter version from
   `environment.flutter` in `pubspec.yaml`; when upgrading Flutter, change it
   there. F-Droid ships one APK per ABI with version code `N * 10 + abi`
   (see `android/app/build.gradle.kts`); Play gets the bundle with plain `N`.

Launcher icons are generated from `assets/icon/icon.png`:

```sh
dart run flutter_launcher_icons
```

## Layout

- `lib/game/game_logic.dart` – date ranges, random dates, weekday order, timing. Pure Dart, unit tested.
- `lib/settings/` – persisted preferences and the `InheritedNotifier` that exposes them.
- `lib/stats/` – recorded rounds and their summaries.
- `lib/reminders/` – practice reminders: `reminder_schedule.dart` draws the
  random moments (pure Dart, unit tested), `reminder_sync.dart` keeps the
  scheduled notifications in line with the settings, and
  `local_notifications_backend.dart` talks to `flutter_local_notifications`.
  Reminders are scheduled a week ahead and refreshed whenever the app is
  opened. "Reveal" runs in a background isolate and replaces the question
  with the answer; "Practice" opens the app on that date.
- `lib/ui/` – game screen, settings screen, statistics screen, about dialog.
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

## Fonts

The app text is set in [Libertinus Serif](https://github.com/alerque/libertinus),
bundled under `fonts/` with its SIL Open Font License (`fonts/OFL-Libertinus.txt`).

## License

See [LICENSE](LICENSE).
