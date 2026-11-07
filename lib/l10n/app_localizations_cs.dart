// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Nastavení';

  @override
  String get about => 'O aplikaci';

  @override
  String get startDate => 'Počáteční datum';

  @override
  String get endDate => 'Koncové datum';

  @override
  String get pickStartDate => 'Vybrat počáteční datum';

  @override
  String get pickEndDate => 'Vybrat koncové datum';

  @override
  String get appDescription =>
      'Tato aplikace zobrazí náhodné datum. Vaším úkolem je spočítat, na který den v týdnu připadá, a vybrat ten správný.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Pokud ještě nevíte, jak den v týdnu spočítat, určitě se to můžete naučit:';

  @override
  String get moreInfo => 'Další informace';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Verze';

  @override
  String get timer => 'Stopky';

  @override
  String get enabled => 'Zapnuto';

  @override
  String get disabled => 'Vypnuto';

  @override
  String get reappearMsg => 'Klepnutím na skryté datum ho znovu zobrazíte!';

  @override
  String after(String duration) {
    return 'Po $duration';
  }

  @override
  String get dateRange => 'Rozsah dat';

  @override
  String get firstDayInList => 'První den v seznamu';

  @override
  String get localeDefault => 'Automaticky';

  @override
  String get shortDateDisplay => 'Krátké zobrazení data';

  @override
  String get hideTheDate => 'Skrývat datum';

  @override
  String get rangeCustom => 'Vlastní rozsah';

  @override
  String get rangeThisMonth => 'Tento měsíc';

  @override
  String get rangeThisYear => 'Tento rok';

  @override
  String get rangeNextYear => 'Příští rok';

  @override
  String get rangeLast100Years => 'Posledních 100 let';

  @override
  String get rangeCentury20 => '20. století';

  @override
  String get rangeCentury21 => '21. století';

  @override
  String get rangeGregorianToToday => '1582-10-15 – dnes';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistiky';

  @override
  String get rounds => 'Kola';

  @override
  String get accuracy => 'Úspěšnost';

  @override
  String get averageTime => 'Průměrný čas';

  @override
  String get bestTime => 'Nejlepší čas';

  @override
  String get currentStreak => 'Aktuální série';

  @override
  String get bestStreak => 'Nejdelší série';

  @override
  String get allTime => 'Celkem';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Posledních $n kol',
      many: 'Posledních $n kol',
      few: 'Poslední $n kola',
      one: 'Poslední kolo',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kol',
      many: '$n kola',
      few: '$n kola',
      one: '$n kolo',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Všechny rozsahy dat';

  @override
  String get noRoundsYet =>
      'Zatím nebylo odehráno žádné kolo. Statistiky se zde zobrazí po první odpovědi.';

  @override
  String get recentWindow => 'Kola v nedávných statistikách';

  @override
  String get resetStatistics => 'Vynulovat statistiky';

  @override
  String get resetStatisticsConfirm =>
      'Smazat všechna zaznamenaná kola? Tuto akci nelze vrátit zpět.';

  @override
  String get delete => 'Smazat';

  @override
  String get cancel => 'Zrušit';

  @override
  String withAverage(int count, String time) {
    return '$count · prům. $time';
  }

  @override
  String get practiceReminders => 'Připomenutí procvičování';

  @override
  String get practiceRemindersHint => 'Náhodná data jako oznámení během dne';

  @override
  String get remindersPerDay => 'Připomenutí za den';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '${n}krát denně',
      many: '${n}krát denně',
      few: '${n}krát denně',
      two: 'Dvakrát denně',
      one: 'Jednou denně',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Nejdřívější připomenutí';

  @override
  String get latestReminder => 'Nejpozdější připomenutí';

  @override
  String get notificationsBlocked =>
      'Oznámení pro Guessaday jsou vypnutá. Povolte je v nastavení systému, abyste dostávali připomenutí.';

  @override
  String get reminderTitle => 'Který den v týdnu?';

  @override
  String get reveal => 'Odhalit';

  @override
  String get practice => 'Procvičit';
}
