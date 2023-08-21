import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manajemen_tugas/data/services/auth.service.dart';

class UbahSandiController extends GetxController {
  RxBool isObsucreCurrent = true.obs;
  RxBool isObsucreNew = true.obs;
  RxBool isObsucreConfirm = true.obs;

  late TextEditingController currentPW;
  late TextEditingController newPW;
  late TextEditingController confirmPW;

  void showSnackBar(String title, String msg) {
    Get.snackbar(title, msg,
        duration: const Duration(milliseconds: 1000),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(top: 10));
  }

  void changePassword(String currentPassword, String newPassword,
      String confirmPassword, bool isAutoLogin) {
    if (currentPassword != '') {
      final box = GetStorage();
      if (box.read('dataUser') != null) {
        final data = box.read('dataUser') as Map<String, dynamic>;
        if (currentPassword == data['password']) {
          if (newPassword == confirmPassword &&
              newPassword != '' &&
              confirmPassword != '') {
            if (newPassword != data['password']) {
              AuthService()
                  .changePassword(data['id'], confirmPassword)
                  .then((value) {
                if (value.statusCode == 200) {
                  box.write('dataUser', {
                    "id": data['_id'],
                    "email": data['email'],
                    "password": confirmPassword,
                    "rememberMe": data['rememberMe'],
                    "autoLogin": isAutoLogin,
                    "token": data['token'],
                  });
                  Get.back();
                } else {
                  showSnackBar('terjadi_kesalahan'.tr, "Error");
                }
              });
            } else {
              showSnackBar('terjadi_kesalahan'.tr, 'gunakan_password_berbeda'.tr);
            }
          } else {
            showSnackBar('terjadi_kesalahan'.tr, 'konfirmasi_password'.tr);
          }
        } else {
          showSnackBar('terjadi_kesalahan'.tr, 'password_tidak_sesuai'.tr);
        }
      } else {
        showSnackBar('terjadi_kesalahan'.tr, 'field_empty'.tr);
      }
    } else {
      showSnackBar('terjadi_kesalahan'.tr, 'field_empty'.tr);
    }
  }

  @override
  void onInit() {
    currentPW = TextEditingController();
    newPW = TextEditingController();
    confirmPW = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    currentPW.clear();
    newPW.clear();
    confirmPW.clear();
    super.onClose();
  }
}
