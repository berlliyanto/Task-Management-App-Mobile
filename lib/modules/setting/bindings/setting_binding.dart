import 'package:get/get.dart';
import 'package:manajemen_tugas/modules/setting/controllers/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }

}