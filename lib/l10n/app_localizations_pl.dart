// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Ustawienia';

  @override
  String get about => 'Informacje';

  @override
  String get startDate => 'Data początkowa';

  @override
  String get endDate => 'Data końcowa';

  @override
  String get pickStartDate => 'Wybierz datę początkową';

  @override
  String get pickEndDate => 'Wybierz datę końcową';

  @override
  String get appDescription =>
      'Ta aplikacja wyświetla losową datę. Twoim zadaniem jest obliczyć, jaki to dzień tygodnia, i wybrać właściwy.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Jeśli nie wiesz jeszcze, jak obliczyć dzień tygodnia, bez trudu możesz się tego nauczyć:';

  @override
  String get moreInfo => 'Więcej informacji';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Wersja';

  @override
  String get timer => 'Stoper';

  @override
  String get enabled => 'Włączone';

  @override
  String get disabled => 'Wyłączone';

  @override
  String get reappearMsg => 'Dotknij ukrytej daty, aby ją ponownie wyświetlić!';

  @override
  String after(String duration) {
    return 'Po $duration';
  }

  @override
  String get dateRange => 'Zakres dat';

  @override
  String get firstDayInList => 'Pierwszy dzień na liście';

  @override
  String get localeDefault => 'Automatycznie';

  @override
  String get shortDateDisplay => 'Krótkie wyświetlanie daty';

  @override
  String get hideTheDate => 'Ukrywaj datę';

  @override
  String get rangeCustom => 'Własny zakres';

  @override
  String get rangeThisMonth => 'Ten miesiąc';

  @override
  String get rangeThisYear => 'Ten rok';

  @override
  String get rangeNextYear => 'Przyszły rok';

  @override
  String get rangeLast100Years => 'Ostatnie 100 lat';

  @override
  String get rangeCentury20 => 'XX wiek';

  @override
  String get rangeCentury21 => 'XXI wiek';

  @override
  String get rangeGregorianToToday => '1582-10-15 – dziś';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statystyki';

  @override
  String get rounds => 'Rundy';

  @override
  String get accuracy => 'Skuteczność';

  @override
  String get averageTime => 'Średni czas';

  @override
  String get bestTime => 'Najlepszy czas';

  @override
  String get currentStreak => 'Aktualna seria';

  @override
  String get bestStreak => 'Najdłuższa seria';

  @override
  String get allTime => 'Od początku';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ostatnie $n rundy',
      many: 'Ostatnich $n rund',
      few: 'Ostatnie $n rundy',
      one: 'Ostatnia runda',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n rundy',
      many: '$n rund',
      few: '$n rundy',
      one: '$n runda',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Wszystkie zakresy dat';

  @override
  String get noRoundsYet =>
      'Nie rozegrano jeszcze żadnej rundy. Statystyki pojawią się tutaj po pierwszej odpowiedzi.';

  @override
  String get recentWindow => 'Rundy w ostatnich statystykach';

  @override
  String get resetStatistics => 'Zresetuj statystyki';

  @override
  String get resetStatisticsConfirm =>
      'Usunąć wszystkie zapisane rundy? Tej operacji nie można cofnąć.';

  @override
  String get delete => 'Usuń';

  @override
  String get cancel => 'Anuluj';

  @override
  String withAverage(int count, String time) {
    return '$count · śr. $time';
  }

  @override
  String get practiceReminders => 'Przypomnienia o ćwiczeniach';

  @override
  String get practiceRemindersHint =>
      'Losowe daty jako powiadomienia w ciągu dnia';

  @override
  String get remindersPerDay => 'Przypomnienia dziennie';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n razy dziennie',
      many: '$n razy dziennie',
      few: '$n razy dziennie',
      two: 'Dwa razy dziennie',
      one: 'Raz dziennie',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Najwcześniejsze przypomnienie';

  @override
  String get latestReminder => 'Najpóźniejsze przypomnienie';

  @override
  String get notificationsBlocked =>
      'Powiadomienia aplikacji Guessaday są wyłączone. Zezwól na nie w ustawieniach systemu, aby otrzymywać przypomnienia.';

  @override
  String get reminderTitle => 'Jaki to dzień tygodnia?';

  @override
  String get reveal => 'Pokaż';

  @override
  String get practice => 'Ćwicz';
}
