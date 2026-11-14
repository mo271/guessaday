// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appName => 'Guessaday';

  @override
  String get settings => 'Asetukset';

  @override
  String get about => 'Tietoja';

  @override
  String get startDate => 'Alkupäivä';

  @override
  String get endDate => 'Loppupäivä';

  @override
  String get pickStartDate => 'Valitse alkupäivä';

  @override
  String get pickEndDate => 'Valitse loppupäivä';

  @override
  String get appDescription =>
      'Sovellus näyttää satunnaisen päivämäärän. Tehtäväsi on laskea, mikä viikonpäivä se on, ja valita oikea.';

  @override
  String get author => 'Kehittäjä';

  @override
  String get howTo =>
      'Jos et vielä osaa laskea viikonpäivää, voit hyvin oppia sen:';

  @override
  String get moreInfo => 'Lisätietoja';

  @override
  String get ok => 'OK';

  @override
  String get version => 'Versio';

  @override
  String get timer => 'Sekuntikello';

  @override
  String get enabled => 'Käytössä';

  @override
  String get disabled => 'Pois käytöstä';

  @override
  String get reappearMsg =>
      'Napauta piilotettua päivämäärää nähdäksesi sen uudelleen!';

  @override
  String after(String duration) {
    return '$duration kuluttua';
  }

  @override
  String get dateRange => 'Päivämääräväli';

  @override
  String get firstDayInList => 'Listan ensimmäinen päivä';

  @override
  String get localeDefault => 'Automaattinen';

  @override
  String get shortDateDisplay => 'Näytä päivämäärä lyhyesti';

  @override
  String get hideTheDate => 'Piilota päivämäärä';

  @override
  String get rangeCustom => 'Oma väli';

  @override
  String get rangeThisMonth => 'Tämä kuukausi';

  @override
  String get rangeThisYear => 'Tämä vuosi';

  @override
  String get rangeNextYear => 'Ensi vuosi';

  @override
  String get rangeLast100Years => 'Viimeiset 100 vuotta';

  @override
  String get rangeCentury20 => '1900-luku';

  @override
  String get rangeCentury21 => '2000-luku';

  @override
  String get rangeGregorianToToday => '1582-10-15 – tänään';

  @override
  String get range1600To2099 => '1600-01-01 – 2099-12-31';

  @override
  String get range1To9999 => '0001-01-01 – 9999-12-31';

  @override
  String get statistics => 'Tilastot';

  @override
  String get rounds => 'Kierrokset';

  @override
  String get accuracy => 'Osumatarkkuus';

  @override
  String get averageTime => 'Keskiaika';

  @override
  String get bestTime => 'Paras aika';

  @override
  String get currentStreak => 'Nykyinen putki';

  @override
  String get bestStreak => 'Pisin putki';

  @override
  String get allTime => 'Kaikkiaan';

  @override
  String lastNRounds(int n) {
    return 'Viimeiset $n kierrosta';
  }

  @override
  String nRounds(int n) {
    return '$n kierrosta';
  }

  @override
  String get allRanges => 'Kaikki päivämäärävälit';

  @override
  String get noRoundsYet =>
      'Ei vielä pelattuja kierroksia. Tilastot näkyvät tässä ensimmäisen vastauksesi jälkeen.';

  @override
  String get recentWindow => 'Kierroksia viimeaikaisissa tilastoissa';

  @override
  String get resetStatistics => 'Nollaa tilastot';

  @override
  String get resetStatisticsConfirm =>
      'Poistetaanko kaikki tallennetut kierrokset? Tätä ei voi perua.';

  @override
  String get delete => 'Poista';

  @override
  String get cancel => 'Peruuta';

  @override
  String withAverage(int count, String time) {
    return '$count · ka. $time';
  }

  @override
  String get practiceReminders => 'Harjoitusmuistutukset';

  @override
  String get practiceRemindersHint =>
      'Satunnaisia päivämääriä ilmoituksina päivän aikana';

  @override
  String get remindersPerDay => 'Muistutuksia päivässä';

  @override
  String nPerDay(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kertaa päivässä',
      two: 'Kahdesti päivässä',
      one: 'Kerran päivässä',
    );
    return '$_temp0';
  }

  @override
  String get earliestReminder => 'Aikaisin muistutus';

  @override
  String get latestReminder => 'Myöhäisin muistutus';

  @override
  String get notificationsBlocked =>
      'Ilmoitukset on poistettu käytöstä Guessaday-sovellukselta. Salli ne järjestelmän asetuksissa saadaksesi muistutuksia.';

  @override
  String get reminderTitle => 'Mikä viikonpäivä?';

  @override
  String get reveal => 'Näytä vastaus';

  @override
  String get practice => 'Harjoittele';
}
