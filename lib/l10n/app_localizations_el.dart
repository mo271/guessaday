// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get about => 'Πληροφορίες';

  @override
  String get startDate => 'Ημερομηνία έναρξης';

  @override
  String get endDate => 'Ημερομηνία λήξης';

  @override
  String get pickStartDate => 'Επιλογή ημερομηνίας έναρξης';

  @override
  String get pickEndDate => 'Επιλογή ημερομηνίας λήξης';

  @override
  String get appDescription =>
      'Η εφαρμογή εμφανίζει μια τυχαία ημερομηνία. Εσείς πρέπει να υπολογίσετε ποια ημέρα της εβδομάδας είναι και να επιλέξετε τη σωστή.';

  @override
  String get author => 'Δημιουργός';

  @override
  String get howTo =>
      'Αν δεν ξέρετε ακόμη πώς να υπολογίζετε την ημέρα της εβδομάδας, σίγουρα μπορείτε να το μάθετε:';

  @override
  String get moreInfo => 'Περισσότερες πληροφορίες';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Έκδοση';

  @override
  String get timer => 'Χρονόμετρο';

  @override
  String get enabled => 'Ενεργό';

  @override
  String get disabled => 'Ανενεργό';

  @override
  String get reappearMsg =>
      'Πατήστε την κρυμμένη ημερομηνία για να εμφανιστεί ξανά!';

  @override
  String after(String duration) {
    return 'Μετά από $duration';
  }

  @override
  String get dateRange => 'Εύρος ημερομηνιών';

  @override
  String get firstDayInList => 'Πρώτη ημέρα στη λίστα';

  @override
  String get localeDefault => 'Αυτόματα';

  @override
  String get shortDateDisplay => 'Σύντομη εμφάνιση ημερομηνίας';

  @override
  String get hideTheDate => 'Απόκρυψη ημερομηνίας';

  @override
  String get rangeCustom => 'Προσαρμοσμένο εύρος';

  @override
  String get rangeThisMonth => 'Αυτός ο μήνας';

  @override
  String get rangeThisYear => 'Φέτος';

  @override
  String get rangeNextYear => 'Του χρόνου';

  @override
  String get rangeLast100Years => 'Τα τελευταία 100 χρόνια';

  @override
  String get rangeCentury20 => 'Ο 20ός αιώνας';

  @override
  String get rangeCentury21 => 'Ο 21ος αιώνας';

  @override
  String get rangeGregorianToToday => '1582-10-15 – σήμερα';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Στατιστικά';

  @override
  String get rounds => 'Γύροι';

  @override
  String get accuracy => 'Ακρίβεια';

  @override
  String get averageTime => 'Μέσος χρόνος';

  @override
  String get bestTime => 'Καλύτερος χρόνος';

  @override
  String get currentStreak => 'Τρέχον σερί';

  @override
  String get bestStreak => 'Καλύτερο σερί';

  @override
  String get allTime => 'Συνολικά';

  @override
  String lastNRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Τελευταίοι $n γύροι',
      one: 'Τελευταίος γύρος',
    );
    return '$_temp0';
  }

  @override
  String nRounds(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n γύροι',
      one: '$n γύρος',
    );
    return '$_temp0';
  }

  @override
  String get allRanges => 'Όλα τα εύρη ημερομηνιών';

  @override
  String get noRoundsYet =>
      'Δεν έχετε παίξει ακόμη κανέναν γύρο. Τα στατιστικά εμφανίζονται εδώ μετά την πρώτη σας απάντηση.';

  @override
  String get recentWindow => 'Γύροι στα πρόσφατα στατιστικά';

  @override
  String get resetStatistics => 'Επαναφορά στατιστικών';

  @override
  String get resetStatisticsConfirm =>
      'Να διαγραφούν όλοι οι καταγεγραμμένοι γύροι; Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String withAverage(int count, String time) {
    return '$count · ⌀ $time';
  }

  @override
  String get practiceReminders => 'Υπενθυμίσεις εξάσκησης';

  @override
  String get practiceRemindersHint =>
      'Τυχαίες ημερομηνίες ως ειδοποιήσεις κατά τη διάρκεια της ημέρας';

  @override
  String get remindersPerDay => 'Υπενθυμίσεις ανά ημέρα';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n φορές την ημέρα',
      one: 'Μία φορά την ημέρα',
      two: 'Δύο φορές την ημέρα',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Νωρίτερη υπενθύμιση';

  @override
  String get latestReminder => 'Τελευταία υπενθύμιση';

  @override
  String get notificationsBlocked =>
      'Οι ειδοποιήσεις είναι απενεργοποιημένες για το Guessaday. Επιτρέψτε τες στις ρυθμίσεις συστήματος για να λαμβάνετε υπενθυμίσεις.';

  @override
  String get reminderTitle => 'Ποια ημέρα της εβδομάδας;';

  @override
  String get reveal => 'Αποκάλυψη';

  @override
  String get practice => 'Εξάσκηση';
}
