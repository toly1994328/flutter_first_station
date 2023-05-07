import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'paper_app_bar.dart';

class Paper extends StatefulWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  State<Paper> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaperAppBar(
        onClear: _clear,
      ),
      body: CustomPaint(
        painter: PaperPainter(),
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      ),
    );
  }

  void _clear() {}
}

class PaperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // List<Offset> points = const [
    //   Offset(100,100),
    //   Offset(100,150),
    //   Offset(150,150),
    //   Offset(200,100),
    // ];
    //
    // paint.strokeWidth = 10;
    //
    // paint.strokeCap = StrokeCap.round;
    //
    //
    // canvas.drawPoints(PointMode.polygon, points , paint);
    // canvas.translate(0, 150);
    Paint paint = Paint();

    canvas.drawCircle(Offset(100, 100), 50, paint);
    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(250, 100), 50, paint);
    canvas.translate(0, 150);

    paint.strokeWidth = 2;
    Rect rect = Rect.fromCenter(center: Offset(100, 100), width: 100, height: 80);
    canvas.drawRect(rect, paint);
    paint.style = PaintingStyle.fill;
    RRect rrect = RRect.fromRectXY(rect.translate(150, 0), 8, 8);
    canvas.drawRRect(rrect, paint);

    canvas.translate(0, 150);
    paint.strokeWidth = 2;
    Rect overRect = Rect.fromCenter(center: Offset(100, 100), width: 100, height: 80);
    canvas.drawOval(overRect, paint);
    paint.style = PaintingStyle.stroke;
    canvas.drawArc(overRect.translate(150, 0), 0, pi*1.3,true,paint);
    // RRect rrect = RRect.fromRectXY(rect.translate(150, 0), 8, 8);
    // canvas.drawRRect(rrect, paint);


    // paint.style = PaintingStyle.stroke;
    // canvas.drawCircle(Offset(250, 100), 50, paint);

    // paint.color = Colors.red;
    // paint.style = PaintingStyle.stroke;
    // paint.strokeJoin = StrokeJoin.round;
    // canvas.drawPoints(PointMode.polygon, points , paint);
    // canvas.translate(0, 150);
    //
    // paint.color = Colors.blue;
    // canvas.drawPoints(PointMode.polygon, points , paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
