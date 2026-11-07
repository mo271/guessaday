// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Cài đặt';

  @override
  String get about => 'Giới thiệu';

  @override
  String get startDate => 'Ngày bắt đầu';

  @override
  String get endDate => 'Ngày kết thúc';

  @override
  String get pickStartDate => 'Chọn ngày bắt đầu';

  @override
  String get pickEndDate => 'Chọn ngày kết thúc';

  @override
  String get appDescription =>
      'Ứng dụng này hiển thị một ngày ngẫu nhiên. Bạn cần tính xem ngày đó là thứ mấy trong tuần rồi chọn đáp án đúng.';

  @override
  String get author => 'Tác giả';

  @override
  String get howTo =>
      'Nếu bạn chưa biết cách tính thứ trong tuần, bạn hoàn toàn có thể học được:';

  @override
  String get moreInfo => 'Thông tin thêm';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Phiên bản';

  @override
  String get timer => 'Bấm giờ';

  @override
  String get enabled => 'Đã bật';

  @override
  String get disabled => 'Đã tắt';

  @override
  String get reappearMsg => 'Nhấn vào ngày đã ẩn để hiện lại!';

  @override
  String after(String duration) {
    return 'Sau $duration';
  }

  @override
  String get dateRange => 'Khoảng ngày';

  @override
  String get firstDayInList => 'Ngày đầu tiên trong danh sách';

  @override
  String get localeDefault => 'Tự động';

  @override
  String get shortDateDisplay => 'Chỉ hiển thị ngày trong chốc lát';

  @override
  String get hideTheDate => 'Ẩn ngày';

  @override
  String get rangeCustom => 'Tự chọn';

  @override
  String get rangeThisMonth => 'Tháng này';

  @override
  String get rangeThisYear => 'Năm nay';

  @override
  String get rangeNextYear => 'Năm sau';

  @override
  String get rangeLast100Years => '100 năm gần đây';

  @override
  String get rangeCentury20 => 'Thế kỷ 20';

  @override
  String get rangeCentury21 => 'Thế kỷ 21';

  @override
  String get rangeGregorianToToday => '1582-10-15 – hôm nay';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Thống kê';

  @override
  String get rounds => 'Số lượt';

  @override
  String get accuracy => 'Độ chính xác';

  @override
  String get averageTime => 'Thời gian trung bình';

  @override
  String get bestTime => 'Thời gian tốt nhất';

  @override
  String get currentStreak => 'Chuỗi hiện tại';

  @override
  String get bestStreak => 'Chuỗi dài nhất';

  @override
  String get allTime => 'Từ trước đến nay';

  @override
  String lastNRounds(int n) {
    return '$n lượt gần nhất';
  }

  @override
  String nRounds(int n) {
    return '$n lượt';
  }

  @override
  String get allRanges => 'Tất cả khoảng ngày';

  @override
  String get noRoundsYet =>
      'Bạn chưa chơi lượt nào. Thống kê sẽ hiển thị ở đây sau câu trả lời đầu tiên của bạn.';

  @override
  String get recentWindow => 'Số lượt trong thống kê gần đây';

  @override
  String get resetStatistics => 'Đặt lại thống kê';

  @override
  String get resetStatisticsConfirm =>
      'Xóa tất cả lượt đã ghi lại? Bạn không thể hoàn tác thao tác này.';

  @override
  String get delete => 'Xóa';

  @override
  String get cancel => 'Hủy';

  @override
  String withAverage(int count, String time) {
    return '$count · TB $time';
  }

  @override
  String get practiceReminders => 'Nhắc luyện tập';

  @override
  String get practiceRemindersHint =>
      'Nhận ngày ngẫu nhiên dưới dạng thông báo trong ngày';

  @override
  String get remindersPerDay => 'Số lần nhắc mỗi ngày';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Mỗi ngày $n lần',
      two: 'Mỗi ngày hai lần',
      one: 'Mỗi ngày một lần',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Nhắc sớm nhất';

  @override
  String get latestReminder => 'Nhắc muộn nhất';

  @override
  String get notificationsBlocked =>
      'Thông báo của Guessaday đang bị tắt. Hãy cho phép thông báo trong cài đặt hệ thống để nhận lời nhắc.';

  @override
  String get reminderTitle => 'Thứ mấy?';

  @override
  String get reveal => 'Xem đáp án';

  @override
  String get practice => 'Luyện tập';
}
