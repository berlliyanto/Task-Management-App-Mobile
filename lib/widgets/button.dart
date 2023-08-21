import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget submitButton(double height, double width,double fontSize, String title,
      Color colors, VoidCallback onSubmit) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors,
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
