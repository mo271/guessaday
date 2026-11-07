// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Instellingen';

  @override
  String get about => 'Over';

  @override
  String get startDate => 'Begindatum';

  @override
  String get endDate => 'Einddatum';

  @override
  String get pickStartDate => 'Begindatum kiezen';

  @override
  String get pickEndDate => 'Einddatum kiezen';

  @override
  String get appDescription =>
      'Deze app toont een willekeurige datum. Je moet dan berekenen op welke dag van de week die valt en de juiste dag kiezen.';

  @override
  String get author => 'Auteur';

  @override
  String get howTo =>
      'Als je nog niet weet hoe je de dag van de week berekent, kun je dat zeker leren:';

  @override
  String get moreInfo => 'Meer informatie';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versie';

  @override
  String get timer => 'Stopwatch';

  @override
  String get enabled => 'Ingeschakeld';

  @override
  String get disabled => 'Uitgeschakeld';

  @override
  String get reappearMsg => 'Tik op de verborgen datum om die weer te tonen!';

  @override
  String after(String duration) {
    return 'Na $duration';
  }

  @override
  String get dateRange => 'Periode';

  @override
  String get firstDayInList => 'Eerste dag in de lijst';

  @override
  String get localeDefault => 'Automatisch';

  @override
  String get shortDateDisplay => 'Datum kort weergeven';

  @override
  String get hideTheDate => 'Datum verbergen';

  @override
  String get rangeCustom => 'Eigen periode';

  @override
  String get rangeThisMonth => 'Deze maand';

  @override
  String get rangeThisYear => 'Dit jaar';

  @override
  String get rangeNextYear => 'Volgend jaar';

  @override
  String get rangeLast100Years => 'De afgelopen 100 jaar';

  @override
  String get rangeCentury20 => 'De 20e eeuw';

  @override
  String get rangeCentury21 => 'De 21e eeuw';

  @override
  String get rangeGregorianToToday => '1582-10-15 – vandaag';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistieken';

  @override
  String get rounds => 'Rondes';

  @override
  String get accuracy => 'Nauwkeurigheid';

  @override
  String get averageTime => 'Gemiddelde tijd';

  @override
  String get bestTime => 'Beste tijd';

  @override
  String get currentStreak => 'Huidige reeks';

  @override
  String get bestStreak => 'Beste reeks';

  @override
  String get allTime => 'Totaal';

  @override
  String lastNRounds(int n) {
    return 'Laatste $n rondes';
  }

  @override
  String nRounds(int n) {
    return '$n rondes';
  }

  @override
  String get allRanges => 'Alle periodes';

  @override
  String get noRoundsYet =>
      'Nog geen rondes gespeeld. Na je eerste antwoord verschijnen hier de statistieken.';

  @override
  String get recentWindow => 'Rondes in recente statistieken';

  @override
  String get resetStatistics => 'Statistieken resetten';

  @override
  String get resetStatisticsConfirm =>
      'Alle opgeslagen rondes verwijderen? Dit kan niet ongedaan worden gemaakt.';

  @override
  String get delete => 'Verwijderen';

  @override
  String get cancel => 'Annuleren';

  @override
  String withAverage(int count, String time) {
    return '$count · gem. $time';
  }

  @override
  String get practiceReminders => 'Oefenherinneringen';

  @override
  String get practiceRemindersHint =>
      'Willekeurige datums als meldingen gedurende de dag';

  @override
  String get remindersPerDay => 'Herinneringen per dag';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n keer per dag',
      two: 'Twee keer per dag',
      one: 'Eén keer per dag',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Vroegste herinnering';

  @override
  String get latestReminder => 'Laatste herinnering';

  @override
  String get notificationsBlocked =>
      'Meldingen zijn uitgeschakeld voor Guessaday. Sta ze toe in de systeeminstellingen om herinneringen te ontvangen.';

  @override
  String get reminderTitle => 'Welke dag van de week?';

  @override
  String get reveal => 'Onthullen';

  @override
  String get practice => 'Oefenen';
}
