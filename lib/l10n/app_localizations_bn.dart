// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'সেটিংস';

  @override
  String get about => 'অ্যাপ সম্পর্কে';

  @override
  String get startDate => 'শুরুর তারিখ';

  @override
  String get endDate => 'শেষ তারিখ';

  @override
  String get pickStartDate => 'শুরুর তারিখ বেছে নিন';

  @override
  String get pickEndDate => 'শেষ তারিখ বেছে নিন';

  @override
  String get appDescription =>
      'এই অ্যাপটি একটি এলোমেলো তারিখ দেখায়। আপনাকে হিসাব করে বের করতে হবে সেই দিনটি সপ্তাহের কোন বার, এবং সঠিক বারটি বেছে নিতে হবে।';

  @override
  String get author => 'ডেভেলপার';

  @override
  String get howTo =>
      'আপনি যদি এখনও সপ্তাহের বার হিসাব করতে না জানেন, তবে নিশ্চয়ই তা শিখে নিতে পারেন:';

  @override
  String get moreInfo => 'আরও তথ্য';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get version => 'সংস্করণ';

  @override
  String get timer => 'স্টপওয়াচ';

  @override
  String get enabled => 'চালু';

  @override
  String get disabled => 'বন্ধ';

  @override
  String get reappearMsg => 'লুকানো তারিখটি আবার দেখতে তাতে ট্যাপ করুন!';

  @override
  String after(String duration) {
    return '$duration পরে';
  }

  @override
  String get dateRange => 'তারিখের পরিসর';

  @override
  String get firstDayInList => 'তালিকার প্রথম দিন';

  @override
  String get localeDefault => 'স্বয়ংক্রিয়';

  @override
  String get shortDateDisplay => 'তারিখ অল্প সময়ের জন্য দেখান';

  @override
  String get hideTheDate => 'তারিখ লুকান';

  @override
  String get rangeCustom => 'নিজে বেছে নিন';

  @override
  String get rangeThisMonth => 'এই মাস';

  @override
  String get rangeThisYear => 'এই বছর';

  @override
  String get rangeNextYear => 'আগামী বছর';

  @override
  String get rangeLast100Years => 'গত 100 বছর';

  @override
  String get rangeCentury20 => 'বিংশ শতাব্দী';

  @override
  String get rangeCentury21 => 'একবিংশ শতাব্দী';

  @override
  String get rangeGregorianToToday => '1582-10-15 – আজ';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'পরিসংখ্যান';

  @override
  String get rounds => 'রাউন্ড';

  @override
  String get accuracy => 'নির্ভুলতা';

  @override
  String get averageTime => 'গড় সময়';

  @override
  String get bestTime => 'সেরা সময়';

  @override
  String get currentStreak => 'বর্তমান স্ট্রিক';

  @override
  String get bestStreak => 'সেরা স্ট্রিক';

  @override
  String get allTime => 'সর্বকাল';

  @override
  String lastNRounds(int n) {
    return 'শেষ $n রাউন্ড';
  }

  @override
  String nRounds(int n) {
    return '$n রাউন্ড';
  }

  @override
  String get allRanges => 'সব তারিখের পরিসর';

  @override
  String get noRoundsYet =>
      'এখনও কোনো রাউন্ড খেলা হয়নি। আপনার প্রথম উত্তরের পর এখানে পরিসংখ্যান দেখা যাবে।';

  @override
  String get recentWindow => 'সাম্প্রতিক পরিসংখ্যানে রাউন্ডের সংখ্যা';

  @override
  String get resetStatistics => 'পরিসংখ্যান রিসেট করুন';

  @override
  String get resetStatisticsConfirm =>
      'রেকর্ড করা সব রাউন্ড মুছে ফেলবেন? এটি আর ফিরিয়ে আনা যাবে না।';

  @override
  String get delete => 'মুছুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String withAverage(int count, String time) {
    return '$count · গড় $time';
  }

  @override
  String get practiceReminders => 'অনুশীলনের রিমাইন্ডার';

  @override
  String get practiceRemindersHint =>
      'দিনের বেলায় নোটিফিকেশন হিসেবে এলোমেলো তারিখ';

  @override
  String get remindersPerDay => 'প্রতিদিন রিমাইন্ডার';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'দিনে $n বার',
      one: 'দিনে একবার',
      two: 'দিনে দুবার',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'প্রথম রিমাইন্ডার';

  @override
  String get latestReminder => 'শেষ রিমাইন্ডার';

  @override
  String get notificationsBlocked =>
      'Guessaday-এর জন্য নোটিফিকেশন বন্ধ আছে। রিমাইন্ডার পেতে সিস্টেম সেটিংসে তা চালু করুন।';

  @override
  String get reminderTitle => 'সপ্তাহের কোন বার?';

  @override
  String get reveal => 'উত্তর দেখুন';

  @override
  String get practice => 'অনুশীলন করুন';
}
