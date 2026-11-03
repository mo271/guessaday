import 'package:intl/intl.dart';

/// The locale's first day of the week, 1 = Monday ... 7 = Sunday.
int localeFirstWeekday(String locale) =>
    DateFormat.EEEE(locale).dateSymbols.FIRSTDAYOFWEEK + 1;

/// Full weekday name in [locale]; [weekday] is 1 = Monday ... 7 = Sunday.
String weekdayName(String locale, int weekday) =>
    // 2024-01-01 was a Monday, so day-of-month equals the weekday number.
    DateFormat.EEEE(locale).format(DateTime.utc(2024, 1, weekday));
