// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Ajustes';

  @override
  String get about => 'Acerca de';

  @override
  String get startDate => 'Fecha de inicio';

  @override
  String get endDate => 'Fecha de fin';

  @override
  String get pickStartDate => 'Elegir fecha de inicio';

  @override
  String get pickEndDate => 'Elegir fecha de fin';

  @override
  String get appDescription =>
      'Esta aplicación muestra una fecha aleatoria. Tienes que calcular qué día de la semana es y seleccionar el correcto.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Si todavía no sabes calcular el día de la semana, puedes aprenderlo sin problema:';

  @override
  String get moreInfo => 'Más información';

  @override
  String get ok => 'Aceptar';

  @override
  String get version => 'Versión';

  @override
  String get timer => 'Cronómetro';

  @override
  String get enabled => 'Activado';

  @override
  String get disabled => 'Desactivado';

  @override
  String get reappearMsg => '¡Toca la fecha oculta para que vuelva a aparecer!';

  @override
  String after(String duration) {
    return 'Después de $duration';
  }

  @override
  String get dateRange => 'Intervalo de fechas';

  @override
  String get firstDayInList => 'Primer día de la lista';

  @override
  String get localeDefault => 'Automático';

  @override
  String get shortDateDisplay => 'Mostrar la fecha brevemente';

  @override
  String get hideTheDate => 'Ocultar la fecha';

  @override
  String get rangeCustom => 'Intervalo personalizado';

  @override
  String get rangeThisMonth => 'Este mes';

  @override
  String get rangeThisYear => 'Este año';

  @override
  String get rangeNextYear => 'El año que viene';

  @override
  String get rangeLast100Years => 'Los últimos 100 años';

  @override
  String get rangeCentury20 => 'El siglo XX';

  @override
  String get rangeCentury21 => 'El siglo XXI';

  @override
  String get rangeGregorianToToday => '1582-10-15 – hoy';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get rounds => 'Rondas';

  @override
  String get accuracy => 'Aciertos';

  @override
  String get averageTime => 'Tiempo medio';

  @override
  String get bestTime => 'Mejor tiempo';

  @override
  String get currentStreak => 'Racha actual';

  @override
  String get bestStreak => 'Mejor racha';

  @override
  String get allTime => 'Desde el principio';

  @override
  String lastNRounds(int n) {
    return 'Últimas $n rondas';
  }

  @override
  String nRounds(int n) {
    return '$n rondas';
  }

  @override
  String get allRanges => 'Todos los intervalos de fechas';

  @override
  String get noRoundsYet =>
      'Todavía no has jugado ninguna ronda. Las estadísticas aparecerán aquí tras tu primera respuesta.';

  @override
  String get recentWindow => 'Rondas en las estadísticas recientes';

  @override
  String get resetStatistics => 'Restablecer estadísticas';

  @override
  String get resetStatisticsConfirm =>
      '¿Eliminar todas las rondas registradas? Esta acción no se puede deshacer.';

  @override
  String get delete => 'Eliminar';

  @override
  String get cancel => 'Cancelar';

  @override
  String withAverage(int count, String time) {
    return '$count · media $time';
  }

  @override
  String get practiceReminders => 'Recordatorios de práctica';

  @override
  String get practiceRemindersHint =>
      'Fechas aleatorias como notificaciones a lo largo del día';

  @override
  String get remindersPerDay => 'Recordatorios al día';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n veces al día',
      two: 'Dos veces al día',
      one: 'Una vez al día',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Primer recordatorio';

  @override
  String get latestReminder => 'Último recordatorio';

  @override
  String get notificationsBlocked =>
      'Las notificaciones de Guessaday están desactivadas. Permítelas en los ajustes del sistema para recibir recordatorios.';

  @override
  String get reminderTitle => '¿Qué día de la semana?';

  @override
  String get reveal => 'Revelar';

  @override
  String get practice => 'Practicar';
}
