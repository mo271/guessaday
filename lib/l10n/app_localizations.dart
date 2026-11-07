import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sv'),
    Locale('tr'),
    Locale('uk'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Guessaday'**
  String get appName;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get endDate;

  /// No description provided for @pickStartDate.
  ///
  /// In en, this message translates to:
  /// **'Pick start date'**
  String get pickStartDate;

  /// No description provided for @pickEndDate.
  ///
  /// In en, this message translates to:
  /// **'Pick end date'**
  String get pickEndDate;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'This app displays a random date. You are then supposed to calculate what day of the week this day is and select the correct one.'**
  String get appDescription;

  /// No description provided for @author.
  ///
  /// In en, this message translates to:
  /// **'Author'**
  String get author;

  /// No description provided for @howTo.
  ///
  /// In en, this message translates to:
  /// **'If you don\'t yet know how to calculate the day of the week, you can certainly learn it:'**
  String get howTo;

  /// No description provided for @moreInfo.
  ///
  /// In en, this message translates to:
  /// **'More information'**
  String get moreInfo;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @timer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get timer;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @reappearMsg.
  ///
  /// In en, this message translates to:
  /// **'Tap on hidden date to make it reappear!'**
  String get reappearMsg;

  /// No description provided for @after.
  ///
  /// In en, this message translates to:
  /// **'After {duration}'**
  String after(String duration);

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get dateRange;

  /// No description provided for @firstDayInList.
  ///
  /// In en, this message translates to:
  /// **'First day in list'**
  String get firstDayInList;

  /// No description provided for @localeDefault.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get localeDefault;

  /// No description provided for @shortDateDisplay.
  ///
  /// In en, this message translates to:
  /// **'Short date display'**
  String get shortDateDisplay;

  /// No description provided for @hideTheDate.
  ///
  /// In en, this message translates to:
  /// **'Hide the date'**
  String get hideTheDate;

  /// No description provided for @rangeCustom.
  ///
  /// In en, this message translates to:
  /// **'Pick your own'**
  String get rangeCustom;

  /// No description provided for @rangeThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get rangeThisMonth;

  /// No description provided for @rangeThisYear.
  ///
  /// In en, this message translates to:
  /// **'This year'**
  String get rangeThisYear;

  /// No description provided for @rangeNextYear.
  ///
  /// In en, this message translates to:
  /// **'Next year'**
  String get rangeNextYear;

  /// No description provided for @rangeLast100Years.
  ///
  /// In en, this message translates to:
  /// **'The last 100 years'**
  String get rangeLast100Years;

  /// No description provided for @rangeCentury20.
  ///
  /// In en, this message translates to:
  /// **'The 20th century'**
  String get rangeCentury20;

  /// No description provided for @rangeCentury21.
  ///
  /// In en, this message translates to:
  /// **'The 21st century'**
  String get rangeCentury21;

  /// No description provided for @rangeGregorianToToday.
  ///
  /// In en, this message translates to:
  /// **'1582-10-15 – today'**
  String get rangeGregorianToToday;

  /// No description provided for @range1600To2099.
  ///
  /// In en, this message translates to:
  /// **'1600-01-01 – 2099-12-31'**
  String get range1600To2099;

  /// No description provided for @range1To9999.
  ///
  /// In en, this message translates to:
  /// **'0001-01-01 – 9999-12-31'**
  String get range1To9999;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @rounds.
  ///
  /// In en, this message translates to:
  /// **'Rounds'**
  String get rounds;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @averageTime.
  ///
  /// In en, this message translates to:
  /// **'Average time'**
  String get averageTime;

  /// No description provided for @bestTime.
  ///
  /// In en, this message translates to:
  /// **'Best time'**
  String get bestTime;

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current streak'**
  String get currentStreak;

  /// No description provided for @bestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best streak'**
  String get bestStreak;

  /// No description provided for @allTime.
  ///
  /// In en, this message translates to:
  /// **'All time'**
  String get allTime;

  /// No description provided for @lastNRounds.
  ///
  /// In en, this message translates to:
  /// **'Last {n} rounds'**
  String lastNRounds(int n);

  /// No description provided for @nRounds.
  ///
  /// In en, this message translates to:
  /// **'{n} rounds'**
  String nRounds(int n);

  /// No description provided for @allRanges.
  ///
  /// In en, this message translates to:
  /// **'All date ranges'**
  String get allRanges;

  /// No description provided for @noRoundsYet.
  ///
  /// In en, this message translates to:
  /// **'No rounds played yet. Statistics appear here after your first answer.'**
  String get noRoundsYet;

  /// No description provided for @recentWindow.
  ///
  /// In en, this message translates to:
  /// **'Rounds in recent statistics'**
  String get recentWindow;

  /// No description provided for @resetStatistics.
  ///
  /// In en, this message translates to:
  /// **'Reset statistics'**
  String get resetStatistics;

  /// No description provided for @resetStatisticsConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete all recorded rounds? This cannot be undone.'**
  String get resetStatisticsConfirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @withAverage.
  ///
  /// In en, this message translates to:
  /// **'{count} · ⌀ {time}'**
  String withAverage(int count, String time);

  /// No description provided for @practiceReminders.
  ///
  /// In en, this message translates to:
  /// **'Practice reminders'**
  String get practiceReminders;

  /// No description provided for @practiceRemindersHint.
  ///
  /// In en, this message translates to:
  /// **'Random dates as notifications during the day'**
  String get practiceRemindersHint;

  /// No description provided for @remindersPerDay.
  ///
  /// In en, this message translates to:
  /// **'Reminders per day'**
  String get remindersPerDay;

  /// No description provided for @nPerDay.
  ///
  /// In en, this message translates to:
  /// **'{n, plural, =1{Once a day} =2{Twice a day} other{{n} times a day}}'**
  String nPerDay(int n);

  /// No description provided for @earliestReminder.
  ///
  /// In en, this message translates to:
  /// **'Earliest reminder'**
  String get earliestReminder;

  /// No description provided for @latestReminder.
  ///
  /// In en, this message translates to:
  /// **'Latest reminder'**
  String get latestReminder;

  /// No description provided for @notificationsBlocked.
  ///
  /// In en, this message translates to:
  /// **'Notifications are turned off for Guessaday. Allow them in the system settings to get reminders.'**
  String get notificationsBlocked;

  /// No description provided for @reminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Which day of the week?'**
  String get reminderTitle;

  /// No description provided for @reveal.
  ///
  /// In en, this message translates to:
  /// **'Reveal'**
  String get reveal;

  /// No description provided for @practice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get practice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'cs',
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sv',
    'tr',
    'uk',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
