// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => '设置';

  @override
  String get about => '关于';

  @override
  String get startDate => '开始日期';

  @override
  String get endDate => '结束日期';

  @override
  String get pickStartDate => '选择开始日期';

  @override
  String get pickEndDate => '选择结束日期';

  @override
  String get appDescription => '本应用会显示一个随机日期。请计算这一天是星期几，然后选出正确的答案。';

  @override
  String get author => '作者';

  @override
  String get howTo => '如果你还不会计算星期几，完全可以学会：';

  @override
  String get moreInfo => '更多信息';

  @override
  String get ok => '确定';

  @override
  String get version => '版本';

  @override
  String get timer => '秒表';

  @override
  String get enabled => '已启用';

  @override
  String get disabled => '已停用';

  @override
  String get reappearMsg => '点按隐藏的日期即可重新显示';

  @override
  String after(String duration) {
    return '$duration后';
  }

  @override
  String get dateRange => '日期范围';

  @override
  String get firstDayInList => '列表中的第一天';

  @override
  String get localeDefault => '自动';

  @override
  String get shortDateDisplay => '短暂显示日期';

  @override
  String get hideTheDate => '隐藏日期';

  @override
  String get rangeCustom => '自定义';

  @override
  String get rangeThisMonth => '本月';

  @override
  String get rangeThisYear => '今年';

  @override
  String get rangeNextYear => '明年';

  @override
  String get rangeLast100Years => '最近 100 年';

  @override
  String get rangeCentury20 => '20 世纪';

  @override
  String get rangeCentury21 => '21 世纪';

  @override
  String get rangeGregorianToToday => '1582-10-15 – 今天';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => '统计';

  @override
  String get rounds => '轮数';

  @override
  String get accuracy => '正确率';

  @override
  String get averageTime => '平均用时';

  @override
  String get bestTime => '最佳用时';

  @override
  String get currentStreak => '当前连续答对';

  @override
  String get bestStreak => '最长连续答对';

  @override
  String get allTime => '全部时间';

  @override
  String lastNRounds(int n) {
    return '最近 $n 轮';
  }

  @override
  String nRounds(int n) {
    return '$n 轮';
  }

  @override
  String get allRanges => '所有日期范围';

  @override
  String get noRoundsYet => '尚未进行任何练习。首次作答后，统计数据会显示在这里。';

  @override
  String get recentWindow => '近期统计包含的轮数';

  @override
  String get resetStatistics => '重置统计';

  @override
  String get resetStatisticsConfirm => '要删除所有已记录的轮次吗？此操作无法撤消。';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String withAverage(int count, String time) {
    return '$count · 平均 $time';
  }

  @override
  String get practiceReminders => '练习提醒';

  @override
  String get practiceRemindersHint => '白天以通知形式推送随机日期';

  @override
  String get remindersPerDay => '每天提醒次数';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '每天 $n 次',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => '最早提醒时间';

  @override
  String get latestReminder => '最晚提醒时间';

  @override
  String get notificationsBlocked => 'Guessaday 的通知已关闭。请在系统设置中允许通知，以接收提醒。';

  @override
  String get reminderTitle => '星期几？';

  @override
  String get reveal => '查看答案';

  @override
  String get practice => '练习';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => '設定';

  @override
  String get about => '關於';

  @override
  String get startDate => '開始日期';

  @override
  String get endDate => '結束日期';

  @override
  String get pickStartDate => '選擇開始日期';

  @override
  String get pickEndDate => '選擇結束日期';

  @override
  String get appDescription => '本應用程式會顯示一個隨機日期。請計算這一天是星期幾，然後選出正確的答案。';

  @override
  String get author => '作者';

  @override
  String get howTo => '如果你還不會計算星期幾，一定可以學會：';

  @override
  String get moreInfo => '更多資訊';

  @override
  String get ok => '確定';

  @override
  String get version => '版本';

  @override
  String get timer => '碼錶';

  @override
  String get enabled => '已啟用';

  @override
  String get disabled => '已停用';

  @override
  String get reappearMsg => '輕觸隱藏的日期即可重新顯示';

  @override
  String after(String duration) {
    return '$duration後';
  }

  @override
  String get dateRange => '日期範圍';

  @override
  String get firstDayInList => '清單中的第一天';

  @override
  String get localeDefault => '自動';

  @override
  String get shortDateDisplay => '短暫顯示日期';

  @override
  String get hideTheDate => '隱藏日期';

  @override
  String get rangeCustom => '自訂';

  @override
  String get rangeThisMonth => '本月';

  @override
  String get rangeThisYear => '今年';

  @override
  String get rangeNextYear => '明年';

  @override
  String get rangeLast100Years => '最近 100 年';

  @override
  String get rangeCentury20 => '20 世紀';

  @override
  String get rangeCentury21 => '21 世紀';

  @override
  String get rangeGregorianToToday => '1582-10-15 – 今天';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => '統計';

  @override
  String get rounds => '回合數';

  @override
  String get accuracy => '正確率';

  @override
  String get averageTime => '平均時間';

  @override
  String get bestTime => '最佳時間';

  @override
  String get currentStreak => '目前連續答對';

  @override
  String get bestStreak => '最長連續答對';

  @override
  String get allTime => '所有時間';

  @override
  String lastNRounds(int n) {
    return '最近 $n 回合';
  }

  @override
  String nRounds(int n) {
    return '$n 回合';
  }

  @override
  String get allRanges => '所有日期範圍';

  @override
  String get noRoundsYet => '尚未進行任何回合。首次作答後，統計資料會顯示在這裡。';

  @override
  String get recentWindow => '近期統計包含的回合數';

  @override
  String get resetStatistics => '重設統計';

  @override
  String get resetStatisticsConfirm => '要刪除所有已記錄的回合嗎？此操作無法復原。';

  @override
  String get delete => '刪除';

  @override
  String get cancel => '取消';

  @override
  String withAverage(int count, String time) {
    return '$count · 平均 $time';
  }

  @override
  String get practiceReminders => '練習提醒';

  @override
  String get practiceRemindersHint => '白天以通知方式推送隨機日期';

  @override
  String get remindersPerDay => '每天提醒次數';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '每天 $n 次',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => '最早提醒時間';

  @override
  String get latestReminder => '最晚提醒時間';

  @override
  String get notificationsBlocked => 'Guessaday 的通知已關閉。請在系統設定中允許通知，以接收提醒。';

  @override
  String get reminderTitle => '星期幾？';

  @override
  String get reveal => '查看答案';

  @override
  String get practice => '練習';
}
