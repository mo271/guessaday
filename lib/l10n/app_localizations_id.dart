// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Setelan';

  @override
  String get about => 'Tentang';

  @override
  String get startDate => 'Tanggal mulai';

  @override
  String get endDate => 'Tanggal akhir';

  @override
  String get pickStartDate => 'Pilih tanggal mulai';

  @override
  String get pickEndDate => 'Pilih tanggal akhir';

  @override
  String get appDescription =>
      'Aplikasi ini menampilkan tanggal acak. Anda kemudian diminta menghitung tanggal tersebut jatuh pada hari apa dan memilih hari yang benar.';

  @override
  String get author => 'Pembuat';

  @override
  String get howTo =>
      'Jika Anda belum tahu cara menghitung hari dalam seminggu, Anda pasti bisa mempelajarinya:';

  @override
  String get moreInfo => 'Informasi selengkapnya';

  @override
  String get ok => 'Oke';

  @override
  String get version => 'Versi';

  @override
  String get timer => 'Stopwatch';

  @override
  String get enabled => 'Aktif';

  @override
  String get disabled => 'Nonaktif';

  @override
  String get reappearMsg =>
      'Ketuk tanggal yang tersembunyi untuk menampilkannya lagi!';

  @override
  String after(String duration) {
    return 'Setelah $duration';
  }

  @override
  String get dateRange => 'Rentang tanggal';

  @override
  String get firstDayInList => 'Hari pertama dalam daftar';

  @override
  String get localeDefault => 'Otomatis';

  @override
  String get shortDateDisplay => 'Tampilkan tanggal sebentar saja';

  @override
  String get hideTheDate => 'Sembunyikan tanggal';

  @override
  String get rangeCustom => 'Pilih sendiri';

  @override
  String get rangeThisMonth => 'Bulan ini';

  @override
  String get rangeThisYear => 'Tahun ini';

  @override
  String get rangeNextYear => 'Tahun depan';

  @override
  String get rangeLast100Years => '100 tahun terakhir';

  @override
  String get rangeCentury20 => 'Abad ke-20';

  @override
  String get rangeCentury21 => 'Abad ke-21';

  @override
  String get rangeGregorianToToday => '1582-10-15 – hari ini';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistik';

  @override
  String get rounds => 'Ronde';

  @override
  String get accuracy => 'Akurasi';

  @override
  String get averageTime => 'Waktu rata-rata';

  @override
  String get bestTime => 'Waktu terbaik';

  @override
  String get currentStreak => 'Rentetan saat ini';

  @override
  String get bestStreak => 'Rentetan terbaik';

  @override
  String get allTime => 'Sepanjang waktu';

  @override
  String lastNRounds(int n) {
    return '$n ronde terakhir';
  }

  @override
  String nRounds(int n) {
    return '$n ronde';
  }

  @override
  String get allRanges => 'Semua rentang tanggal';

  @override
  String get noRoundsYet =>
      'Belum ada ronde yang dimainkan. Statistik akan muncul di sini setelah jawaban pertama Anda.';

  @override
  String get recentWindow => 'Jumlah ronde dalam statistik terbaru';

  @override
  String get resetStatistics => 'Reset statistik';

  @override
  String get resetStatisticsConfirm =>
      'Hapus semua ronde yang tercatat? Tindakan ini tidak dapat diurungkan.';

  @override
  String get delete => 'Hapus';

  @override
  String get cancel => 'Batal';

  @override
  String withAverage(int count, String time) {
    return '$count · rata-rata $time';
  }

  @override
  String get practiceReminders => 'Pengingat latihan';

  @override
  String get practiceRemindersHint =>
      'Tanggal acak sebagai notifikasi sepanjang hari';

  @override
  String get remindersPerDay => 'Pengingat per hari';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kali sehari',
      two: 'Dua kali sehari',
      one: 'Sekali sehari',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Pengingat paling awal';

  @override
  String get latestReminder => 'Pengingat paling akhir';

  @override
  String get notificationsBlocked =>
      'Notifikasi untuk Guessaday dinonaktifkan. Izinkan notifikasi di setelan sistem untuk menerima pengingat.';

  @override
  String get reminderTitle => 'Hari apa?';

  @override
  String get reveal => 'Tampilkan';

  @override
  String get practice => 'Latihan';
}
