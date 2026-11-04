import 'package:flutter/widgets.dart';

import 'stats.dart';

/// Makes [Stats] available to the widget tree and rebuilds dependents
/// whenever a round is recorded or the statistics are cleared.
class StatsScope extends InheritedNotifier<Stats> {
  const StatsScope({super.key, required Stats stats, required super.child})
    : super(notifier: stats);

  static Stats of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StatsScope>()!.notifier!;

  static Stats read(BuildContext context) =>
      context.getInheritedWidgetOfExactType<StatsScope>()!.notifier!;
}
