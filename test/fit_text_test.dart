import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guessaday/ui/fit_text.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const style = TextStyle(fontFamily: 'Roboto');

  test('fits the longest name within the width budget', () {
    final size = fitFontSize(
      texts: const ['Mo', 'Quarta-feira', 'Di'],
      style: style,
      maxWidth: 400,
      rowHeight: 1000,
    );
    final painter = TextPainter(
      text: TextSpan(
        text: 'Quarta-feira',
        style: style.copyWith(fontSize: size, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    expect(painter.width, lessThanOrEqualTo(400 * 0.8 + 0.5));
    expect(painter.width, greaterThan(400 * 0.8 * 0.95));
  });

  test('is limited by the row height when the width is generous', () {
    final size = fitFontSize(
      texts: const ['Mo'],
      style: style,
      maxWidth: 10000,
      rowHeight: 60,
    );
    final painter = TextPainter(
      text: TextSpan(
        text: 'Mo',
        style: style.copyWith(fontSize: size),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    expect(painter.height, lessThanOrEqualTo(60 * 0.7 + 0.5));
  });

  test('stays within the clamp range', () {
    expect(
      fitFontSize(texts: const ['x'], style: style, maxWidth: 5, rowHeight: 5),
      20,
    );
    expect(
      fitFontSize(
        texts: const ['x'],
        style: style,
        maxWidth: 1e6,
        rowHeight: 1e6,
      ),
      80,
    );
  });
}
