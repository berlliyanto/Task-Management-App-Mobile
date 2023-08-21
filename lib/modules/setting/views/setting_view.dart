import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/setting/controllers/setting_controller.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';
import 'package:manajemen_tugas/widgets/listile.dart';

class SettingPage extends GetView<SettingController> {
  SettingPage({super.key});
  final layoutC = Get.find<LayoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: layoutC.screenHeight * 100,
        width: layoutC.screenWidth * 100,
        color: Color(layoutC.colorPalette['biru1']!),
        child: Column(
          children: [
            SizedBox(
              height: layoutC.screenHeight * 5.6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: layoutC.screenHeight * 2.5,
                    color: Color(layoutC.colorPalette['biru4']!),
                  ),
                ),
                Text(
                  'pengaturan'.tr,
                  style: TextStyle(
                    fontSize: layoutC.screenHeight * 2.5,
                    color: Color(layoutC.colorPalette['biru4']!),
                  ),
                ),
              ],
            ),
            Container(
              height: layoutC.screenHeight * 88,
              width: layoutC.screenWidth * 100,
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTileWidget.listtileSettings(
                        'ubah_password'.tr,
                        Icons.password,
                        layoutC.screenHeight * 2,
                        layoutC.screenHeight * 2.5,
                        Color(layoutC.colorPalette['biru4']!),
                        () => Get.toNamed(Routes.ubahsandiPage)),
                    ListTileWidget.listtileSettings(
                      'ubah_bahasa'.tr,
                      Icons.language,
                      layoutC.screenHeight * 2,
                      layoutC.screenHeight * 2.5,
                      Color(layoutC.colorPalette['biru4']!),
                      () => controller.showDialogLang(
                        layoutC.screenHeight * 2,
                        Color(layoutC.colorPalette['biru4']!),
                      ),
                    ),
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
