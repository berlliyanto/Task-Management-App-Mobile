import 'package:get/get.dart';
import 'package:manajemen_tugas/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(() => HomeController());
  }
}