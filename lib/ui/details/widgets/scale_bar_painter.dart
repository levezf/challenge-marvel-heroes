import 'package:flutter/material.dart';

class ScaleBarPainter extends CustomPainter {
  final double percentFilled;
  final double scale;

  final int countBars;

  const ScaleBarPainter({@required this.percentFilled, @required this.scale, this.countBars = 44})
      : assert(countBars > 0),
        assert(percentFilled >= 0),
        assert(scale > 0);

  @override
  void paint(Canvas canvas, Size size) {
    /// [countFilledBars] is the count of painted bars.
    /// +1 must be added so that it stays as stipulated in the prototype!
    final countFilledBars = ((countBars / 100.0) * percentFilled).round() + 1;
    final countSpacesBetween = countBars - 1;

    final widthBar = size.width / (countSpacesBetween + countBars);

    double accumulatedInitialOffset = 0;

    for (var indexBar = 1; indexBar <= countBars; indexBar++) {
      final opacity = indexBar <= countFilledBars ? 1.0 : 0.25;

      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity)
        ..strokeWidth = 2;

      final startY = indexBar == countFilledBars ? 0.0 : 2.0;
      final endY = indexBar == countFilledBars ? 16.0 : 14.0;

      final Offset startPoint = Offset(accumulatedInitialOffset, startY);
      final Offset endPoint = Offset(accumulatedInitialOffset, endY);

      canvas.drawLine(startPoint, endPoint, paint);

      accumulatedInitialOffset += widthBar;

      if (indexBar < countBars) {
        final Offset startPoint = Offset(accumulatedInitialOffset, 0.0);
        final Offset endPoint = Offset(accumulatedInitialOffset, 16.0);

        canvas.drawLine(
          startPoint,
          endPoint,
          Paint()..color = Colors.transparent,
        );

        accumulatedInitialOffset += widthBar;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
