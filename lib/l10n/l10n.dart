import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

/// Every language the Material and Cupertino widgets can be localised to.
/// The app's own strings fall back to English where no translation exists,
/// while dates and weekday names follow the device language, exactly as the
/// original app did.
final List<Locale> supportedLocales = [
  const Locale('en'),
  for (final code in kMaterialSupportedLanguages)
    if (code != 'en' && kCupertinoSupportedLanguages.contains(code))
      Locale(code),
];

/// Loads the app's strings for [AppLocalizations]' own languages and
/// English for everything else.
class FallbackAppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const FallbackAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppLocalizations> load(Locale locale) {
    final inner = AppLocalizations.delegate;
    return inner.load(inner.isSupported(locale) ? locale : const Locale('en'));
  }

  @override
  bool shouldReload(FallbackAppLocalizationsDelegate old) => false;
}

/// Human-readable label for a range preset.
String presetLabel(AppLocalizations l10n, Object preset) {
  // Imported lazily to keep this file free of game imports.
  return _presetLabels(l10n)[preset.toString()] ?? preset.toString();
}

Map<String, String> _presetLabels(AppLocalizations l10n) => {
  'RangePreset.custom': l10n.rangeCustom,
  'RangePreset.thisMonth': l10n.rangeThisMonth,
  'RangePreset.thisYear': l10n.rangeThisYear,
  'RangePreset.nextYear': l10n.rangeNextYear,
  'RangePreset.last100Years': l10n.rangeLast100Years,
  'RangePreset.century20': l10n.rangeCentury20,
  'RangePreset.century21': l10n.rangeCentury21,
  'RangePreset.gregorianToToday': l10n.rangeGregorianToToday,
  'RangePreset.y1600to2099': l10n.range1600To2099,
  'RangePreset.y1to9999': l10n.range1To9999,
};
