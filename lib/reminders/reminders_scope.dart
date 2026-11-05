import 'package:flutter/widgets.dart';

import 'reminders.dart';

/// Makes [Reminders] available to the widget tree.
class RemindersScope extends InheritedWidget {
  const RemindersScope({
    super.key,
    required this.reminders,
    required super.child,
  });

  final Reminders reminders;

  static Reminders of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<RemindersScope>()!.reminders;

  @override
  bool updateShouldNotify(RemindersScope oldWidget) =>
      reminders != oldWidget.reminders;
}
