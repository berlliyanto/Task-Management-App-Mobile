import 'package:get/get.dart';
import 'package:manajemen_tugas/modules/ubahsandi/controllers/ubahsandi_controller.dart';

class UbahSandiBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UbahSandiController());
  }

}