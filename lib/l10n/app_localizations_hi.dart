// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'सेटिंग';

  @override
  String get about => 'ऐप के बारे में';

  @override
  String get startDate => 'शुरुआती तारीख';

  @override
  String get endDate => 'आखिरी तारीख';

  @override
  String get pickStartDate => 'शुरुआती तारीख चुनें';

  @override
  String get pickEndDate => 'आखिरी तारीख चुनें';

  @override
  String get appDescription =>
      'यह ऐप एक रैंडम तारीख दिखाता है। आपको हिसाब लगाना है कि उस दिन हफ़्ते का कौन-सा दिन (वार) है और सही दिन चुनना है।';

  @override
  String get author => 'डेवलपर';

  @override
  String get howTo =>
      'अगर आपको अभी तक हफ़्ते का दिन निकालना नहीं आता, तो आप इसे ज़रूर सीख सकते हैं:';

  @override
  String get moreInfo => 'ज़्यादा जानकारी';

  @override
  String get ok => 'ठीक है';

  @override
  String get version => 'वर्शन';

  @override
  String get timer => 'स्टॉपवॉच';

  @override
  String get enabled => 'चालू';

  @override
  String get disabled => 'बंद';

  @override
  String get reappearMsg =>
      'छिपी हुई तारीख को फिर से देखने के लिए उस पर टैप करें!';

  @override
  String after(String duration) {
    return '$duration के बाद';
  }

  @override
  String get dateRange => 'तारीख की सीमा';

  @override
  String get firstDayInList => 'सूची का पहला दिन';

  @override
  String get localeDefault => 'अपने-आप';

  @override
  String get shortDateDisplay => 'तारीख थोड़ी देर के लिए दिखाएं';

  @override
  String get hideTheDate => 'तारीख छिपाएं';

  @override
  String get rangeCustom => 'खुद चुनें';

  @override
  String get rangeThisMonth => 'यह महीना';

  @override
  String get rangeThisYear => 'यह साल';

  @override
  String get rangeNextYear => 'अगला साल';

  @override
  String get rangeLast100Years => 'पिछले 100 साल';

  @override
  String get rangeCentury20 => '20वीं सदी';

  @override
  String get rangeCentury21 => '21वीं सदी';

  @override
  String get rangeGregorianToToday => '1582-10-15 – आज';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'आंकड़े';

  @override
  String get rounds => 'राउंड';

  @override
  String get accuracy => 'सटीकता';

  @override
  String get averageTime => 'औसत समय';

  @override
  String get bestTime => 'सबसे अच्छा समय';

  @override
  String get currentStreak => 'मौजूदा स्ट्रीक';

  @override
  String get bestStreak => 'सबसे लंबी स्ट्रीक';

  @override
  String get allTime => 'अब तक';

  @override
  String lastNRounds(int n) {
    return 'पिछले $n राउंड';
  }

  @override
  String nRounds(int n) {
    return '$n राउंड';
  }

  @override
  String get allRanges => 'तारीख की सभी सीमाएं';

  @override
  String get noRoundsYet =>
      'अभी तक कोई राउंड नहीं खेला गया। आपके पहले जवाब के बाद यहां आंकड़े दिखेंगे।';

  @override
  String get recentWindow => 'हाल के आंकड़ों में राउंड';

  @override
  String get resetStatistics => 'आंकड़े रीसेट करें';

  @override
  String get resetStatisticsConfirm =>
      'रिकॉर्ड किए गए सभी राउंड मिटाएं? इसे पहले जैसा नहीं किया जा सकता।';

  @override
  String get delete => 'मिटाएं';

  @override
  String get cancel => 'रद्द करें';

  @override
  String withAverage(int count, String time) {
    return '$count · औसत $time';
  }

  @override
  String get practiceReminders => 'अभ्यास के रिमाइंडर';

  @override
  String get practiceRemindersHint =>
      'दिन के दौरान सूचनाओं के रूप में रैंडम तारीखें';

  @override
  String get remindersPerDay => 'हर दिन रिमाइंडर';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'दिन में $n बार',
      two: 'दिन में दो बार',
      one: 'दिन में एक बार',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'सबसे पहला रिमाइंडर';

  @override
  String get latestReminder => 'सबसे आखिरी रिमाइंडर';

  @override
  String get notificationsBlocked =>
      'Guessaday के लिए सूचनाएं बंद हैं। रिमाइंडर पाने के लिए सिस्टम सेटिंग में उन्हें चालू करें।';

  @override
  String get reminderTitle => 'हफ़्ते का कौन-सा दिन?';

  @override
  String get reveal => 'जवाब देखें';

  @override
  String get practice => 'अभ्यास करें';
}
