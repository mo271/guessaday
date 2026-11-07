// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'הגדרות';

  @override
  String get about => 'אודות';

  @override
  String get startDate => 'תאריך התחלה';

  @override
  String get endDate => 'תאריך סיום';

  @override
  String get pickStartDate => 'בחירת תאריך התחלה';

  @override
  String get pickEndDate => 'בחירת תאריך סיום';

  @override
  String get appDescription =>
      'האפליקציה מציגה תאריך אקראי. עליך לחשב באיזה יום בשבוע חל התאריך הזה ולבחור את היום הנכון.';

  @override
  String get author => 'מפתח';

  @override
  String get howTo =>
      'עדיין לא יודעים איך לחשב את היום בשבוע? בהחלט אפשר ללמוד:';

  @override
  String get moreInfo => 'מידע נוסף';

  @override
  String get ok => 'אישור';

  @override
  String get version => 'גרסה';

  @override
  String get timer => 'שעון עצר';

  @override
  String get enabled => 'מופעל';

  @override
  String get disabled => 'מושבת';

  @override
  String get reappearMsg => 'יש להקיש על התאריך המוסתר כדי להציג אותו שוב!';

  @override
  String after(String duration) {
    return 'אחרי $duration';
  }

  @override
  String get dateRange => 'טווח תאריכים';

  @override
  String get firstDayInList => 'היום הראשון ברשימה';

  @override
  String get localeDefault => 'אוטומטי';

  @override
  String get shortDateDisplay => 'הצגה קצרה של התאריך';

  @override
  String get hideTheDate => 'הסתרת התאריך';

  @override
  String get rangeCustom => 'טווח מותאם אישית';

  @override
  String get rangeThisMonth => 'החודש';

  @override
  String get rangeThisYear => 'השנה';

  @override
  String get rangeNextYear => 'השנה הבאה';

  @override
  String get rangeLast100Years => '100 השנים האחרונות';

  @override
  String get rangeCentury20 => 'המאה ה־20';

  @override
  String get rangeCentury21 => 'המאה ה־21';

  @override
  String get rangeGregorianToToday => '1582-10-15 – היום';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'סטטיסטיקה';

  @override
  String get rounds => 'סיבובים';

  @override
  String get accuracy => 'דיוק';

  @override
  String get averageTime => 'זמן ממוצע';

  @override
  String get bestTime => 'הזמן הטוב ביותר';

  @override
  String get currentStreak => 'רצף נוכחי';

  @override
  String get bestStreak => 'הרצף הטוב ביותר';

  @override
  String get allTime => 'כל הזמנים';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n הסיבובים האחרונים',
      many: '$n הסיבובים האחרונים',
      two: 'שני הסיבובים האחרונים',
      one: 'הסיבוב האחרון',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n סיבובים',
      many: '$n סיבובים',
      two: 'שני סיבובים',
      one: 'סיבוב אחד',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'כל טווחי התאריכים';

  @override
  String get noRoundsYet =>
      'עדיין לא שוחקו סיבובים. הסטטיסטיקה תופיע כאן אחרי התשובה הראשונה.';

  @override
  String get recentWindow => 'מספר הסיבובים בסטטיסטיקה האחרונה';

  @override
  String get resetStatistics => 'איפוס הסטטיסטיקה';

  @override
  String get resetStatisticsConfirm =>
      'למחוק את כל הסיבובים שנשמרו? לא ניתן לבטל פעולה זו.';

  @override
  String get delete => 'מחיקה';

  @override
  String get cancel => 'ביטול';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }

  @override
  String get practiceReminders => 'תזכורות תרגול';

  @override
  String get practiceRemindersHint => 'תאריכים אקראיים כהתראות במהלך היום';

  @override
  String get remindersPerDay => 'תזכורות ביום';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n פעמים ביום',
      many: '$n פעמים ביום',
      two: 'פעמיים ביום',
      one: 'פעם ביום',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'התזכורת המוקדמת ביותר';

  @override
  String get latestReminder => 'התזכורת המאוחרת ביותר';

  @override
  String get notificationsBlocked =>
      'ההתראות של Guessaday כבויות. יש לאפשר אותן בהגדרות המערכת כדי לקבל תזכורות.';

  @override
  String get reminderTitle => 'איזה יום בשבוע?';

  @override
  String get reveal => 'חשיפה';

  @override
  String get practice => 'תרגול';
}
