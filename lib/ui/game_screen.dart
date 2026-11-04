import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../game/game_logic.dart';
import 'fit_text.dart';
import '../l10n/app_localizations.dart';
import '../settings/settings.dart';
import '../settings/settings_scope.dart';
import '../stats/stats.dart';
import '../stats/stats_scope.dart';
import 'about_dialog.dart';
import 'settings_screen.dart';
import 'stats_screen.dart';
import 'weekday_names.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random _random = Random();
  Round? _round;
  int? _guess;
  Duration? _elapsed;
  bool _dateVisible = true;
  Timer? _hideTimer;
  (RangePreset, DateTime, DateTime)? _rangeKey;

  bool get _answered => _guess != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Runs before every build that follows a settings change, so this is
    // where a new date range starts a new round.
    final settings = SettingsScope.of(context);
    if (settings.rangeKey != _rangeKey) {
      _rangeKey = settings.rangeKey;
      _startRound(settings);
    } else if (!_answered) {
      _scheduleHide(settings);
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startRound(Settings settings) {
    final range = rangeForPreset(
      settings.preset,
      today: DateTime.now(),
      customStart: settings.customStart,
      customEnd: settings.customEnd,
    );
    _round = Round(
      date: randomDateIn(range, _random),
      startedAt: DateTime.now(),
    );
    _guess = null;
    _elapsed = null;
    _scheduleHide(settings);
  }

  /// Shows the date and, while still guessing with "short date display"
  /// on, hides it again after the configured delay.
  void _scheduleHide(Settings settings) {
    _hideTimer?.cancel();
    _dateVisible = true;
    if (settings.hideDate && !_answered) {
      final delay = Duration(
        milliseconds: (settings.hideAfterSeconds * 1000).round(),
      );
      _hideTimer = Timer(delay, () {
        if (mounted) setState(() => _dateVisible = false);
      });
    }
  }

  void _onGuess(int weekday) {
    if (_answered) return;
    final settings = SettingsScope.read(context);
    final elapsed = DateTime.now().difference(_round!.startedAt);
    setState(() {
      _guess = weekday;
      _elapsed = elapsed;
      _scheduleHide(settings);
    });
    StatsScope.read(context).record(
      RoundResult(
        rangeId: rangeIdFor(
          settings.preset,
          settings.customStart,
          settings.customEnd,
        ),
        correct: weekday == _round!.correctWeekday,
        millis: settings.timerEnabled ? elapsed.inMilliseconds : null,
      ),
    );
  }

  /// Tapping anywhere else: next round once answered, otherwise bring a
  /// hidden date back.
  void _onBackgroundTap() {
    final settings = SettingsScope.read(context);
    setState(() {
      if (_answered) {
        _startRound(settings);
      } else {
        _scheduleHide(settings);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final textTheme = Theme.of(context).textTheme;
    final round = _round!;
    final first = settings.firstWeekday == 0
        ? localeFirstWeekday(locale)
        : settings.firstWeekday;
    // Same fade curve as the original app: a quick fade that gets a little
    // slower the longer the date was shown.
    final fadeSeconds = 0.02 + (settings.hideAfterSeconds - 0.1) / 10;
    final showTimer = _answered && settings.timerEnabled && _elapsed != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.insights_outlined),
            tooltip: l10n.statistics,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const StatsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: l10n.settings,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SettingsScreen()),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: l10n.about,
            onPressed: () => showAboutGuessaday(context),
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onBackgroundTap,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // The seven weekday rows take three quarters of the height; the
              // date and the timer share the rest. The row font is as large
              // as the longest weekday name allows.
              final rowHeight = constraints.maxHeight * 0.75 / 7;
              final names = [
                for (final weekday in weekdayOrder(first))
                  weekdayName(locale, weekday),
              ];
              final rowFontSize = fitFontSize(
                texts: names,
                style: textTheme.titleLarge!,
                maxWidth: constraints.maxWidth,
                rowHeight: rowHeight,
              );
              return Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AnimatedOpacity(
                          opacity: _dateVisible ? 1 : 0,
                          duration: Duration(
                            milliseconds: (fadeSeconds * 1000).round(),
                          ),
                          child: Text(
                            DateFormat.yMMMMd(locale).format(round.date),
                            textAlign: TextAlign.center,
                            style: textTheme.displaySmall?.copyWith(
                              fontSize: 44,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  for (final weekday in weekdayOrder(first))
                    _WeekdayRow(
                      name: weekdayName(locale, weekday),
                      state: _rowState(weekday, round),
                      height: rowHeight,
                      fontSize: rowFontSize,
                      onTap: _answered ? null : () => _onGuess(weekday),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        showTimer ? formatElapsed(_elapsed!) : '',
                        style: textTheme.headlineMedium?.copyWith(
                          fontFeatures: const [FontFeature.tabularFigures()],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _RowState _rowState(int weekday, Round round) {
    if (!_answered) return _RowState.open;
    if (weekday == round.correctWeekday) return _RowState.correct;
    if (weekday == _guess) return _RowState.wrong;
    return _RowState.dimmed;
  }
}

enum _RowState { open, correct, wrong, dimmed }

class _WeekdayRow extends StatelessWidget {
  const _WeekdayRow({
    required this.name,
    required this.state,
    required this.height,
    required this.fontSize,
    required this.onTap,
  });

  final String name;
  final _RowState state;
  final double height;
  final double fontSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final base = Theme.of(context).textTheme.titleLarge!
        .copyWith(fontSize: fontSize);
    final style = switch (state) {
      _RowState.open => base,
      _RowState.correct => base.copyWith(
        color: scheme.primary,
        fontWeight: FontWeight.bold,
      ),
      _RowState.wrong => base.copyWith(
        color: scheme.error,
        decoration: TextDecoration.lineThrough,
        decorationColor: scheme.error,
      ),
      _RowState.dimmed => base.copyWith(
        color: scheme.onSurface.withValues(alpha: 0.3),
      ),
    };
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: Center(
          // The size already follows the screen, so the system text scale
          // must not be applied on top of it.
          child: Text(name, style: style, textScaler: TextScaler.noScaling),
        ),
      ),
    );
  }
}
