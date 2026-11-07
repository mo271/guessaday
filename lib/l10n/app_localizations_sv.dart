// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Inställningar';

  @override
  String get about => 'Om appen';

  @override
  String get startDate => 'Startdatum';

  @override
  String get endDate => 'Slutdatum';

  @override
  String get pickStartDate => 'Välj startdatum';

  @override
  String get pickEndDate => 'Välj slutdatum';

  @override
  String get appDescription =>
      'Appen visar ett slumpmässigt datum. Din uppgift är att räkna ut vilken veckodag det är och välja rätt.';

  @override
  String get author => 'Utvecklare';

  @override
  String get howTo =>
      'Om du inte redan vet hur man räknar ut veckodagen kan du lätt lära dig det:';

  @override
  String get moreInfo => 'Mer information';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Version';

  @override
  String get timer => 'Stoppur';

  @override
  String get enabled => 'Aktiverat';

  @override
  String get disabled => 'Inaktiverat';

  @override
  String get reappearMsg => 'Tryck på det dolda datumet för att visa det igen!';

  @override
  String after(String duration) {
    return 'Efter $duration';
  }

  @override
  String get dateRange => 'Datumintervall';

  @override
  String get firstDayInList => 'Första dagen i listan';

  @override
  String get localeDefault => 'Automatiskt';

  @override
  String get shortDateDisplay => 'Visa datumet kort';

  @override
  String get hideTheDate => 'Dölj datumet';

  @override
  String get rangeCustom => 'Eget intervall';

  @override
  String get rangeThisMonth => 'Den här månaden';

  @override
  String get rangeThisYear => 'I år';

  @override
  String get rangeNextYear => 'Nästa år';

  @override
  String get rangeLast100Years => 'De senaste 100 åren';

  @override
  String get rangeCentury20 => '1900-talet';

  @override
  String get rangeCentury21 => '2000-talet';

  @override
  String get rangeGregorianToToday => '1582-10-15 – i dag';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistik';

  @override
  String get rounds => 'Omgångar';

  @override
  String get accuracy => 'Träffsäkerhet';

  @override
  String get averageTime => 'Genomsnittstid';

  @override
  String get bestTime => 'Bästa tid';

  @override
  String get currentStreak => 'Nuvarande svit';

  @override
  String get bestStreak => 'Längsta svit';

  @override
  String get allTime => 'Totalt';

  @override
  String lastNRounds(int n) {
    return 'Senaste $n omgångarna';
  }

  @override
  String nRounds(int n) {
    return '$n omgångar';
  }

  @override
  String get allRanges => 'Alla datumintervall';

  @override
  String get noRoundsYet =>
      'Inga omgångar spelade ännu. Statistiken visas här efter ditt första svar.';

  @override
  String get recentWindow => 'Omgångar i senaste statistiken';

  @override
  String get resetStatistics => 'Återställ statistik';

  @override
  String get resetStatisticsConfirm =>
      'Vill du radera alla sparade omgångar? Det går inte att ångra.';

  @override
  String get delete => 'Radera';

  @override
  String get cancel => 'Avbryt';

  @override
  String withAverage(int count, String time) {
    return '$count · snitt $time';
  }

  @override
  String get practiceReminders => 'Övningspåminnelser';

  @override
  String get practiceRemindersHint =>
      'Slumpmässiga datum som aviseringar under dagen';

  @override
  String get remindersPerDay => 'Påminnelser per dag';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gånger om dagen',
      two: 'Två gånger om dagen',
      one: 'En gång om dagen',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Tidigaste påminnelse';

  @override
  String get latestReminder => 'Senaste påminnelse';

  @override
  String get notificationsBlocked =>
      'Aviseringar är avstängda för Guessaday. Tillåt dem i systeminställningarna för att få påminnelser.';

  @override
  String get reminderTitle => 'Vilken veckodag?';

  @override
  String get reveal => 'Visa svar';

  @override
  String get practice => 'Öva';
}
