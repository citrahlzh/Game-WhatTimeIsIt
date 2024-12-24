import 'dart:math';
import 'package:flutter/material.dart';
// import 'clock_color.dart';

class ClockPainterSmall extends CustomPainter {
  final int X;
  final int Y;

  ClockPainterSmall(this.X, this.Y);

  Color XColor() {
    if (X <= 3) {
      return const Color(0xFF7A2A4F);
    } else if (X <= 6) {
      return const Color.fromARGB(255, 42, 57, 122);
    } else if (X <= 9) {
      return const Color.fromARGB(255, 65, 122, 42);
    } else if (X <= 12) {
      return const Color.fromARGB(255, 122, 97, 42);
    } else if (X <= 15) {
      return const Color.fromARGB(255, 122, 42, 42);
    } else if (X <= 18) {
      return const Color.fromARGB(255, 97, 42, 122);
    } else if (X <= 21) {
      return const Color.fromARGB(255, 42, 122, 122);
    } else {
      return const Color.fromARGB(255, 122, 71, 42);
    }
  }

  Color YColor() {
    if (X <= 3) {
      return const Color(0xA5FFC0DE);
    } else if (X <= 6) {
      return const Color.fromARGB(163, 192, 227, 255);
    } else if (X <= 9) {
      return const Color.fromARGB(164, 199, 255, 192);
    } else if (X <= 12) {
      return const Color.fromARGB(164, 254, 255, 192);
    } else if (X <= 15) {
      return const Color.fromARGB(164, 255, 192, 192);
    } else if (X <= 18) {
      return const Color.fromARGB(164, 237, 192, 255);
    } else if (X <= 21) {
      return const Color.fromARGB(164, 192, 255, 252);
    } else {
      return const Color.fromARGB(164, 255, 217, 192);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Paint untuk lingkaran luar
    final paintOuterCircle = Paint()
      ..color = XColor()
      ..style = PaintingStyle.fill;

    final paintOuterBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Paint untuk lingkaran dalam
    final paintInnerCircle = Paint()
      ..color = YColor()
      ..style = PaintingStyle.fill;

    final paintInnerBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paintHourHand = Paint()
      ..color = XColor()
      ..strokeWidth = 7.2
      ..strokeCap = StrokeCap.round;

    final paintMinuteHand = Paint()
      ..color = XColor()
      ..strokeWidth = 5
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
      final x = center.dx + (radius - 31) * cos(angle - pi / 2);
      final y = center.dy + (radius - 31) * sin(angle - pi / 2);

      // Gambar teks angka
      textPainter.text = TextSpan(
        text: i.toString(),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Newray',
          fontSize: 16,
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
