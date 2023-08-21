import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
  }
}