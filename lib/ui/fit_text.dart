import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// Returns the font size at which every string in [texts] fits on one line
/// within [widthFraction] of [maxWidth] and within [heightFraction] of
/// [rowHeight].
///
/// The strings are measured in bold, so the bold highlight of the correct
/// answer never makes a row wider than the others were measured for.
double fitFontSize({
  required List<String> texts,
  required TextStyle style,
  required double maxWidth,
  required double rowHeight,
  double widthFraction = 0.8,
  double heightFraction = 0.7,
  double min = 20,
  double max = 80,
}) {
  const reference = 100.0;
  final probe = style.copyWith(
    fontSize: reference,
    fontWeight: FontWeight.bold,
  );
  var widest = 0.0;
  var tallest = 0.0;
  for (final text in texts) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: probe),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    widest = math.max(widest, painter.width);
    tallest = math.max(tallest, painter.height);
    painter.dispose();
  }
  if (widest <= 0 || tallest <= 0) return min;
  final byWidth = reference * maxWidth * widthFraction / widest;
  final byHeight = reference * rowHeight * heightFraction / tallest;
  return math.min(byWidth, byHeight).clamp(min, max);
}
