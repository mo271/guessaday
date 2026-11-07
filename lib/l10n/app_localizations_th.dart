// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get startDate => 'วันที่เริ่มต้น';

  @override
  String get endDate => 'วันที่สิ้นสุด';

  @override
  String get pickStartDate => 'เลือกวันที่เริ่มต้น';

  @override
  String get pickEndDate => 'เลือกวันที่สิ้นสุด';

  @override
  String get appDescription =>
      'แอปนี้จะแสดงวันที่แบบสุ่ม จากนั้นคุณต้องคำนวณว่าวันนั้นตรงกับวันอะไรในสัปดาห์ แล้วเลือกคำตอบที่ถูกต้อง';

  @override
  String get author => 'ผู้พัฒนา';

  @override
  String get howTo =>
      'หากคุณยังไม่รู้วิธีคำนวณวันในสัปดาห์ คุณสามารถเรียนรู้ได้อย่างแน่นอน:';

  @override
  String get moreInfo => 'ข้อมูลเพิ่มเติม';

  @override
  String get ok => 'ตกลง';

  @override
  String get version => 'เวอร์ชัน';

  @override
  String get timer => 'นาฬิกาจับเวลา';

  @override
  String get enabled => 'เปิด';

  @override
  String get disabled => 'ปิด';

  @override
  String get reappearMsg => 'แตะวันที่ที่ซ่อนอยู่เพื่อแสดงอีกครั้ง!';

  @override
  String after(String duration) {
    return 'หลังจาก $duration';
  }

  @override
  String get dateRange => 'ช่วงวันที่';

  @override
  String get firstDayInList => 'วันแรกในรายการ';

  @override
  String get localeDefault => 'อัตโนมัติ';

  @override
  String get shortDateDisplay => 'แสดงวันที่เพียงชั่วครู่';

  @override
  String get hideTheDate => 'ซ่อนวันที่';

  @override
  String get rangeCustom => 'กำหนดเอง';

  @override
  String get rangeThisMonth => 'เดือนนี้';

  @override
  String get rangeThisYear => 'ปีนี้';

  @override
  String get rangeNextYear => 'ปีหน้า';

  @override
  String get rangeLast100Years => '100 ปีที่ผ่านมา';

  @override
  String get rangeCentury20 => 'ศตวรรษที่ 20';

  @override
  String get rangeCentury21 => 'ศตวรรษที่ 21';

  @override
  String get rangeGregorianToToday => '1582-10-15 – วันนี้';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'สถิติ';

  @override
  String get rounds => 'รอบ';

  @override
  String get accuracy => 'ความแม่นยำ';

  @override
  String get averageTime => 'เวลาเฉลี่ย';

  @override
  String get bestTime => 'เวลาที่ดีที่สุด';

  @override
  String get currentStreak => 'สตรีคปัจจุบัน';

  @override
  String get bestStreak => 'สตรีคสูงสุด';

  @override
  String get allTime => 'ตลอดกาล';

  @override
  String lastNRounds(int n) {
    return '$n รอบล่าสุด';
  }

  @override
  String nRounds(int n) {
    return '$n รอบ';
  }

  @override
  String get allRanges => 'ทุกช่วงวันที่';

  @override
  String get noRoundsYet =>
      'ยังไม่ได้เล่นรอบใดเลย สถิติจะแสดงที่นี่หลังจากคำตอบแรกของคุณ';

  @override
  String get recentWindow => 'จำนวนรอบในสถิติล่าสุด';

  @override
  String get resetStatistics => 'รีเซ็ตสถิติ';

  @override
  String get resetStatisticsConfirm =>
      'ลบรอบที่บันทึกไว้ทั้งหมดหรือไม่ การดำเนินการนี้ไม่สามารถย้อนกลับได้';

  @override
  String get delete => 'ลบ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String withAverage(int count, String time) {
    return '$count · เฉลี่ย $time';
  }

  @override
  String get practiceReminders => 'การเตือนฝึกฝน';

  @override
  String get practiceRemindersHint => 'สุ่มวันที่ส่งเป็นการแจ้งเตือนระหว่างวัน';

  @override
  String get remindersPerDay => 'จำนวนการเตือนต่อวัน';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'วันละ $n ครั้ง',
      two: 'วันละสองครั้ง',
      one: 'วันละครั้ง',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'เวลาเตือนเร็วสุด';

  @override
  String get latestReminder => 'เวลาเตือนช้าสุด';

  @override
  String get notificationsBlocked =>
      'การแจ้งเตือนของ Guessaday ถูกปิดอยู่ โปรดอนุญาตในการตั้งค่าระบบเพื่อรับการเตือนฝึกฝน';

  @override
  String get reminderTitle => 'วันอะไรในสัปดาห์?';

  @override
  String get reveal => 'เฉลย';

  @override
  String get practice => 'ฝึกฝน';
}
