import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Square

    Paint paint_fill_1 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.0017125, size.height * 0.6115000);
    path_1.cubicTo(size.width * 0.3080000, size.height * 0.9567889, size.width * 0.4961625, size.height * 0.5831222, size.width * 1.0001750, size.height * 1.0017889);
    path_1.cubicTo(size.width * 0.9999875, size.height * 1.1069333, size.width * 0.9996344, size.height * 0.8982035, size.width * 0.9994500, size.height * 1.0033386);
    path_1.cubicTo(size.width * 0.2939250, size.height * 1.0032991, size.width * 0.3828750, size.height * 1.0035925, size.width * 0.0010375, size.height * 1.0029592);
    path_1.cubicTo(size.width * -0.0014125, size.height * 0.9400740, size.width * 0.0003500, size.height * 0.8217667, size.width * -0.0017125, size.height * 0.6115000);
    path_1.close();

    canvas.drawPath(path_1, paint_fill_1);

    // Square
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
