// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Setări';

  @override
  String get about => 'Despre';

  @override
  String get startDate => 'Data de început';

  @override
  String get endDate => 'Data de sfârșit';

  @override
  String get pickStartDate => 'Alegeți data de început';

  @override
  String get pickEndDate => 'Alegeți data de sfârșit';

  @override
  String get appDescription =>
      'Această aplicație afișează o dată aleatorie. Trebuie să calculați în ce zi a săptămânii cade și să o selectați pe cea corectă.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Dacă nu știți încă cum se calculează ziua săptămânii, puteți învăța cu siguranță:';

  @override
  String get moreInfo => 'Mai multe informații';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versiune';

  @override
  String get timer => 'Cronometru';

  @override
  String get enabled => 'Activat';

  @override
  String get disabled => 'Dezactivat';

  @override
  String get reappearMsg => 'Atingeți data ascunsă pentru a o afișa din nou!';

  @override
  String after(String duration) {
    return 'După $duration';
  }

  @override
  String get dateRange => 'Interval de date';

  @override
  String get firstDayInList => 'Prima zi din listă';

  @override
  String get localeDefault => 'Automat';

  @override
  String get shortDateDisplay => 'Afișare scurtă a datei';

  @override
  String get hideTheDate => 'Ascundeți data';

  @override
  String get rangeCustom => 'Interval personalizat';

  @override
  String get rangeThisMonth => 'Luna aceasta';

  @override
  String get rangeThisYear => 'Anul acesta';

  @override
  String get rangeNextYear => 'Anul viitor';

  @override
  String get rangeLast100Years => 'Ultimii 100 de ani';

  @override
  String get rangeCentury20 => 'Secolul al XX-lea';

  @override
  String get rangeCentury21 => 'Secolul al XXI-lea';

  @override
  String get rangeGregorianToToday => '1582-10-15 – azi';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistici';

  @override
  String get rounds => 'Runde';

  @override
  String get accuracy => 'Precizie';

  @override
  String get averageTime => 'Timp mediu';

  @override
  String get bestTime => 'Cel mai bun timp';

  @override
  String get currentStreak => 'Seria curentă';

  @override
  String get bestStreak => 'Cea mai lungă serie';

  @override
  String get allTime => 'Total';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ultimele $n de runde',
      few: 'Ultimele $n runde',
      one: 'Ultima rundă',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n de runde',
      few: '$n runde',
      one: '$n rundă',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Toate intervalele de date';

  @override
  String get noRoundsYet =>
      'Nicio rundă jucată încă. Statisticile apar aici după primul răspuns.';

  @override
  String get recentWindow => 'Runde în statisticile recente';

  @override
  String get resetStatistics => 'Resetați statisticile';

  @override
  String get resetStatisticsConfirm =>
      'Ștergeți toate rundele înregistrate? Această acțiune nu poate fi anulată.';

  @override
  String get delete => 'Ștergeți';

  @override
  String get cancel => 'Anulați';

  @override
  String withAverage(int count, String time) {
    return '$count · medie $time';
  }

  @override
  String get practiceReminders => 'Mementouri de exersare';

  @override
  String get practiceRemindersHint =>
      'Date aleatorii ca notificări pe parcursul zilei';

  @override
  String get remindersPerDay => 'Mementouri pe zi';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'De $n de ori pe zi',
      few: 'De $n ori pe zi',
      two: 'De două ori pe zi',
      one: 'O dată pe zi',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Cel mai devreme memento';

  @override
  String get latestReminder => 'Cel mai târziu memento';

  @override
  String get notificationsBlocked =>
      'Notificările pentru Guessaday sunt dezactivate. Permiteți-le în setările sistemului pentru a primi mementouri.';

  @override
  String get reminderTitle => 'Ce zi a săptămânii?';

  @override
  String get reveal => 'Dezvăluiți';

  @override
  String get practice => 'Exersați';
}
