// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Mga setting';

  @override
  String get about => 'Tungkol';

  @override
  String get startDate => 'Petsa ng simula';

  @override
  String get endDate => 'Petsa ng katapusan';

  @override
  String get pickStartDate => 'Pumili ng petsa ng simula';

  @override
  String get pickEndDate => 'Pumili ng petsa ng katapusan';

  @override
  String get appDescription =>
      'Nagpapakita ang app na ito ng random na petsa. Kailangan mong kuwentahin kung anong araw ng linggo ito at piliin ang tamang sagot.';

  @override
  String get author => 'May-akda';

  @override
  String get howTo =>
      'Kung hindi mo pa alam kung paano kuwentahin ang araw ng linggo, tiyak na matututuhan mo ito:';

  @override
  String get moreInfo => 'Higit pang impormasyon';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Bersyon';

  @override
  String get timer => 'Stopwatch';

  @override
  String get enabled => 'Naka-on';

  @override
  String get disabled => 'Naka-off';

  @override
  String get reappearMsg => 'I-tap ang nakatagong petsa para muling ipakita!';

  @override
  String after(String duration) {
    return 'Pagkalipas ng $duration';
  }

  @override
  String get dateRange => 'Saklaw ng petsa';

  @override
  String get firstDayInList => 'Unang araw sa listahan';

  @override
  String get localeDefault => 'Awtomatiko';

  @override
  String get shortDateDisplay => 'Saglit lang ipakita ang petsa';

  @override
  String get hideTheDate => 'Itago ang petsa';

  @override
  String get rangeCustom => 'Pumili ng sarili mo';

  @override
  String get rangeThisMonth => 'Ngayong buwan';

  @override
  String get rangeThisYear => 'Ngayong taon';

  @override
  String get rangeNextYear => 'Susunod na taon';

  @override
  String get rangeLast100Years => 'Nakaraang 100 taon';

  @override
  String get rangeCentury20 => 'Ika-20 siglo';

  @override
  String get rangeCentury21 => 'Ika-21 siglo';

  @override
  String get rangeGregorianToToday => '1582-10-15 – ngayon';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Istatistika';

  @override
  String get rounds => 'Mga round';

  @override
  String get accuracy => 'Katumpakan';

  @override
  String get averageTime => 'Average na oras';

  @override
  String get bestTime => 'Pinakamabilis na oras';

  @override
  String get currentStreak => 'Kasalukuyang streak';

  @override
  String get bestStreak => 'Pinakamahabang streak';

  @override
  String get allTime => 'Lahat ng panahon';

  @override
  String lastNRounds(int n) {
    return 'Huling $n round';
  }

  @override
  String nRounds(int n) {
    return '$n round';
  }

  @override
  String get allRanges => 'Lahat ng saklaw ng petsa';

  @override
  String get noRoundsYet =>
      'Wala pang nalalarong round. Lalabas dito ang istatistika pagkatapos ng iyong unang sagot.';

  @override
  String get recentWindow => 'Mga round sa kamakailang istatistika';

  @override
  String get resetStatistics => 'I-reset ang istatistika';

  @override
  String get resetStatisticsConfirm =>
      'Burahin ang lahat ng naitalang round? Hindi na ito maibabalik.';

  @override
  String get delete => 'Burahin';

  @override
  String get cancel => 'Kanselahin';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }

  @override
  String get practiceReminders => 'Mga paalala sa pagsasanay';

  @override
  String get practiceRemindersHint =>
      'Mga random na petsa bilang notification sa buong araw';

  @override
  String get remindersPerDay => 'Mga paalala bawat araw';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n beses bawat araw',
      one: 'Isang beses bawat araw',
      two: 'Dalawang beses bawat araw',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Pinakamaagang paalala';

  @override
  String get latestReminder => 'Pinakahuling paalala';

  @override
  String get notificationsBlocked =>
      'Naka-off ang mga notification para sa Guessaday. Payagan ang mga ito sa mga setting ng system para makatanggap ng mga paalala.';

  @override
  String get reminderTitle => 'Anong araw ng linggo?';

  @override
  String get reveal => 'Ipakita';

  @override
  String get practice => 'Magsanay';
}
