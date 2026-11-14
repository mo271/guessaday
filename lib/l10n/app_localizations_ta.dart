// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get about => 'செயலி பற்றி';

  @override
  String get startDate => 'தொடக்கத் தேதி';

  @override
  String get endDate => 'முடிவுத் தேதி';

  @override
  String get pickStartDate => 'தொடக்கத் தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get pickEndDate => 'முடிவுத் தேதியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get appDescription =>
      'இந்தச் செயலி ஒரு சீரற்ற தேதியைக் காட்டுகிறது. அந்த நாள் வாரத்தின் எந்தக் கிழமை என்பதைக் கணக்கிட்டு, சரியான கிழமையைத் தேர்ந்தெடுக்க வேண்டும்.';

  @override
  String get author => 'உருவாக்கியவர்';

  @override
  String get howTo =>
      'வாரக் கிழமையைக் கணக்கிடும் முறை உங்களுக்கு இன்னும் தெரியவில்லை என்றால், அதை நிச்சயமாகக் கற்றுக்கொள்ளலாம்:';

  @override
  String get moreInfo => 'மேலும் தகவல்';

  @override
  String get ok => 'சரி';

  @override
  String get version => 'பதிப்பு';

  @override
  String get timer => 'ஸ்டாப்வாட்ச்';

  @override
  String get enabled => 'இயக்கத்தில்';

  @override
  String get disabled => 'முடக்கத்தில்';

  @override
  String get reappearMsg => 'மறைந்த தேதியை மீண்டும் காண அதைத் தட்டவும்!';

  @override
  String after(String duration) {
    return '$duration கழித்து';
  }

  @override
  String get dateRange => 'தேதி வரம்பு';

  @override
  String get firstDayInList => 'பட்டியலில் முதல் நாள்';

  @override
  String get localeDefault => 'தானியங்கு';

  @override
  String get shortDateDisplay => 'தேதியைச் சிறிது நேரம் மட்டும் காட்டு';

  @override
  String get hideTheDate => 'தேதியை மறை';

  @override
  String get rangeCustom => 'நீங்களே தேர்ந்தெடுங்கள்';

  @override
  String get rangeThisMonth => 'இந்த மாதம்';

  @override
  String get rangeThisYear => 'இந்த ஆண்டு';

  @override
  String get rangeNextYear => 'அடுத்த ஆண்டு';

  @override
  String get rangeLast100Years => 'கடந்த 100 ஆண்டுகள்';

  @override
  String get rangeCentury20 => '20ஆம் நூற்றாண்டு';

  @override
  String get rangeCentury21 => '21ஆம் நூற்றாண்டு';

  @override
  String get rangeGregorianToToday => '1582-10-15 – இன்று';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'புள்ளிவிவரங்கள்';

  @override
  String get rounds => 'சுற்றுகள்';

  @override
  String get accuracy => 'துல்லியம்';

  @override
  String get averageTime => 'சராசரி நேரம்';

  @override
  String get bestTime => 'சிறந்த நேரம்';

  @override
  String get currentStreak => 'தற்போதைய தொடர்';

  @override
  String get bestStreak => 'சிறந்த தொடர்';

  @override
  String get allTime => 'இதுவரை';

  @override
  String lastNRounds(int n) {
    return 'கடைசி $n சுற்றுகள்';
  }

  @override
  String nRounds(int n) {
    return '$n சுற்றுகள்';
  }

  @override
  String get allRanges => 'எல்லா தேதி வரம்புகளும்';

  @override
  String get noRoundsYet =>
      'இன்னும் எந்தச் சுற்றும் விளையாடப்படவில்லை. உங்கள் முதல் பதிலுக்குப் பிறகு இங்கே புள்ளிவிவரங்கள் தோன்றும்.';

  @override
  String get recentWindow => 'சமீபத்திய புள்ளிவிவரங்களில் உள்ள சுற்றுகள்';

  @override
  String get resetStatistics => 'புள்ளிவிவரங்களை மீட்டமை';

  @override
  String get resetStatisticsConfirm =>
      'பதிவு செய்யப்பட்ட எல்லாச் சுற்றுகளையும் நீக்கவா? இதைச் செயல்தவிர்க்க முடியாது.';

  @override
  String get delete => 'நீக்கு';

  @override
  String get cancel => 'ரத்துசெய்';

  @override
  String withAverage(int count, String time) {
    return '$count · சராசரி $time';
  }

  @override
  String get practiceReminders => 'பயிற்சி நினைவூட்டல்கள்';

  @override
  String get practiceRemindersHint => 'பகலில் அறிவிப்புகளாகச் சீரற்ற தேதிகள்';

  @override
  String get remindersPerDay => 'ஒரு நாளுக்கான நினைவூட்டல்கள்';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'நாளுக்கு $n முறை',
      one: 'நாளுக்கு ஒரு முறை',
      two: 'நாளுக்கு இரு முறை',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'முதல் நினைவூட்டல்';

  @override
  String get latestReminder => 'கடைசி நினைவூட்டல்';

  @override
  String get notificationsBlocked =>
      'Guessaday-க்கான அறிவிப்புகள் முடக்கப்பட்டுள்ளன. நினைவூட்டல்களைப் பெற, சிஸ்டம் அமைப்புகளில் அவற்றை அனுமதிக்கவும்.';

  @override
  String get reminderTitle => 'எந்தக் கிழமை?';

  @override
  String get reveal => 'பதிலைக் காட்டு';

  @override
  String get practice => 'பயிற்சி செய்';
}
