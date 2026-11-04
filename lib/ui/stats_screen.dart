import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../game/game_logic.dart';
import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../settings/settings_scope.dart';
import '../stats/stats.dart';
import '../stats/stats_scope.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = SettingsScope.of(context);
    final stats = StatsScope.of(context);
    final currentId = rangeIdFor(
      settings.preset,
      settings.customStart,
      settings.customEnd,
    );
    // The current range first, then the others by most recent play.
    final ids = [currentId, ...stats.rangeIds.where((id) => id != currentId)];
    final showAll = ids.length > 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.statistics),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: l10n.resetStatistics,
            onPressed: stats.rounds.isEmpty
                ? null
                : () => _confirmReset(context),
          ),
        ],
      ),
      body: stats.rounds.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(l10n.noRoundsYet, textAlign: TextAlign.center),
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (final id in ids)
                  _RangeSection(
                    title: _rangeLabel(context, id),
                    results: stats.forRange(id).toList(),
                    recentWindow: settings.recentWindow,
                  ),
                if (showAll)
                  _RangeSection(
                    title: l10n.allRanges,
                    results: stats.rounds,
                    recentWindow: settings.recentWindow,
                  ),
              ],
            ),
    );
  }

  String _rangeLabel(BuildContext context, String id) {
    final l10n = AppLocalizations.of(context);
    final parsed = parseRangeId(id);
    if (parsed == null) return id;
    final (preset, start, end) = parsed;
    if (preset != RangePreset.custom || start == null || end == null) {
      return presetLabel(l10n, preset);
    }
    final format = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    return '${format.format(start)} – ${format.format(end)}';
  }

  Future<void> _confirmReset(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final stats = StatsScope.read(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.resetStatistics),
        content: Text(l10n.resetStatisticsConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed == true) stats.clear();
  }
}

/// All numbers for one date range: all-time and recent side by side,
/// then the streaks.
class _RangeSection extends StatelessWidget {
  const _RangeSection({
    required this.title,
    required this.results,
    required this.recentWindow,
  });

  final String title;
  final List<RoundResult> results;
  final int recentWindow;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final theme = Theme.of(context);
    final all = Summary.of(results);
    final recent = Summary.of(lastN(results, recentWindow));
    final percent = NumberFormat.percentPattern(locale);
    final number = NumberFormat.decimalPattern(locale);

    String pct(double? v) => v == null ? '–' : percent.format(v);
    String time(Duration? d) => d == null ? '–' : formatElapsed(d);

    final headerStyle = theme.textTheme.titleMedium?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.6),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              TableRow(
                children: [
                  const SizedBox.shrink(),
                  Text(l10n.allTime, style: headerStyle),
                  Text(l10n.lastNRounds(recentWindow), style: headerStyle),
                ],
              ),
              _row(
                l10n.rounds,
                number.format(all.rounds),
                number.format(recent.rounds),
              ),
              _row(l10n.accuracy, pct(all.accuracy), pct(recent.accuracy)),
              _row(
                l10n.averageTime,
                time(all.averageTime),
                time(recent.averageTime),
              ),
              _row(l10n.bestTime, time(all.bestTime), time(recent.bestTime)),
            ],
          ),
          const SizedBox(height: 8),
          _line(
            l10n.currentStreak,
            all.currentStreakAverageTime == null
                ? number.format(all.currentStreak)
                : l10n.withAverage(
                    all.currentStreak,
                    formatElapsed(all.currentStreakAverageTime!),
                  ),
          ),
          _line(l10n.bestStreak, number.format(all.bestStreak)),
        ],
      ),
    );
  }

  TableRow _row(String label, String a, String b) => TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(label),
      ),
      Text(a),
      Text(b),
    ],
  );

  Widget _line(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Expanded(child: Text(label)),
        Text(value),
      ],
    ),
  );
}
