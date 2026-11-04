import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../game/game_logic.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../settings/settings.dart';
import '../settings/settings_scope.dart';
import 'weekday_names.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final dateFormat = DateFormat.yMMMd(locale);
    final isCustom = settings.preset == RangePreset.custom;

    String seconds(double s) =>
        '${NumberFormat.decimalPattern(locale).format(s)}s';

    String firstDayLabel(int weekday) =>
        weekday == 0 ? l10n.localeDefault : weekdayName(locale, weekday);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.timer_outlined),
            title: Text(l10n.timer),
            subtitle: Text(
              settings.timerEnabled ? l10n.enabled : l10n.disabled,
            ),
            value: settings.timerEnabled,
            onChanged: settings.setTimerEnabled,
          ),
          ListTile(
            leading: const Icon(Icons.event_note_outlined),
            title: Text(l10n.dateRange),
            subtitle: Text(presetLabel(l10n, settings.preset)),
            onTap: () async {
              final picked = await pickOption<RangePreset>(
                context,
                title: l10n.dateRange,
                current: settings.preset,
                options: [
                  for (final p in RangePreset.values) (p, presetLabel(l10n, p)),
                ],
              );
              if (picked != null) settings.setPreset(picked);
            },
          ),
          ListTile(
            leading: const SizedBox(width: 24),
            enabled: isCustom,
            title: Text(l10n.startDate),
            subtitle: Text(dateFormat.format(settings.customStart)),
            onTap: () => _pickDate(
              context,
              l10n.pickStartDate,
              settings.customStart,
              settings.setCustomStart,
            ),
          ),
          ListTile(
            leading: const SizedBox(width: 24),
            enabled: isCustom,
            title: Text(l10n.endDate),
            subtitle: Text(dateFormat.format(settings.customEnd)),
            onTap: () => _pickDate(
              context,
              l10n.pickEndDate,
              settings.customEnd,
              settings.setCustomEnd,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: Text(l10n.firstDayInList),
            subtitle: Text(firstDayLabel(settings.firstWeekday)),
            onTap: () async {
              final picked = await pickOption<int>(
                context,
                title: l10n.firstDayInList,
                current: settings.firstWeekday,
                options: [for (var w = 0; w <= 7; w++) (w, firstDayLabel(w))],
              );
              if (picked != null) settings.setFirstWeekday(picked);
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.visibility_off_outlined),
            title: Text(l10n.shortDateDisplay),
            subtitle: Text(settings.hideDate ? l10n.enabled : l10n.disabled),
            value: settings.hideDate,
            onChanged: (value) {
              settings.setHideDate(value);
              if (value) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(l10n.reappearMsg)));
              }
            },
          ),
          ListTile(
            leading: const SizedBox(width: 24),
            enabled: settings.hideDate,
            title: Text(l10n.hideTheDate),
            subtitle: Text(l10n.after(seconds(settings.hideAfterSeconds))),
            onTap: () async {
              final picked = await pickOption<double>(
                context,
                title: l10n.hideTheDate,
                current: settings.hideAfterSeconds,
                options: [
                  for (final s in Settings.hideAfterOptions) (s, seconds(s)),
                ],
              );
              if (picked != null) settings.setHideAfterSeconds(picked);
            },
          ),
          ListTile(
            leading: const Icon(Icons.insights_outlined),
            title: Text(l10n.recentWindow),
            subtitle: Text(l10n.nRounds(settings.recentWindow)),
            onTap: () async {
              final picked = await pickOption<int>(
                context,
                title: l10n.recentWindow,
                current: settings.recentWindow,
                options: [
                  for (final n in Settings.recentWindowOptions)
                    (n, l10n.nRounds(n)),
                ],
              );
              if (picked != null) settings.setRecentWindow(picked);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(
    BuildContext context,
    String title,
    DateTime current,
    void Function(DateTime) onPicked,
  ) async {
    final picked = await showDatePicker(
      context: context,
      helpText: title,
      initialDate: DateTime(current.year, current.month, current.day),
      firstDate: DateTime(1, 1, 1),
      lastDate: DateTime(9999, 12, 31),
    );
    if (picked != null) onPicked(picked);
  }
}

/// A radio-list dialog. Returns the chosen value, or null if dismissed.
Future<T?> pickOption<T>(
  BuildContext context, {
  required String title,
  required List<(T, String)> options,
  required T current,
}) {
  return showDialog<T>(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(title),
      children: [
        RadioGroup<T>(
          groupValue: current,
          onChanged: (value) => Navigator.of(context).pop(value),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final (value, label) in options)
                RadioListTile<T>(value: value, title: Text(label)),
            ],
          ),
        ),
      ],
    ),
  );
}
