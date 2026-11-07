// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Beállítások';

  @override
  String get about => 'Névjegy';

  @override
  String get startDate => 'Kezdő dátum';

  @override
  String get endDate => 'Záró dátum';

  @override
  String get pickStartDate => 'Kezdő dátum kiválasztása';

  @override
  String get pickEndDate => 'Záró dátum kiválasztása';

  @override
  String get appDescription =>
      'Az alkalmazás egy véletlenszerű dátumot jelenít meg. A feladat kiszámolni, hogy ez a nap a hét melyik napjára esik, és kiválasztani a helyeset.';

  @override
  String get author => 'Szerző';

  @override
  String get howTo =>
      'Ha még nem tudja, hogyan kell kiszámolni a hét napját, könnyen megtanulhatja:';

  @override
  String get moreInfo => 'További információ';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Verzió';

  @override
  String get timer => 'Stopper';

  @override
  String get enabled => 'Bekapcsolva';

  @override
  String get disabled => 'Kikapcsolva';

  @override
  String get reappearMsg =>
      'Koppintson az elrejtett dátumra, hogy újra megjelenjen!';

  @override
  String after(String duration) {
    return '$duration után';
  }

  @override
  String get dateRange => 'Dátumtartomány';

  @override
  String get firstDayInList => 'Első nap a listában';

  @override
  String get localeDefault => 'Automatikus';

  @override
  String get shortDateDisplay => 'Dátum rövid megjelenítése';

  @override
  String get hideTheDate => 'Dátum elrejtése';

  @override
  String get rangeCustom => 'Egyéni tartomány';

  @override
  String get rangeThisMonth => 'Ez a hónap';

  @override
  String get rangeThisYear => 'Ez az év';

  @override
  String get rangeNextYear => 'Jövő év';

  @override
  String get rangeLast100Years => 'Az elmúlt 100 év';

  @override
  String get rangeCentury20 => 'A 20. század';

  @override
  String get rangeCentury21 => 'A 21. század';

  @override
  String get rangeGregorianToToday => '1582-10-15 – ma';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statisztika';

  @override
  String get rounds => 'Körök';

  @override
  String get accuracy => 'Pontosság';

  @override
  String get averageTime => 'Átlagos idő';

  @override
  String get bestTime => 'Legjobb idő';

  @override
  String get currentStreak => 'Jelenlegi sorozat';

  @override
  String get bestStreak => 'Leghosszabb sorozat';

  @override
  String get allTime => 'Összesen';

  @override
  String lastNRounds(int n) {
    return 'Az utolsó $n kör';
  }

  @override
  String nRounds(int n) {
    return '$n kör';
  }

  @override
  String get allRanges => 'Minden dátumtartomány';

  @override
  String get noRoundsYet =>
      'Még nincs lejátszott kör. A statisztika az első válasz után jelenik meg itt.';

  @override
  String get recentWindow => 'Körök a legutóbbi statisztikában';

  @override
  String get resetStatistics => 'Statisztika visszaállítása';

  @override
  String get resetStatisticsConfirm =>
      'Törli az összes rögzített kört? Ez nem vonható vissza.';

  @override
  String get delete => 'Törlés';

  @override
  String get cancel => 'Mégse';

  @override
  String withAverage(int count, String time) {
    return '$count · átl. $time';
  }

  @override
  String get practiceReminders => 'Gyakorlási emlékeztetők';

  @override
  String get practiceRemindersHint =>
      'Véletlenszerű dátumok értesítésként a nap folyamán';

  @override
  String get remindersPerDay => 'Emlékeztetők naponta';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Naponta $n alkalommal',
      two: 'Naponta kétszer',
      one: 'Naponta egyszer',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Legkorábbi emlékeztető';

  @override
  String get latestReminder => 'Legkésőbbi emlékeztető';

  @override
  String get notificationsBlocked =>
      'A Guessaday értesítései ki vannak kapcsolva. Az emlékeztetők fogadásához engedélyezze őket a rendszerbeállításokban.';

  @override
  String get reminderTitle => 'A hét melyik napja?';

  @override
  String get reveal => 'Megoldás';

  @override
  String get practice => 'Gyakorlás';
}
