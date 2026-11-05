// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Einstellungen';

  @override
  String get about => 'Info';

  @override
  String get startDate => 'Erstes Datum';

  @override
  String get endDate => 'Letztes Datum';

  @override
  String get pickStartDate => 'Wähle Anfang';

  @override
  String get pickEndDate => 'Wähle Ende';

  @override
  String get appDescription =>
      'Diese App zeigt ein zufälliges Datum an. Der passende Wochentag soll dann errechnet und ausgewählt werden.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Man kann leicht lernen, wie man den Wochentag für ein beliebiges Datum ausrechnet:';

  @override
  String get moreInfo => 'Mehr Informationen';

  @override
  String get ok => 'Ok';

  @override
  String get version => 'Version';

  @override
  String get timer => 'Stoppuhr';

  @override
  String get enabled => 'aktiviert';

  @override
  String get disabled => 'deaktiviert';

  @override
  String get reappearMsg =>
      'Tippe auf das versteckte Datum um es nochmal zu sehen!';

  @override
  String after(String duration) {
    return 'Nach $duration';
  }

  @override
  String get dateRange => 'Zeitraum';

  @override
  String get firstDayInList => 'Erster Tag in der Liste';

  @override
  String get localeDefault => 'Automatisch';

  @override
  String get shortDateDisplay => 'Datum nur kurz anzeigen';

  @override
  String get hideTheDate => 'Verstecke das Datum';

  @override
  String get rangeCustom => 'Wähle eigenen Zeitraum';

  @override
  String get rangeThisMonth => 'Aktueller Monat';

  @override
  String get rangeThisYear => 'Dieses Jahr';

  @override
  String get rangeNextYear => 'Nächstes Jahr';

  @override
  String get rangeLast100Years => 'Die vergangenen 100 Jahre';

  @override
  String get rangeCentury20 => 'Das 20. Jahrhundert';

  @override
  String get rangeCentury21 => 'Das 21. Jahrhundert';

  @override
  String get rangeGregorianToToday => '1582-10-15 – heute';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistik';

  @override
  String get rounds => 'Runden';

  @override
  String get accuracy => 'Trefferquote';

  @override
  String get averageTime => 'Durchschnittszeit';

  @override
  String get bestTime => 'Bestzeit';

  @override
  String get currentStreak => 'Aktuelle Serie';

  @override
  String get bestStreak => 'Längste Serie';

  @override
  String get allTime => 'Insgesamt';

  @override
  String lastNRounds(int n) {
    return 'Letzte $n Runden';
  }

  @override
  String nRounds(int n) {
    return '$n Runden';
  }

  @override
  String get allRanges => 'Alle Zeiträume';

  @override
  String get noRoundsYet =>
      'Noch keine Runden gespielt. Nach der ersten Antwort erscheint hier die Statistik.';

  @override
  String get recentWindow => 'Runden in der aktuellen Statistik';

  @override
  String get resetStatistics => 'Statistik zurücksetzen';

  @override
  String get resetStatisticsConfirm =>
      'Alle gespeicherten Runden löschen? Das lässt sich nicht rückgängig machen.';

  @override
  String get delete => 'Löschen';

  @override
  String get cancel => 'Abbrechen';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }

  @override
  String get practiceReminders => 'Übungserinnerungen';

  @override
  String get practiceRemindersHint =>
      'Zufällige Daten als Benachrichtigung über den Tag verteilt';

  @override
  String get remindersPerDay => 'Erinnerungen pro Tag';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n-mal täglich',
      two: 'Zweimal täglich',
      one: 'Einmal täglich',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Früheste Erinnerung';

  @override
  String get latestReminder => 'Späteste Erinnerung';

  @override
  String get notificationsBlocked =>
      'Benachrichtigungen sind für Guessaday ausgeschaltet. Erlaube sie in den Systemeinstellungen, um Erinnerungen zu erhalten.';

  @override
  String get reminderTitle => 'Welcher Wochentag?';

  @override
  String get reveal => 'Auflösen';

  @override
  String get practice => 'Üben';

  @override
  String betweenNumbers(int min, int max) {
    return 'Zwischen $min und $max';
  }
}
