// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => '設定';

  @override
  String get about => 'このアプリについて';

  @override
  String get startDate => '開始日';

  @override
  String get endDate => '終了日';

  @override
  String get pickStartDate => '開始日を選択';

  @override
  String get pickEndDate => '終了日を選択';

  @override
  String get appDescription =>
      'このアプリはランダムな日付を表示します。その日付が何曜日かを計算して、正しい曜日を選んでください。';

  @override
  String get author => '作者';

  @override
  String get howTo => '曜日の計算方法をまだ知らなくても、きっと身につけられます：';

  @override
  String get moreInfo => '詳細情報';

  @override
  String get ok => 'OK';

  @override
  String get version => 'バージョン';

  @override
  String get timer => 'ストップウォッチ';

  @override
  String get enabled => '有効';

  @override
  String get disabled => '無効';

  @override
  String get reappearMsg => '隠れた日付をタップすると再表示されます';

  @override
  String after(String duration) {
    return '$duration後';
  }

  @override
  String get dateRange => '日付の範囲';

  @override
  String get firstDayInList => 'リストの最初の曜日';

  @override
  String get localeDefault => '自動';

  @override
  String get shortDateDisplay => '日付を短時間だけ表示';

  @override
  String get hideTheDate => '日付を隠す';

  @override
  String get rangeCustom => '自分で選択';

  @override
  String get rangeThisMonth => '今月';

  @override
  String get rangeThisYear => '今年';

  @override
  String get rangeNextYear => '来年';

  @override
  String get rangeLast100Years => '過去100年間';

  @override
  String get rangeCentury20 => '20世紀';

  @override
  String get rangeCentury21 => '21世紀';

  @override
  String get rangeGregorianToToday => '1582-10-15 – 今日';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => '統計';

  @override
  String get rounds => '回数';

  @override
  String get accuracy => '正答率';

  @override
  String get averageTime => '平均時間';

  @override
  String get bestTime => 'ベストタイム';

  @override
  String get currentStreak => '現在の連続正解';

  @override
  String get bestStreak => '最長連続正解';

  @override
  String get allTime => '全期間';

  @override
  String lastNRounds(int n) {
    return '直近$n回';
  }

  @override
  String nRounds(int n) {
    return '$n回';
  }

  @override
  String get allRanges => 'すべての日付範囲';

  @override
  String get noRoundsYet => 'まだ回答がありません。最初に回答すると、ここに統計が表示されます。';

  @override
  String get recentWindow => '直近の統計に含める回数';

  @override
  String get resetStatistics => '統計をリセット';

  @override
  String get resetStatisticsConfirm => '記録されたすべての回答を削除しますか？この操作は元に戻せません。';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String withAverage(int count, String time) {
    return '$count · 平均 $time';
  }

  @override
  String get practiceReminders => '練習リマインダー';

  @override
  String get practiceRemindersHint => '日中にランダムな日付を通知で出題します';

  @override
  String get remindersPerDay => '1日のリマインダー数';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '1日$n回',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'リマインダーの開始時刻';

  @override
  String get latestReminder => 'リマインダーの終了時刻';

  @override
  String get notificationsBlocked =>
      'Guessaday の通知がオフになっています。リマインダーを受け取るには、システム設定で通知を許可してください。';

  @override
  String get reminderTitle => '何曜日？';

  @override
  String get reveal => '答えを見る';

  @override
  String get practice => '練習する';
}
