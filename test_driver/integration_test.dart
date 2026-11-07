import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

/// Host side of `flutter drive`: writes every screenshot the integration
/// test takes to `screenshots/<name>.png`.
Future<void> main() => integrationDriver(
  onScreenshot: (String name, List<int> bytes, [Map<String, Object?>? args]) async {
    final file = File('screenshots/$name.png');
    await file.create(recursive: true);
    await file.writeAsBytes(bytes);
    return true;
  },
);
