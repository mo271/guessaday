// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Ayarlar';

  @override
  String get about => 'Hakkında';

  @override
  String get startDate => 'Başlangıç tarihi';

  @override
  String get endDate => 'Bitiş tarihi';

  @override
  String get pickStartDate => 'Başlangıç tarihini seçin';

  @override
  String get pickEndDate => 'Bitiş tarihini seçin';

  @override
  String get appDescription =>
      'Bu uygulama rastgele bir tarih gösterir. Sizden bu tarihin haftanın hangi gününe denk geldiğini hesaplamanız ve doğru günü seçmeniz beklenir.';

  @override
  String get author => 'Geliştirici';

  @override
  String get howTo =>
      'Haftanın gününü nasıl hesaplayacağınızı henüz bilmiyorsanız, bunu kolayca öğrenebilirsiniz:';

  @override
  String get moreInfo => 'Daha fazla bilgi';

  @override
  String get ok => 'Tamam';

  @override
  String get version => 'Sürüm';

  @override
  String get timer => 'Kronometre';

  @override
  String get enabled => 'Açık';

  @override
  String get disabled => 'Kapalı';

  @override
  String get reappearMsg =>
      'Gizlenen tarihi yeniden görmek için üzerine dokunun!';

  @override
  String after(String duration) {
    return '$duration sonra';
  }

  @override
  String get dateRange => 'Tarih aralığı';

  @override
  String get firstDayInList => 'Listedeki ilk gün';

  @override
  String get localeDefault => 'Otomatik';

  @override
  String get shortDateDisplay => 'Tarihi kısa süre göster';

  @override
  String get hideTheDate => 'Tarihi gizle';

  @override
  String get rangeCustom => 'Kendiniz seçin';

  @override
  String get rangeThisMonth => 'Bu ay';

  @override
  String get rangeThisYear => 'Bu yıl';

  @override
  String get rangeNextYear => 'Gelecek yıl';

  @override
  String get rangeLast100Years => 'Son 100 yıl';

  @override
  String get rangeCentury20 => '20. yüzyıl';

  @override
  String get rangeCentury21 => '21. yüzyıl';

  @override
  String get rangeGregorianToToday => '1582-10-15 – bugün';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'İstatistikler';

  @override
  String get rounds => 'Tur';

  @override
  String get accuracy => 'Doğruluk';

  @override
  String get averageTime => 'Ortalama süre';

  @override
  String get bestTime => 'En iyi süre';

  @override
  String get currentStreak => 'Mevcut seri';

  @override
  String get bestStreak => 'En iyi seri';

  @override
  String get allTime => 'Tüm zamanlar';

  @override
  String lastNRounds(int n) {
    return 'Son $n tur';
  }

  @override
  String nRounds(int n) {
    return '$n tur';
  }

  @override
  String get allRanges => 'Tüm tarih aralıkları';

  @override
  String get noRoundsYet =>
      'Henüz tur oynanmadı. İlk yanıtınızdan sonra istatistikler burada görünür.';

  @override
  String get recentWindow => 'Son istatistiklerdeki tur sayısı';

  @override
  String get resetStatistics => 'İstatistikleri sıfırla';

  @override
  String get resetStatisticsConfirm =>
      'Kaydedilen tüm turlar silinsin mi? Bu işlem geri alınamaz.';

  @override
  String get delete => 'Sil';

  @override
  String get cancel => 'İptal';

  @override
  String withAverage(int count, String time) {
    return '$count · ort. $time';
  }

  @override
  String get practiceReminders => 'Alıştırma hatırlatıcıları';

  @override
  String get practiceRemindersHint =>
      'Gün içinde bildirim olarak rastgele tarihler';

  @override
  String get remindersPerDay => 'Günlük hatırlatıcı sayısı';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Günde $n kez',
      two: 'Günde iki kez',
      one: 'Günde bir kez',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'En erken hatırlatıcı';

  @override
  String get latestReminder => 'En geç hatırlatıcı';

  @override
  String get notificationsBlocked =>
      'Guessaday için bildirimler kapalı. Hatırlatıcı almak için sistem ayarlarından bildirimlere izin verin.';

  @override
  String get reminderTitle => 'Haftanın hangi günü?';

  @override
  String get reveal => 'Göster';

  @override
  String get practice => 'Alıştırma';
}
