import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/data/services/auth.service.dart';

class RegisterController extends GetxController {
  late TextEditingController email, password, name, phone;
  RxBool isObscure = false.obs;

  void registerUser(String email, String password, String name, String phone ){
    AuthService().register(email, password, name, phone).then((value) =>Get.back());
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.onClose();
  }
}
