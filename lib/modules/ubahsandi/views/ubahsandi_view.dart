import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/modules/ubahsandi/controllers/ubahsandi_controller.dart';
import 'package:manajemen_tugas/widgets/button.dart';

class UbahSandiPage extends GetView<UbahSandiController> {
  UbahSandiPage({super.key});
  final layoutC = Get.find<LayoutController>();
  final loginC = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: layoutC.screenHeight * 100,
        width: layoutC.screenWidth * 100,
        color: Color(layoutC.colorPalette['biru1']!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: layoutC.screenHeight * 5.6,
              ),
              height: layoutC.screenHeight * 50,
              width: layoutC.screenWidth * 100,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          size: layoutC.screenHeight * 3,
                          color: Color(layoutC.colorPalette['biru4']!),
                        ),
                      ),
                      Text(
                        'password'.tr,
                        style: TextStyle(
                          fontSize: layoutC.screenHeight * 2.5,
                          color: Color(layoutC.colorPalette['biru4']!),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: layoutC.screenWidth * 5,
                        vertical: layoutC.screenHeight * 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'current_pw'.tr,
                          style: TextStyle(
                              color: Color(layoutC.colorPalette['biru4']!),
                              fontSize: layoutC.screenHeight * 2),
                        ),
                        SizedBox(
                          height: layoutC.screenHeight * 1,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            obscureText: controller.isObsucreCurrent.value,
                            controller: controller.currentPW,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'current_pw'.tr,
                              labelText: 'current_pw'.tr,
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.isObsucreCurrent.toggle(),
                                child: Icon(controller.isObsucreCurrent.isTrue
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: layoutC.screenWidth * 5,
                        vertical: layoutC.screenHeight * 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'new_pw'.tr,
                          style: TextStyle(
                              color: Color(layoutC.colorPalette['biru4']!),
                              fontSize: layoutC.screenHeight * 2),
                        ),
                        SizedBox(
                          height: layoutC.screenHeight * 1,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            obscureText: controller.isObsucreNew.value,
                            controller: controller.newPW,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'new_pw'.tr,
                              labelText: 'new_pw'.tr,
                              suffixIcon: GestureDetector(
                                onTap: () => controller.isObsucreNew.toggle(),
                                child: Icon(controller.isObsucreNew.isTrue
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: layoutC.screenWidth * 5,
                        vertical: layoutC.screenHeight * 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'confirm_pw'.tr,
                          style: TextStyle(
                              color: Color(layoutC.colorPalette['biru4']!),
                              fontSize: layoutC.screenHeight * 2),
                        ),
                        SizedBox(
                          height: layoutC.screenHeight * 1,
                        ),
                        Obx(
                          () => TextField(
                            autocorrect: false,
                            obscureText: controller.isObsucreConfirm.value,
                            controller: controller.confirmPW,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'confirm_pw'.tr,
                              labelText: 'confirm_pw'.tr,
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.isObsucreConfirm.toggle(),
                                child: Icon(controller.isObsucreConfirm.isTrue
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget.submitButton(
              layoutC.screenHeight * 1,
              layoutC.screenWidth * 10,
              layoutC.screenHeight * 2.5,
              'done'.tr,
              Color(layoutC.colorPalette['biru4']!),
              () => controller.changePassword(controller.currentPW.text,
                  controller.newPW.text, controller.confirmPW.text, loginC.isAutoLogin.value),
            )
          ],
        ),
      ),
    );
  }
}
