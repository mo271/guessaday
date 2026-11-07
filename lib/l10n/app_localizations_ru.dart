// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Настройки';

  @override
  String get about => 'О приложении';

  @override
  String get startDate => 'Начальная дата';

  @override
  String get endDate => 'Конечная дата';

  @override
  String get pickStartDate => 'Выбрать начальную дату';

  @override
  String get pickEndDate => 'Выбрать конечную дату';

  @override
  String get appDescription =>
      'Приложение показывает случайную дату. Вам нужно вычислить, на какой день недели она приходится, и выбрать правильный.';

  @override
  String get author => 'Автор';

  @override
  String get howTo =>
      'Если вы ещё не умеете вычислять день недели, этому вполне можно научиться:';

  @override
  String get moreInfo => 'Подробнее';

  @override
  String get ok => 'ОК';

  @override
  String get version => 'Версия';

  @override
  String get timer => 'Секундомер';

  @override
  String get enabled => 'Включено';

  @override
  String get disabled => 'Выключено';

  @override
  String get reappearMsg => 'Нажмите на скрытую дату, чтобы показать её снова!';

  @override
  String after(String duration) {
    return 'Через $duration';
  }

  @override
  String get dateRange => 'Диапазон дат';

  @override
  String get firstDayInList => 'Первый день в списке';

  @override
  String get localeDefault => 'Автоматически';

  @override
  String get shortDateDisplay => 'Показывать дату ненадолго';

  @override
  String get hideTheDate => 'Скрывать дату';

  @override
  String get rangeCustom => 'Свой диапазон';

  @override
  String get rangeThisMonth => 'Этот месяц';

  @override
  String get rangeThisYear => 'Этот год';

  @override
  String get rangeNextYear => 'Следующий год';

  @override
  String get rangeLast100Years => 'Последние 100 лет';

  @override
  String get rangeCentury20 => 'XX век';

  @override
  String get rangeCentury21 => 'XXI век';

  @override
  String get rangeGregorianToToday => '1582-10-15 – сегодня';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Статистика';

  @override
  String get rounds => 'Раунды';

  @override
  String get accuracy => 'Точность';

  @override
  String get averageTime => 'Среднее время';

  @override
  String get bestTime => 'Лучшее время';

  @override
  String get currentStreak => 'Текущая серия';

  @override
  String get bestStreak => 'Лучшая серия';

  @override
  String get allTime => 'За всё время';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Последние $n раунда',
      many: 'Последние $n раундов',
      few: 'Последние $n раунда',
      one: 'Последний $n раунд',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n раунда',
      many: '$n раундов',
      few: '$n раунда',
      one: '$n раунд',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Все диапазоны дат';

  @override
  String get noRoundsYet =>
      'Раундов пока нет. Статистика появится здесь после первого ответа.';

  @override
  String get recentWindow => 'Раундов в недавней статистике';

  @override
  String get resetStatistics => 'Сбросить статистику';

  @override
  String get resetStatisticsConfirm =>
      'Удалить все записанные раунды? Это действие нельзя отменить.';

  @override
  String get delete => 'Удалить';

  @override
  String get cancel => 'Отмена';

  @override
  String withAverage(int count, String time) {
    return '$count · ср. $time';
  }

  @override
  String get practiceReminders => 'Напоминания о тренировках';

  @override
  String get practiceRemindersHint =>
      'Случайные даты в уведомлениях в течение дня';

  @override
  String get remindersPerDay => 'Напоминаний в день';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n раза в день',
      many: '$n раз в день',
      few: '$n раза в день',
      one: '$n раз в день',
      two: 'Дважды в день',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Самое раннее напоминание';

  @override
  String get latestReminder => 'Самое позднее напоминание';

  @override
  String get notificationsBlocked =>
      'Уведомления для Guessaday отключены. Разрешите их в настройках системы, чтобы получать напоминания.';

  @override
  String get reminderTitle => 'Какой день недели?';

  @override
  String get reveal => 'Показать';

  @override
  String get practice => 'Тренировка';
}
