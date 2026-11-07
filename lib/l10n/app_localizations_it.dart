// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Impostazioni';

  @override
  String get about => 'Informazioni';

  @override
  String get startDate => 'Data di inizio';

  @override
  String get endDate => 'Data di fine';

  @override
  String get pickStartDate => 'Scegli la data di inizio';

  @override
  String get pickEndDate => 'Scegli la data di fine';

  @override
  String get appDescription =>
      'Questa app mostra una data casuale. Devi calcolare che giorno della settimana è e selezionare quello giusto.';

  @override
  String get author => 'Autore';

  @override
  String get howTo =>
      'Se non sai ancora calcolare il giorno della settimana, puoi senz\'altro impararlo:';

  @override
  String get moreInfo => 'Maggiori informazioni';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versione';

  @override
  String get timer => 'Cronometro';

  @override
  String get enabled => 'Attivato';

  @override
  String get disabled => 'Disattivato';

  @override
  String get reappearMsg => 'Tocca la data nascosta per farla riapparire!';

  @override
  String after(String duration) {
    return 'Dopo $duration';
  }

  @override
  String get dateRange => 'Intervallo di date';

  @override
  String get firstDayInList => 'Primo giorno dell\'elenco';

  @override
  String get localeDefault => 'Automatico';

  @override
  String get shortDateDisplay => 'Mostra la data brevemente';

  @override
  String get hideTheDate => 'Nascondi la data';

  @override
  String get rangeCustom => 'Intervallo personalizzato';

  @override
  String get rangeThisMonth => 'Questo mese';

  @override
  String get rangeThisYear => 'Quest\'anno';

  @override
  String get rangeNextYear => 'L\'anno prossimo';

  @override
  String get rangeLast100Years => 'Gli ultimi 100 anni';

  @override
  String get rangeCentury20 => 'Il XX secolo';

  @override
  String get rangeCentury21 => 'Il XXI secolo';

  @override
  String get rangeGregorianToToday => '1582-10-15 – oggi';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistiche';

  @override
  String get rounds => 'Turni';

  @override
  String get accuracy => 'Precisione';

  @override
  String get averageTime => 'Tempo medio';

  @override
  String get bestTime => 'Miglior tempo';

  @override
  String get currentStreak => 'Serie attuale';

  @override
  String get bestStreak => 'Serie migliore';

  @override
  String get allTime => 'Dall\'inizio';

  @override
  String lastNRounds(int n) {
    return 'Ultimi $n turni';
  }

  @override
  String nRounds(int n) {
    return '$n turni';
  }

  @override
  String get allRanges => 'Tutti gli intervalli di date';

  @override
  String get noRoundsYet =>
      'Nessun turno giocato finora. Le statistiche appariranno qui dopo la tua prima risposta.';

  @override
  String get recentWindow => 'Turni nelle statistiche recenti';

  @override
  String get resetStatistics => 'Azzera statistiche';

  @override
  String get resetStatisticsConfirm =>
      'Eliminare tutti i turni registrati? L\'operazione non può essere annullata.';

  @override
  String get delete => 'Elimina';

  @override
  String get cancel => 'Annulla';

  @override
  String withAverage(int count, String time) {
    return '$count · media $time';
  }

  @override
  String get practiceReminders => 'Promemoria di allenamento';

  @override
  String get practiceRemindersHint =>
      'Date casuali come notifiche durante la giornata';

  @override
  String get remindersPerDay => 'Promemoria al giorno';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n volte al giorno',
      two: 'Due volte al giorno',
      one: 'Una volta al giorno',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Primo promemoria';

  @override
  String get latestReminder => 'Ultimo promemoria';

  @override
  String get notificationsBlocked =>
      'Le notifiche di Guessaday sono disattivate. Consentile nelle impostazioni di sistema per ricevere i promemoria.';

  @override
  String get reminderTitle => 'Che giorno della settimana?';

  @override
  String get reveal => 'Rivela';

  @override
  String get practice => 'Esercitati';
}
