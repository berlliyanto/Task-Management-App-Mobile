import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/home/controllers/dashboard_controller.dart';
import 'package:manajemen_tugas/modules/home/controllers/home_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/widgets/dialog.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final layoutC = Get.find<LayoutController>();
  final loginC = Get.find<LoginController>();
  final dashC = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DialogWidget.dialogAlert(
          'logout'.tr,
          'yakin_keluar'.tr,
          'yes'.tr,
          'no'.tr,
          () {
            controller.currentIndex.value = 0;
            loginC.email.clear();
            loginC.password.clear();
            Get.back();
            loginC.logout();
          },
          () {
            Get.back();
          },
        );
        return false;
      },
      child: Scaffold(
        body: Obx(() {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(
                      controller.previousIndex.value <
                              controller.currentIndex.value
                          ? 1.0
                          : -1.0,
                      0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
            child: getPage(controller.currentIndex.value),
          );
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: Color(layoutC.colorPalette['biru4']!),
            fixedColor: Color(layoutC.colorPalette['biru1']!),
            currentIndex: controller.currentIndex.value,
            unselectedItemColor: Color(layoutC.colorPalette['biru2']!),
            onTap: controller.changePage,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.assignment,
                ),
                label: 'task'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.calendar_today,
                ),
                label: 'calendar'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: 'profile'.tr,
              ),
            ],
          ),
        ),
        floatingActionButton: Obx(() => (controller.currentIndex.value <= 1)
            ? FloatingActionButton(
                onPressed: () =>
                    controller.addTask(Color(layoutC.colorPalette['biru1']!), dashC.categoryNames.toList()),
                backgroundColor: Color(layoutC.colorPalette['biru4']!),
                child: Icon(Icons.add, size: layoutC.screenHeight * 3),
              )
            : const SizedBox.shrink()),
      ),
    );
  }
}
