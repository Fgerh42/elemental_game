


import 'package:flutter/material.dart';


class PolygonPainter extends CustomPainter {
  final List<Offset> offsets;
  final Paint polygonPaint;
  final Paint borderPaint;


  final Color color;
  final Color borderColor;

  PolygonPainter(this.offsets,{this.color=Colors.transparent,this.borderColor=Colors.black})
      : polygonPaint = Paint()
    ..color = color
    ..style = PaintingStyle.fill,
        borderPaint = Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    if (offsets.isNotEmpty) {
      path.moveTo(offsets[0].dx * size.width, offsets[0].dy * size.height);
      for (var offset in offsets.skip(1)) {
        path.lineTo(offset.dx * size.width, offset.dy * size.height);
      }
      path.close();
    }

    canvas.drawPath(path, polygonPaint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}