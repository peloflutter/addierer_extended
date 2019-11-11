import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalLineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('HorizontalLineWidget::build');
    return Container(
      child: CustomPaint(painter: _HorizontalLinePainter()),
    );
  }
}

class _HorizontalLinePainter extends CustomPainter {
  Paint _paint;

  _HorizontalLinePainter() {
    _paint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(10.0, 0.0), Offset(size.width - 10, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
