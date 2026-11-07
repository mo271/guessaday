// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Paramètres';

  @override
  String get about => 'À propos';

  @override
  String get startDate => 'Date de début';

  @override
  String get endDate => 'Date de fin';

  @override
  String get pickStartDate => 'Choisir la date de début';

  @override
  String get pickEndDate => 'Choisir la date de fin';

  @override
  String get appDescription =>
      'Cette application affiche une date aléatoire. À vous de calculer quel jour de la semaine correspond à cette date et de sélectionner la bonne réponse.';

  @override
  String get author => 'Auteur';

  @override
  String get howTo =>
      'Si vous ne savez pas encore calculer le jour de la semaine, vous pouvez tout à fait l\'apprendre :';

  @override
  String get moreInfo => 'Plus d\'informations';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Version';

  @override
  String get timer => 'Chronomètre';

  @override
  String get enabled => 'Activé';

  @override
  String get disabled => 'Désactivé';

  @override
  String get reappearMsg =>
      'Touchez la date masquée pour la faire réapparaître !';

  @override
  String after(String duration) {
    return 'Après $duration';
  }

  @override
  String get dateRange => 'Plage de dates';

  @override
  String get firstDayInList => 'Premier jour de la liste';

  @override
  String get localeDefault => 'Automatique';

  @override
  String get shortDateDisplay => 'Affichage bref de la date';

  @override
  String get hideTheDate => 'Masquer la date';

  @override
  String get rangeCustom => 'Plage personnalisée';

  @override
  String get rangeThisMonth => 'Ce mois-ci';

  @override
  String get rangeThisYear => 'Cette année';

  @override
  String get rangeNextYear => 'L\'année prochaine';

  @override
  String get rangeLast100Years => 'Les 100 dernières années';

  @override
  String get rangeCentury20 => 'Le XXe siècle';

  @override
  String get rangeCentury21 => 'Le XXIe siècle';

  @override
  String get rangeGregorianToToday => '1582-10-15 – aujourd\'hui';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Statistiques';

  @override
  String get rounds => 'Manches';

  @override
  String get accuracy => 'Taux de réussite';

  @override
  String get averageTime => 'Temps moyen';

  @override
  String get bestTime => 'Meilleur temps';

  @override
  String get currentStreak => 'Série en cours';

  @override
  String get bestStreak => 'Meilleure série';

  @override
  String get allTime => 'Depuis le début';

  @override
  String lastNRounds(int n) {
    return '$n dernières manches';
  }

  @override
  String nRounds(int n) {
    return '$n manches';
  }

  @override
  String get allRanges => 'Toutes les plages de dates';

  @override
  String get noRoundsYet =>
      'Aucune manche jouée pour l\'instant. Les statistiques s\'afficheront ici après votre première réponse.';

  @override
  String get recentWindow => 'Manches dans les statistiques récentes';

  @override
  String get resetStatistics => 'Réinitialiser les statistiques';

  @override
  String get resetStatisticsConfirm =>
      'Supprimer toutes les manches enregistrées ? Cette action est irréversible.';

  @override
  String get delete => 'Supprimer';

  @override
  String get cancel => 'Annuler';

  @override
  String withAverage(int count, String time) {
    return '$count · moy. $time';
  }

  @override
  String get practiceReminders => 'Rappels d\'entraînement';

  @override
  String get practiceRemindersHint =>
      'Des dates aléatoires en notification au cours de la journée';

  @override
  String get remindersPerDay => 'Rappels par jour';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n fois par jour',
      two: 'Deux fois par jour',
      one: 'Une fois par jour',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Rappel au plus tôt';

  @override
  String get latestReminder => 'Rappel au plus tard';

  @override
  String get notificationsBlocked =>
      'Les notifications sont désactivées pour Guessaday. Autorisez-les dans les paramètres du système pour recevoir des rappels.';

  @override
  String get reminderTitle => 'Quel jour de la semaine ?';

  @override
  String get reveal => 'Révéler';

  @override
  String get practice => 'S\'entraîner';
}
