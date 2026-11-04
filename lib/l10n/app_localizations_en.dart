// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get startDate => 'Start date';

  @override
  String get endDate => 'End date';

  @override
  String get pickStartDate => 'Pick start date';

  @override
  String get pickEndDate => 'Pick end date';

  @override
  String get appDescription =>
      'This app displays a random date. You are then supposed to calculate what day of the week this day is and select the correct one.';

  @override
  String get author => 'Author';

  @override
  String get howTo =>
      'If you don\'t yet know how to calculate the day of the week, you can certainly learn it:';

  @override
  String get moreInfo => 'More information';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Version';

  @override
  String get timer => 'Timer';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get reappearMsg => 'Tap on hidden date to make it reappear!';

  @override
  String after(String duration) {
    return 'After $duration';
  }

  @override
  String get dateRange => 'Date range';

  @override
  String get firstDayInList => 'First day in list';

  @override
  String get localeDefault => 'Automatic';

  @override
  String get shortDateDisplay => 'Short date display';

  @override
  String get hideTheDate => 'Hide the date';

  @override
  String get rangeCustom => 'Pick your own';

  @override
  String get rangeThisMonth => 'This month';

  @override
  String get rangeThisYear => 'This year';

  @override
  String get rangeNextYear => 'Next year';

  @override
  String get rangeLast100Years => 'The last 100 years';

  @override
  String get rangeCentury20 => 'The 20th century';

  @override
  String get rangeCentury21 => 'The 21st century';

  @override
  String get rangeGregorianToToday => '1582-10-15 – today';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistics';

  @override
  String get rounds => 'Rounds';

  @override
  String get accuracy => 'Accuracy';

  @override
  String get averageTime => 'Average time';

  @override
  String get bestTime => 'Best time';

  @override
  String get currentStreak => 'Current streak';

  @override
  String get bestStreak => 'Best streak';

  @override
  String get allTime => 'All time';

  @override
  String lastNRounds(int n) {
    return 'Last $n rounds';
  }

  @override
  String nRounds(int n) {
    return '$n rounds';
  }

  @override
  String get allRanges => 'All date ranges';

  @override
  String get noRoundsYet =>
      'No rounds played yet. Statistics appear here after your first answer.';

  @override
  String get recentWindow => 'Rounds in recent statistics';

  @override
  String get resetStatistics => 'Reset statistics';

  @override
  String get resetStatisticsConfirm =>
      'Delete all recorded rounds? This cannot be undone.';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }
}
