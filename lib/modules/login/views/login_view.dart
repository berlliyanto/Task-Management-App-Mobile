import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';
import 'package:manajemen_tugas/widgets/button.dart';
import 'package:manajemen_tugas/widgets/clip.dart';
import 'package:manajemen_tugas/widgets/texfield.dart';

class LoginPage extends GetView<LoginController> {
  final layoutC = Get.find<LayoutController>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(layoutC.colorPalette['biru1']!),
        height: layoutC.screenHeight * 100,
        width: layoutC.screenWidth * 100,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: layoutC.screenHeight * 60,
                child: Stack(
                  children: [
                    Transform.rotate(
                      angle: 180 * (3.141592653589793 / 180),
                      child: Container(
                        width: layoutC.screenWidth * 100,
                        height: layoutC.screenHeight * 60,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF226597), Color(0xFF113F67)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: ClipPath(
                          clipper: LoginShapeClipper(),
                          child: Container(
                            color: Color(layoutC.colorPalette['biru1']!),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Lottie.asset("lib/assets/lottie/task.json"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Shimmer.fromColors(
                            baseColor: Color(layoutC.colorPalette['biru4']!),
                            highlightColor:
                                Color(layoutC.colorPalette['biru3']!),
                            child: Text(
                              "Task Management App",
                              style: TextStyle(
                                  color: Color(layoutC.colorPalette['biru4']!),
                                  fontSize: layoutC.screenHeight * 4,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: layoutC.screenHeight * 3,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: layoutC.screenHeight * 2.5),
                padding:
                    EdgeInsets.symmetric(horizontal: layoutC.screenWidth * 5),
                height: layoutC.screenHeight * 40,
                width: layoutC.screenWidth * 90,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFieldWidget.formTextField(
                        'insert_email'.tr, "Email", controller.email),
                    SizedBox(
                      height: layoutC.screenHeight * 2,
                    ),
                    Obx(
                      () => TextField(
                        autocorrect: false,
                        obscureText: controller.isObscure.value,
                        controller: controller.password,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'insert_password'.tr,
                          labelText: 'password'.tr,
                          suffixIcon: GestureDetector(
                            onTap: () => controller.isObscure.toggle(),
                            child: Icon(controller.isObscure.isTrue
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.toggle(),
                        title: Text('rememberMe'.tr),
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsets.only(left: 0),
                      ),
                    ),
                    ButtonWidget.submitButton(
                        layoutC.screenHeight * 1,
                        layoutC.screenWidth * 5,
                        layoutC.screenHeight * 2.5,
                        'login'.tr,
                        Color(layoutC.colorPalette['biru4']!), () {
                      controller.login(controller.email.text, controller.password.text, controller.rememberMe.value);
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pertanyaan_gak_punya_akun'.tr,
                          style: TextStyle(
                              color: Color(layoutC.colorPalette['biru4']!),
                              fontSize: layoutC.screenHeight * 2),
                        ),
                        TextButton(
                            onPressed: () => Get.toNamed(
                                  Routes.registerPage,
                                ),
                            child: Text(
                              'register'.tr,
                              style: TextStyle(
                                  color: Color(layoutC.colorPalette['biru4']!),
                                  fontSize: layoutC.screenHeight * 2,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
