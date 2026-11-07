// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Innstillinger';

  @override
  String get about => 'Om appen';

  @override
  String get startDate => 'Startdato';

  @override
  String get endDate => 'Sluttdato';

  @override
  String get pickStartDate => 'Velg startdato';

  @override
  String get pickEndDate => 'Velg sluttdato';

  @override
  String get appDescription =>
      'Appen viser en tilfeldig dato. Oppgaven din er å regne ut hvilken ukedag det er, og velge riktig.';

  @override
  String get author => 'Utvikler';

  @override
  String get howTo =>
      'Hvis du ikke vet hvordan man regner ut ukedagen ennå, kan du lett lære det:';

  @override
  String get moreInfo => 'Mer informasjon';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versjon';

  @override
  String get timer => 'Stoppeklokke';

  @override
  String get enabled => 'Slått på';

  @override
  String get disabled => 'Slått av';

  @override
  String get reappearMsg => 'Trykk på den skjulte datoen for å vise den igjen!';

  @override
  String after(String duration) {
    return 'Etter $duration';
  }

  @override
  String get dateRange => 'Datointervall';

  @override
  String get firstDayInList => 'Første dag i listen';

  @override
  String get localeDefault => 'Automatisk';

  @override
  String get shortDateDisplay => 'Vis datoen kort';

  @override
  String get hideTheDate => 'Skjul datoen';

  @override
  String get rangeCustom => 'Eget intervall';

  @override
  String get rangeThisMonth => 'Denne måneden';

  @override
  String get rangeThisYear => 'I år';

  @override
  String get rangeNextYear => 'Neste år';

  @override
  String get rangeLast100Years => 'De siste 100 årene';

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
  String get statistics => 'Statistikk';

  @override
  String get rounds => 'Runder';

  @override
  String get accuracy => 'Treffsikkerhet';

  @override
  String get averageTime => 'Gjennomsnittstid';

  @override
  String get bestTime => 'Beste tid';

  @override
  String get currentStreak => 'Nåværende rekke';

  @override
  String get bestStreak => 'Lengste rekke';

  @override
  String get allTime => 'Totalt';

  @override
  String lastNRounds(int n) {
    return 'Siste $n runder';
  }

  @override
  String nRounds(int n) {
    return '$n runder';
  }

  @override
  String get allRanges => 'Alle datointervaller';

  @override
  String get noRoundsYet =>
      'Ingen runder spilt ennå. Statistikken vises her etter ditt første svar.';

  @override
  String get recentWindow => 'Runder i nyeste statistikk';

  @override
  String get resetStatistics => 'Nullstill statistikk';

  @override
  String get resetStatisticsConfirm =>
      'Vil du slette alle lagrede runder? Dette kan ikke angres.';

  @override
  String get delete => 'Slett';

  @override
  String get cancel => 'Avbryt';

  @override
  String withAverage(int count, String time) {
    return '$count · snitt $time';
  }

  @override
  String get practiceReminders => 'Øvingspåminnelser';

  @override
  String get practiceRemindersHint =>
      'Tilfeldige datoer som varsler i løpet av dagen';

  @override
  String get remindersPerDay => 'Påminnelser per dag';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ganger om dagen',
      two: 'To ganger om dagen',
      one: 'Én gang om dagen',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Tidligste påminnelse';

  @override
  String get latestReminder => 'Seneste påminnelse';

  @override
  String get notificationsBlocked =>
      'Varsler er slått av for Guessaday. Tillat dem i systeminnstillingene for å få påminnelser.';

  @override
  String get reminderTitle => 'Hvilken ukedag?';

  @override
  String get reveal => 'Vis svar';

  @override
  String get practice => 'Øv';
}
