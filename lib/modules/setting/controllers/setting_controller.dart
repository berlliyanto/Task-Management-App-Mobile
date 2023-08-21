import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  RxInt indexBahasa = 0.obs;

  void showDialogLang(double fontSize, Color fontColor) {
    Get.defaultDialog(
      title: 'bahasa'.tr,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => RadioListTile<int>(
                title: Text('inggris'.tr),
                value: 0,
                groupValue: indexBahasa.value,
                onChanged: (value) {
                  indexBahasa.value = value!;
                },
              ),
            ),
            Obx(() => RadioListTile<int>(
                  title: Text('indonesia'.tr),
                  value: 1,
                  groupValue: indexBahasa.value,
                  onChanged: (value) {
                    indexBahasa.value = value!;
                  },
                )),
          ],
        ),
      ),
      onConfirm: () {
        changeBahasa();
        Get.back();
      },
    );
  }

  void changeBahasa() {
    switch (indexBahasa.value) {
      case 0:
        Get.updateLocale(const Locale('en'));
        break;
      case 1:
        Get.updateLocale(const Locale('id'));
        break;
      default:
        Get.updateLocale(const Locale('en'));
    }
  }
}
