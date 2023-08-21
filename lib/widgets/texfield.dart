import 'package:flutter/material.dart';

class TextFieldWidget {
  static Widget formTextField(
      String hintText, String labelText, TextEditingController controller) {
    return TextField(
      autocorrect: false,
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: labelText),
    );
  }

   Widget formTextFieldPW(
      String hintText,
      String labelText,
      bool isObscure,
      IconData icon,
      TextEditingController controller,
      VoidCallback onTap) {
    return TextField(
      autocorrect: false,
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(icon),
        ),
      ),
    );
  }
}
