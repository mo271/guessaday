// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Configurações';

  @override
  String get about => 'Sobre';

  @override
  String get startDate => 'Data inicial';

  @override
  String get endDate => 'Data final';

  @override
  String get pickStartDate => 'Escolher data inicial';

  @override
  String get pickEndDate => 'Escolher data final';

  @override
  String get appDescription =>
      'Este app mostra uma data aleatória. Você deve calcular em que dia da semana ela cai e selecionar o dia correto.';

  @override
  String get author => 'Autor';

  @override
  String get howTo =>
      'Se você ainda não sabe calcular o dia da semana, com certeza pode aprender:';

  @override
  String get moreInfo => 'Mais informações';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versão';

  @override
  String get timer => 'Cronômetro';

  @override
  String get enabled => 'Ativado';

  @override
  String get disabled => 'Desativado';

  @override
  String get reappearMsg => 'Toque na data oculta para que ela reapareça!';

  @override
  String after(String duration) {
    return 'Após $duration';
  }

  @override
  String get dateRange => 'Período';

  @override
  String get firstDayInList => 'Primeiro dia da lista';

  @override
  String get localeDefault => 'Automático';

  @override
  String get shortDateDisplay => 'Mostrar a data brevemente';

  @override
  String get hideTheDate => 'Ocultar a data';

  @override
  String get rangeCustom => 'Período personalizado';

  @override
  String get rangeThisMonth => 'Este mês';

  @override
  String get rangeThisYear => 'Este ano';

  @override
  String get rangeNextYear => 'Próximo ano';

  @override
  String get rangeLast100Years => 'Os últimos 100 anos';

  @override
  String get rangeCentury20 => 'O século XX';

  @override
  String get rangeCentury21 => 'O século XXI';

  @override
  String get rangeGregorianToToday => '1582-10-15 – hoje';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Estatísticas';

  @override
  String get rounds => 'Rodadas';

  @override
  String get accuracy => 'Acertos';

  @override
  String get averageTime => 'Tempo médio';

  @override
  String get bestTime => 'Melhor tempo';

  @override
  String get currentStreak => 'Sequência atual';

  @override
  String get bestStreak => 'Melhor sequência';

  @override
  String get allTime => 'Desde o início';

  @override
  String lastNRounds(int n) {
    return 'Últimas $n rodadas';
  }

  @override
  String nRounds(int n) {
    return '$n rodadas';
  }

  @override
  String get allRanges => 'Todos os períodos';

  @override
  String get noRoundsYet =>
      'Nenhuma rodada jogada ainda. As estatísticas aparecem aqui depois da sua primeira resposta.';

  @override
  String get recentWindow => 'Rodadas nas estatísticas recentes';

  @override
  String get resetStatistics => 'Redefinir estatísticas';

  @override
  String get resetStatisticsConfirm =>
      'Excluir todas as rodadas registradas? Isso não pode ser desfeito.';

  @override
  String get delete => 'Excluir';

  @override
  String get cancel => 'Cancelar';

  @override
  String withAverage(int count, String time) {
    return '$count · méd. $time';
  }

  @override
  String get practiceReminders => 'Lembretes de prática';

  @override
  String get practiceRemindersHint =>
      'Datas aleatórias como notificações ao longo do dia';

  @override
  String get remindersPerDay => 'Lembretes por dia';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n vezes por dia',
      two: 'Duas vezes por dia',
      one: 'Uma vez por dia',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Primeiro lembrete';

  @override
  String get latestReminder => 'Último lembrete';

  @override
  String get notificationsBlocked =>
      'As notificações do Guessaday estão desativadas. Permita-as nas configurações do sistema para receber lembretes.';

  @override
  String get reminderTitle => 'Que dia da semana?';

  @override
  String get reveal => 'Revelar';

  @override
  String get practice => 'Praticar';
}
