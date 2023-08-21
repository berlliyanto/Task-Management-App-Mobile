import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manajemen_tugas/data/services/auth.service.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';

class LoginController extends GetxController {
  //FORM LOGIN
  late TextEditingController email;
  late TextEditingController password;
  RxBool isAutoLogin = true.obs;
  RxBool isAuth = false.obs;
  RxBool rememberMe = false.obs;
  RxBool isObscure = true.obs;

  void dialogError(String msg) {
    Get.defaultDialog(title: 'terjadi_kesalahan'.tr, middleText: msg);
  }

  Future<void> autoLogin() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      if (data['autoLogin'] == true) {
        login(data['email'], data['password'], data['rememberMe']).then((value) {
          if(value){
            Get.offNamed(Routes.homePage);
          }
        });
      }
    }
  }

  Future<bool> login(String email, String password, bool rememberMe)async{
    if (email != '' && password != '') {
      if (GetUtils.isEmail(email)) {
        AuthService().login(email, password).then((value) {
          if (value.statusCode == 200) {
            var data = value.body['data'];
            if (email == data['email'] && password == data['password']) {
              if (rememberMe) {
                //Simpan di storage dengan GetStorage
                final box = GetStorage();
                box.write('dataUser', {
                  "id": data['_id'],
                  "email": email,
                  "password": password,
                  "name": data['name'],
                  "rememberMe": rememberMe,
                  "autoLogin": isAutoLogin.value,
                  "token": data['token'],
                });
                Get.offNamed(Routes.homePage);
                return true;
              } else {
                // hapus Storage
                final box = GetStorage();
                if (box.read('dataUser') != null) {
                  box.erase();
                }
              }
              // Get.offAllNamed(RoutesName.dashboardpage);
              isAuth.value = true;
              Get.offNamed(Routes.homePage);
            } else {
              dialogError("email_password_salah".tr);
              return false;
            }
          } else {
            dialogError("email_password_salah".tr);
            return false;
          }
        });
      } else {
        dialogError("not_email".tr);
        return false;
      }
    } else {
      dialogError("field_empty".tr);
      return false;
    }
    return false;
  }

  void logout() {
    isAutoLogin.value = false;
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      box.write('dataUser', {
        "id": data['_id'],
        "email": data['email'],
        "password": data['password'],
        "rememberMe": data['rememberMe'],
        "autoLogin": isAutoLogin.value,
        "token": '',
      });
    } else {
      print("Data User Kosong");
    }
    Get.offAllNamed(Routes.loginPage);
    isAuth.value = false;
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      email.text = data['email'];
      password.text = data['password'];
      rememberMe.value = data['rememberMe'];
    }
    autoLogin();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
