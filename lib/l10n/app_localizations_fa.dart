// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'تنظیمات';

  @override
  String get about => 'درباره';

  @override
  String get startDate => 'تاریخ شروع';

  @override
  String get endDate => 'تاریخ پایان';

  @override
  String get pickStartDate => 'انتخاب تاریخ شروع';

  @override
  String get pickEndDate => 'انتخاب تاریخ پایان';

  @override
  String get appDescription =>
      'این برنامه یک تاریخ تصادفی نمایش می‌دهد. شما باید حساب کنید که این روز چه روزی از هفته است و گزینهٔ درست را انتخاب کنید.';

  @override
  String get author => 'توسعه‌دهنده';

  @override
  String get howTo =>
      'اگر هنوز نمی‌دانید چگونه روز هفته را حساب کنید، حتماً می‌توانید آن را یاد بگیرید:';

  @override
  String get moreInfo => 'اطلاعات بیشتر';

  @override
  String get ok => 'تأیید';

  @override
  String get version => 'نسخه';

  @override
  String get timer => 'زمان‌سنج';

  @override
  String get enabled => 'فعال';

  @override
  String get disabled => 'غیرفعال';

  @override
  String get reappearMsg =>
      'برای نمایش دوبارهٔ تاریخ پنهان، روی آن ضربه بزنید!';

  @override
  String after(String duration) {
    return 'پس از $duration';
  }

  @override
  String get dateRange => 'بازهٔ تاریخ';

  @override
  String get firstDayInList => 'اولین روز در فهرست';

  @override
  String get localeDefault => 'خودکار';

  @override
  String get shortDateDisplay => 'نمایش کوتاه تاریخ';

  @override
  String get hideTheDate => 'پنهان کردن تاریخ';

  @override
  String get rangeCustom => 'بازهٔ دلخواه';

  @override
  String get rangeThisMonth => 'این ماه';

  @override
  String get rangeThisYear => 'امسال';

  @override
  String get rangeNextYear => 'سال آینده';

  @override
  String get rangeLast100Years => '100 سال گذشته';

  @override
  String get rangeCentury20 => 'قرن بیستم';

  @override
  String get rangeCentury21 => 'قرن بیست‌ویکم';

  @override
  String get rangeGregorianToToday => '1582-10-15 – امروز';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'آمار';

  @override
  String get rounds => 'دورها';

  @override
  String get accuracy => 'دقت';

  @override
  String get averageTime => 'میانگین زمان';

  @override
  String get bestTime => 'بهترین زمان';

  @override
  String get currentStreak => 'زنجیرهٔ فعلی';

  @override
  String get bestStreak => 'بهترین زنجیره';

  @override
  String get allTime => 'همهٔ زمان‌ها';

  @override
  String lastNRounds(int n) {
    return '$n دور آخر';
  }

  @override
  String nRounds(int n) {
    return '$n دور';
  }

  @override
  String get allRanges => 'همهٔ بازه‌های تاریخ';

  @override
  String get noRoundsYet =>
      'هنوز هیچ دوری بازی نشده است. آمار پس از اولین پاسخ شما اینجا نمایش داده می‌شود.';

  @override
  String get recentWindow => 'تعداد دورها در آمار اخیر';

  @override
  String get resetStatistics => 'بازنشانی آمار';

  @override
  String get resetStatisticsConfirm =>
      'همهٔ دورهای ثبت‌شده حذف شوند؟ این کار قابل بازگشت نیست.';

  @override
  String get delete => 'حذف';

  @override
  String get cancel => 'لغو';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }

  @override
  String get practiceReminders => 'یادآورهای تمرین';

  @override
  String get practiceRemindersHint =>
      'تاریخ‌های تصادفی به‌صورت اعلان در طول روز';

  @override
  String get remindersPerDay => 'تعداد یادآور در روز';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n بار در روز',
      one: 'یک بار در روز',
      two: 'دو بار در روز',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'زودترین یادآور';

  @override
  String get latestReminder => 'دیرترین یادآور';

  @override
  String get notificationsBlocked =>
      'اعلان‌ها برای Guessaday خاموش هستند. برای دریافت یادآورها، آن‌ها را در تنظیمات سیستم مجاز کنید.';

  @override
  String get reminderTitle => 'کدام روز هفته؟';

  @override
  String get reveal => 'نمایش پاسخ';

  @override
  String get practice => 'تمرین';
}
