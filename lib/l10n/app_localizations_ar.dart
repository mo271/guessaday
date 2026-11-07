// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'الإعدادات';

  @override
  String get about => 'حول التطبيق';

  @override
  String get startDate => 'تاريخ البداية';

  @override
  String get endDate => 'تاريخ النهاية';

  @override
  String get pickStartDate => 'اختيار تاريخ البداية';

  @override
  String get pickEndDate => 'اختيار تاريخ النهاية';

  @override
  String get appDescription =>
      'يعرض هذا التطبيق تاريخًا عشوائيًا. عليك بعد ذلك حساب يوم الأسبوع الذي يوافقه هذا التاريخ واختيار اليوم الصحيح.';

  @override
  String get author => 'المطوّر';

  @override
  String get howTo =>
      'إذا كنت لا تعرف بعد كيفية حساب يوم الأسبوع، فيمكنك تعلّم ذلك بسهولة:';

  @override
  String get moreInfo => 'مزيد من المعلومات';

  @override
  String get ok => 'حسنًا';

  @override
  String get version => 'الإصدار';

  @override
  String get timer => 'ساعة الإيقاف';

  @override
  String get enabled => 'مفعّل';

  @override
  String get disabled => 'معطّل';

  @override
  String get reappearMsg => 'انقر على التاريخ المخفي لإظهاره مجددًا!';

  @override
  String after(String duration) {
    return 'بعد $duration';
  }

  @override
  String get dateRange => 'نطاق التواريخ';

  @override
  String get firstDayInList => 'اليوم الأول في القائمة';

  @override
  String get localeDefault => 'تلقائي';

  @override
  String get shortDateDisplay => 'عرض التاريخ لفترة قصيرة';

  @override
  String get hideTheDate => 'إخفاء التاريخ';

  @override
  String get rangeCustom => 'نطاق مخصّص';

  @override
  String get rangeThisMonth => 'هذا الشهر';

  @override
  String get rangeThisYear => 'هذه السنة';

  @override
  String get rangeNextYear => 'السنة القادمة';

  @override
  String get rangeLast100Years => 'آخر 100 سنة';

  @override
  String get rangeCentury20 => 'القرن العشرون';

  @override
  String get rangeCentury21 => 'القرن الحادي والعشرون';

  @override
  String get rangeGregorianToToday => '1582-10-15 – اليوم';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'الإحصاءات';

  @override
  String get rounds => 'الجولات';

  @override
  String get accuracy => 'الدقة';

  @override
  String get averageTime => 'متوسط الوقت';

  @override
  String get bestTime => 'أفضل وقت';

  @override
  String get currentStreak => 'السلسلة الحالية';

  @override
  String get bestStreak => 'أفضل سلسلة';

  @override
  String get allTime => 'كل الأوقات';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'آخر $n جولة',
      many: 'آخر $n جولة',
      few: 'آخر $n جولات',
      two: 'آخر جولتين',
      one: 'آخر جولة',
      zero: 'آخر $n جولة',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n جولة',
      many: '$n جولة',
      few: '$n جولات',
      two: 'جولتان',
      one: 'جولة واحدة',
      zero: '$n جولة',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'كل نطاقات التواريخ';

  @override
  String get noRoundsYet =>
      'لم تُلعب أي جولة بعد. ستظهر الإحصاءات هنا بعد إجابتك الأولى.';

  @override
  String get recentWindow => 'عدد الجولات في الإحصاءات الأخيرة';

  @override
  String get resetStatistics => 'إعادة تعيين الإحصاءات';

  @override
  String get resetStatisticsConfirm =>
      'هل تريد حذف كل الجولات المسجّلة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'إلغاء';

  @override
  String withAverage(int count, String time) {
    return '$count · متوسط $time';
  }

  @override
  String get practiceReminders => 'تذكيرات التمرين';

  @override
  String get practiceRemindersHint =>
      'تواريخ عشوائية على شكل إشعارات خلال اليوم';

  @override
  String get remindersPerDay => 'عدد التذكيرات في اليوم';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n مرة في اليوم',
      many: '$n مرة في اليوم',
      few: '$n مرات في اليوم',
      two: 'مرتان في اليوم',
      one: 'مرة واحدة في اليوم',
      zero: '$n مرات في اليوم',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'أبكر تذكير';

  @override
  String get latestReminder => 'آخر تذكير';

  @override
  String get notificationsBlocked =>
      'الإشعارات متوقفة لتطبيق Guessaday. اسمح بها في إعدادات النظام لتلقّي التذكيرات.';

  @override
  String get reminderTitle => 'أي يوم من الأسبوع؟';

  @override
  String get reveal => 'إظهار';

  @override
  String get practice => 'تمرين';
}
