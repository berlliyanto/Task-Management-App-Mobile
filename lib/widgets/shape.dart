import 'package:flutter/material.dart';
import 'dart:math';

class CircleWidget {
  static Widget circlePositioned(
    double left,
    double top,
    double radius,
    Color color1,
    Color color2,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: ClipOval(
        child: Container(
          height: radius,
          width: radius,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  final double size, left, top;
  final Color color;

  const StarWidget({super.key, required this.size, required this.color, required this.left, required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: CustomPaint(
        painter: _StarPainter(size: size, color: color),
        size: Size(size, size),
      ),
    );
  }
}

class _StarPainter extends CustomPainter {
  final Paint _paint;
  final double _radius;
  final double _centerX;
  final double _centerY;
  final int _numPoints;
  final double _innerRadius;

  _StarPainter({required double size, required Color color})
      : _paint = Paint()..color = color,
        _radius = size / 2,
        _centerX = size / 2,
        _centerY = size / 2,
        _numPoints = 5,
        _innerRadius = 0.4;

  @override
  void paint(Canvas canvas, Size size) {
    final double angleStep = pi / _numPoints;
    final double halfAngleStep = angleStep / 2;

    Path path = Path();
    path.moveTo(
      _centerX + _radius * cos(-halfAngleStep),
      _centerY + _radius * sin(-halfAngleStep),
    );

    for (int i = 1; i < _numPoints * 2; i++) {
      double radius = i % 2 == 0 ? _radius : _radius * _innerRadius;
      double x = _centerX + radius * cos(-halfAngleStep + angleStep * i);
      double y = _centerY + radius * sin(-halfAngleStep + angleStep * i);
      path.lineTo(x, y);
    }

    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
