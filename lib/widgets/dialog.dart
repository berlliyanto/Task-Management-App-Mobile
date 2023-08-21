import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogWidget {
  static Future dialogAlert(String title, String subtitle, String okText, String cancelText, VoidCallback onOK, VoidCallback onCancel){
    return Get.defaultDialog(
      title: title,
      middleText: subtitle,
      onConfirm: onOK,
      onCancel: onCancel,
      textCancel: cancelText,
      textConfirm: okText,
    );
  }
}