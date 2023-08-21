import 'package:flutter/material.dart';

class LoginShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.2); // Changed starting point to top left
    
    var firstControlPoint = Offset(size.width / 4, size.height * 0.1); // Adjusted y-coordinates
    var firstEndPoint = Offset(size.width / 2.25, size.height * 0.2); // Adjusted y-coordinates
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height * 0.3); // Adjusted y-coordinates
    var secondEndPoint = Offset(size.width, size.height * 0.2); // Adjusted y-coordinates
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height * 0.7); // Changed end point to top right
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}