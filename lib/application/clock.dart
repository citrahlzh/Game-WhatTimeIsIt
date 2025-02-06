import 'dart:math';
import 'package:flutter/material.dart';
import 'clock_color.dart';

// Clock Widget
class ClockPainter extends CustomPainter {
  final int X;
  final int Y;

  ClockPainter(this.X, this.Y);

  final Map<String, Color> randomColors =
      clockColors[Random().nextInt(clockColors.length)];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Paint untuk lingkaran luar
    final paintOuterCircle = Paint()
      ..color = randomColors['color1'] ?? const Color(0xFF7A2A4F)
      ..style = PaintingStyle.fill;

    final paintOuterBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Paint untuk lingkaran dalam
    final paintInnerCircle = Paint()
      ..color = randomColors['color2'] ?? const Color(0xA5FFC0DE)
      ..style = PaintingStyle.fill;

    final paintInnerBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paintHourHand = Paint()
      ..color = randomColors['color1'] ?? const Color(0xFF7A2A4F)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final paintMinuteHand = Paint()
      ..color = randomColors['color1'] ?? const Color(0xFF7A2A4F)
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Gambar lingkaran luar
    canvas.drawCircle(center, radius, paintOuterCircle);
    canvas.drawCircle(center, radius, paintOuterBorder);

    // Gambar lingkaran dalam
    canvas.drawCircle(center, radius * 0.85, paintInnerCircle);
    canvas.drawCircle(center, radius * 0.85, paintInnerBorder);

    // Hitung sudut untuk setiap jarum
    final hourAngle = (X % 12 + Y / 60) * 30 * pi / 180;
    final minuteAngle = (Y % 60) * 6 * pi / 180;

    // Gambar angka di lingkaran jam
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 1; i <= 12; i++) {
      // Sudut angka pada lingkaran (dalam radian)
      final angle = (i * 30) * pi / 180;

      // Posisi angka di lingkaran
      final x = center.dx + (radius - 43) * cos(angle - pi / 2);
      final y = center.dy + (radius - 43) * sin(angle - pi / 2);

      // Gambar teks angka
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Newray',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
      textPainter.layout();
      final textOffset = Offset(
        x - textPainter.width / 2,
        y - textPainter.height / 2,
      );
      textPainter.paint(canvas, textOffset);
    }

    // Gambar jarum jam
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.40 * cos(hourAngle - pi / 2),
        center.dy + radius * 0.40 * sin(hourAngle - pi / 2),
      ),
      paintHourHand,
    );

    // Gambar jarum menit
    canvas.drawLine(
      center,
      Offset(
        center.dx + radius * 0.55 * cos(minuteAngle - pi / 2),
        center.dy + radius * 0.55 * sin(minuteAngle - pi / 2),
      ),
      paintMinuteHand,
    );

    // Gambar pusat jam
    final paintCenter = Paint()..color = Colors.black;
    canvas.drawCircle(center, 7, paintCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
