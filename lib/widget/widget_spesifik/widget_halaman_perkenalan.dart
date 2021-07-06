import 'package:flutter/material.dart';

/// Koleksi widget yang dapat digunakan di halaman utama (main screen widgets)
///
/// Widget tanpa keadaan (stateless widget)

class DesainLatarBelakang extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.yellow;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    var path = Path();

    /*path.quadraticBezierTo(x1, y1, x2, y2)*/
    path.quadraticBezierTo(size.width / 2, size.height / 2, size.width / 2, size.height / 4);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}