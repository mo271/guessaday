// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Налаштування';

  @override
  String get about => 'Про додаток';

  @override
  String get startDate => 'Початкова дата';

  @override
  String get endDate => 'Кінцева дата';

  @override
  String get pickStartDate => 'Вибрати початкову дату';

  @override
  String get pickEndDate => 'Вибрати кінцеву дату';

  @override
  String get appDescription =>
      'Додаток показує випадкову дату. Вам потрібно обчислити, на який день тижня вона припадає, і вибрати правильний.';

  @override
  String get author => 'Автор';

  @override
  String get howTo =>
      'Якщо ви ще не вмієте обчислювати день тижня, цього цілком можна навчитися:';

  @override
  String get moreInfo => 'Докладніше';

  @override
  String get ok => 'ОК';

  @override
  String get version => 'Версія';

  @override
  String get timer => 'Секундомір';

  @override
  String get enabled => 'Увімкнено';

  @override
  String get disabled => 'Вимкнено';

  @override
  String get reappearMsg =>
      'Торкніться прихованої дати, щоб показати її знову!';

  @override
  String after(String duration) {
    return 'Через $duration';
  }

  @override
  String get dateRange => 'Діапазон дат';

  @override
  String get firstDayInList => 'Перший день у списку';

  @override
  String get localeDefault => 'Автоматично';

  @override
  String get shortDateDisplay => 'Показувати дату ненадовго';

  @override
  String get hideTheDate => 'Приховувати дату';

  @override
  String get rangeCustom => 'Власний діапазон';

  @override
  String get rangeThisMonth => 'Цей місяць';

  @override
  String get rangeThisYear => 'Цей рік';

  @override
  String get rangeNextYear => 'Наступний рік';

  @override
  String get rangeLast100Years => 'Останні 100 років';

  @override
  String get rangeCentury20 => 'XX століття';

  @override
  String get rangeCentury21 => 'XXI століття';

  @override
  String get rangeGregorianToToday => '1582-10-15 – сьогодні';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Статистика';

  @override
  String get rounds => 'Раунди';

  @override
  String get accuracy => 'Точність';

  @override
  String get averageTime => 'Середній час';

  @override
  String get bestTime => 'Найкращий час';

  @override
  String get currentStreak => 'Поточна серія';

  @override
  String get bestStreak => 'Найкраща серія';

  @override
  String get allTime => 'За весь час';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Останні $n раунду',
      many: 'Останні $n раундів',
      few: 'Останні $n раунди',
      one: 'Останній $n раунд',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n раунду',
      many: '$n раундів',
      few: '$n раунди',
      one: '$n раунд',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Усі діапазони дат';

  @override
  String get noRoundsYet =>
      'Раундів поки немає. Статистика з’явиться тут після першої відповіді.';

  @override
  String get recentWindow => 'Раундів у недавній статистиці';

  @override
  String get resetStatistics => 'Скинути статистику';

  @override
  String get resetStatisticsConfirm =>
      'Видалити всі записані раунди? Цю дію не можна скасувати.';

  @override
  String get delete => 'Видалити';

  @override
  String get cancel => 'Скасувати';

  @override
  String withAverage(int count, String time) {
    return '$count · сер. $time';
  }

  @override
  String get practiceReminders => 'Нагадування про тренування';

  @override
  String get practiceRemindersHint =>
      'Випадкові дати у сповіщеннях протягом дня';

  @override
  String get remindersPerDay => 'Нагадувань на день';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n разу на день',
      many: '$n разів на день',
      few: '$n рази на день',
      one: '$n раз на день',
      two: 'Двічі на день',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Найраніше нагадування';

  @override
  String get latestReminder => 'Найпізніше нагадування';

  @override
  String get notificationsBlocked =>
      'Сповіщення для Guessaday вимкнено. Дозвольте їх у налаштуваннях системи, щоб отримувати нагадування.';

  @override
  String get reminderTitle => 'Який день тижня?';

  @override
  String get reveal => 'Показати';

  @override
  String get practice => 'Тренування';
}
