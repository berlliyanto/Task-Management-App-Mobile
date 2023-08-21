import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({super.key});
  final layoutC = Get.find<LayoutController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: layoutC.screenHeight * 100,
      width: layoutC.screenWidth * 100,
      color: Color(layoutC.colorPalette['biru1']!),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text("Calendar")
          ],
        ),
      ),
    );
  }
}