// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Indstillinger';

  @override
  String get about => 'Om appen';

  @override
  String get startDate => 'Startdato';

  @override
  String get endDate => 'Slutdato';

  @override
  String get pickStartDate => 'Vælg startdato';

  @override
  String get pickEndDate => 'Vælg slutdato';

  @override
  String get appDescription =>
      'Appen viser en tilfældig dato. Din opgave er at regne ud, hvilken ugedag det er, og vælge den rigtige.';

  @override
  String get author => 'Udvikler';

  @override
  String get howTo =>
      'Hvis du endnu ikke ved, hvordan man regner ugedagen ud, kan du sagtens lære det:';

  @override
  String get moreInfo => 'Mere information';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Version';

  @override
  String get timer => 'Stopur';

  @override
  String get enabled => 'Slået til';

  @override
  String get disabled => 'Slået fra';

  @override
  String get reappearMsg => 'Tryk på den skjulte dato for at vise den igen!';

  @override
  String after(String duration) {
    return 'Efter $duration';
  }

  @override
  String get dateRange => 'Datointerval';

  @override
  String get firstDayInList => 'Første dag i listen';

  @override
  String get localeDefault => 'Automatisk';

  @override
  String get shortDateDisplay => 'Vis datoen kortvarigt';

  @override
  String get hideTheDate => 'Skjul datoen';

  @override
  String get rangeCustom => 'Eget interval';

  @override
  String get rangeThisMonth => 'Denne måned';

  @override
  String get rangeThisYear => 'I år';

  @override
  String get rangeNextYear => 'Næste år';

  @override
  String get rangeLast100Years => 'De seneste 100 år';

  @override
  String get rangeCentury20 => '1900-tallet';

  @override
  String get rangeCentury21 => '2000-tallet';

  @override
  String get rangeGregorianToToday => '1582-10-15 – i dag';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistik';

  @override
  String get rounds => 'Runder';

  @override
  String get accuracy => 'Træfsikkerhed';

  @override
  String get averageTime => 'Gennemsnitstid';

  @override
  String get bestTime => 'Bedste tid';

  @override
  String get currentStreak => 'Nuværende stime';

  @override
  String get bestStreak => 'Længste stime';

  @override
  String get allTime => 'Samlet';

  @override
  String lastNRounds(int n) {
    return 'Seneste $n runder';
  }

  @override
  String nRounds(int n) {
    return '$n runder';
  }

  @override
  String get allRanges => 'Alle datointervaller';

  @override
  String get noRoundsYet =>
      'Ingen runder spillet endnu. Statistikken vises her efter dit første svar.';

  @override
  String get recentWindow => 'Runder i den seneste statistik';

  @override
  String get resetStatistics => 'Nulstil statistik';

  @override
  String get resetStatisticsConfirm =>
      'Vil du slette alle gemte runder? Det kan ikke fortrydes.';

  @override
  String get delete => 'Slet';

  @override
  String get cancel => 'Annuller';

  @override
  String withAverage(int count, String time) {
    return '$count · gns. $time';
  }

  @override
  String get practiceReminders => 'Øvelsespåmindelser';

  @override
  String get practiceRemindersHint =>
      'Tilfældige datoer som notifikationer i løbet af dagen';

  @override
  String get remindersPerDay => 'Påmindelser pr. dag';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gange om dagen',
      two: 'To gange om dagen',
      one: 'En gang om dagen',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Tidligste påmindelse';

  @override
  String get latestReminder => 'Seneste påmindelse';

  @override
  String get notificationsBlocked =>
      'Notifikationer er slået fra for Guessaday. Tillad dem i systemindstillingerne for at få påmindelser.';

  @override
  String get reminderTitle => 'Hvilken ugedag?';

  @override
  String get reveal => 'Vis svar';

  @override
  String get practice => 'Øv';
}
