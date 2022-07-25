import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xff1407D6).withOpacity(0.34)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    paint0.shader = ui.Gradient.linear(const Offset(0, 8), const Offset(0, 8), [
      const Color(0xff151337).withOpacity(0.72),
      const Color(0xff48439B).withOpacity(0.73),
      const Color(0xffFFFFEA).withOpacity(0.67)
    ], [
      0.00,
      1.00,
      0.00
    ]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.5460000, size.height * 0.1880000);
    path0.lineTo(size.width * 0.4962000, size.height * 0.1904000);
    path0.lineTo(size.width * 0.3638000, size.height * 0.4176000);
    path0.lineTo(size.width * 0.3652000, size.height * 0.7928000);
    path0.lineTo(size.width * 0.5062000, size.height * 0.9808000);
    path0.lineTo(size.width * 0.5508000, size.height * 0.9804000);
    path0.lineTo(size.width * 0.6770000, size.height * 0.7928000);
    path0.lineTo(size.width * 0.6790000, size.height * 0.4124000);
    path0.lineTo(size.width * 0.5460000, size.height * 0.1880000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
