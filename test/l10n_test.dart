import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Every translation must carry exactly the strings of the English template,
/// with the same placeholders, so a forgotten string fails here instead of
/// silently showing English.
void main() {
  final dir = Directory('lib/l10n');
  final files = dir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.arb'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));
  final template = _load('lib/l10n/app_en.arb');
  final templateKeys = _stringKeys(template);

  test('template has strings', () {
    expect(templateKeys, isNotEmpty);
  });

  for (final file in files) {
    final name = file.uri.pathSegments.last;
    group(name, () {
      final arb = _load(file.path);

      test('declares its locale', () {
        final locale = arb['@@locale'] as String?;
        expect(locale, isNotNull);
        expect('app_$locale.arb', name);
      });

      test('has exactly the template keys', () {
        expect(_stringKeys(arb), templateKeys);
        // Metadata is only needed in the template; stray entries are typos.
        for (final k in arb.keys.where((k) => k.startsWith('@'))) {
          expect(template.containsKey(k), isTrue, reason: 'unknown $k');
        }
      });

      for (final key in templateKeys) {
        test('$key keeps its placeholders', () {
          final value = arb[key];
          expect(value, isA<String>());
          expect((value as String).trim(), isNotEmpty);
          expect(_placeholders(value), _placeholders(template[key] as String));
          if (arb.containsKey('@$key')) {
            expect(arb['@$key'], template['@$key']);
          }
          if (_isPlural(template[key] as String)) {
            expect(_isPlural(value), isTrue, reason: 'must stay a plural');
            expect(value, contains('other{'), reason: 'plural needs other');
          }
        });
      }
    });
  }
}

Map<String, dynamic> _load(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

Set<String> _stringKeys(Map<String, dynamic> arb) =>
    arb.keys.where((k) => !k.startsWith('@')).toSet();

bool _isPlural(String value) => RegExp(r'\{\w+,\s*plural,').hasMatch(value);

/// Placeholder names used in a message. Inside a plural only the selector
/// and nested placeholders count, not the case names.
Set<String> _placeholders(String value) {
  if (_isPlural(value)) {
    final selector = RegExp(r'\{(\w+),\s*plural,').firstMatch(value)!.group(1)!;
    return {selector};
  }
  return RegExp(r'\{(\w+)\}').allMatches(value).map((m) => m.group(1)!).toSet();
}
