import 'package:flutter/widgets.dart';

import 'settings.dart';

/// Makes [Settings] available to the widget tree and rebuilds dependents
/// whenever a setting changes.
class SettingsScope extends InheritedNotifier<Settings> {
  const SettingsScope({
    super.key,
    required Settings settings,
    required super.child,
  }) : super(notifier: settings);

  /// Subscribes the calling widget to settings changes.
  static Settings of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsScope>()!.notifier!;

  /// Reads the settings once, without subscribing. For event handlers.
  static Settings read(BuildContext context) =>
      context.getInheritedWidgetOfExactType<SettingsScope>()!.notifier!;
}
