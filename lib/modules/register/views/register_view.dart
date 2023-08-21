import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/modules/register/controllers/register_controller.dart';
import 'package:manajemen_tugas/widgets/button.dart';
import 'package:manajemen_tugas/widgets/shape.dart';
import 'package:manajemen_tugas/widgets/texfield.dart';

class RegisterPage extends GetView<RegisterController> {
  RegisterPage({super.key});
  final layoutC = Get.find<LayoutController>();
  final loginC = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: layoutC.screenHeight * 100,
        width: layoutC.screenWidth * 100,
        color: Color(layoutC.colorPalette['biru1']!),
        child: Stack(
          children: [
            CircleWidget.circlePositioned(
                layoutC.screenWidth * -20,
                layoutC.screenWidth * -20,
                layoutC.screenHeight * 40,
                Color(layoutC.colorPalette['biru3']!),
                Color(layoutC.colorPalette['biru2']!)),
            CircleWidget.circlePositioned(
                layoutC.screenWidth * 70,
                layoutC.screenHeight * 30,
                layoutC.screenHeight * 20,
                Color(layoutC.colorPalette['biru2']!),
                Color(layoutC.colorPalette['biru4']!)),
            CircleWidget.circlePositioned(
                layoutC.screenWidth * -35,
                layoutC.screenHeight * 40,
                layoutC.screenHeight * 30,
                Color(layoutC.colorPalette['biru2']!),
                Color(layoutC.colorPalette['biru4']!)),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: layoutC.screenHeight * 55,
                width: layoutC.screenWidth * 80,
                decoration: BoxDecoration(
                    color: Color(layoutC.colorPalette['biru1']!),
                    border: Border.all(
                      color: Color(layoutC.colorPalette['biru2']!),
                    ),
                    borderRadius:
                        BorderRadius.circular(layoutC.screenHeight * 1),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(5, 5),
                          blurRadius: 10)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'daftarkan_akun'.tr,
                      style: TextStyle(
                          color: Color(layoutC.colorPalette['biru4']!),
                          fontSize: layoutC.screenHeight * 3),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.formTextField(
                        'insert_email'.tr, "Email", controller.email),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.formTextField(
                        'insert_name'.tr, 'name'.tr, controller.name),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget.formTextField(
                        'insert_phone'.tr, 'phone'.tr, controller.phone),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget.submitButton(
                        layoutC.screenHeight * 1,
                        layoutC.screenWidth * 1,
                        layoutC.screenHeight * 2.5,
                        'register'.tr,
                        Color(layoutC.colorPalette['biru4']!),
                        () {
                          controller.registerUser(
                                controller.email.text,
                                controller.password.text,
                                controller.name.text,
                                controller.phone.text);
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'pertanyaan_punya_akun'.tr,
                          style: TextStyle(
                              color: Color(layoutC.colorPalette['biru4']!),
                              fontSize: layoutC.screenHeight * 2),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'login'.tr,
                            style: TextStyle(
                                color: Color(layoutC.colorPalette['biru4']!),
                                fontSize: layoutC.screenHeight * 2, fontWeight: FontWeight.bold),
                                
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
