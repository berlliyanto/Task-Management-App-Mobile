import 'package:get/get.dart';
import 'package:manajemen_tugas/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }

}