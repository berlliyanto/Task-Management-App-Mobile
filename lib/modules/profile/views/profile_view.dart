import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/home/controllers/home_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/modules/profile/controllers/profile_controller.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';
import 'package:manajemen_tugas/widgets/dialog.dart';
import 'package:pie_chart/pie_chart.dart';

class ProfilePage extends GetView<HomeController> {
  ProfilePage({super.key});
  final layoutC = Get.find<LayoutController>();
  final loginC = Get.find<LoginController>();
  final profileC = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: layoutC.screenWidth * 3, right: layoutC.screenWidth * 3),
      height: layoutC.screenHeight * 100,
      width: layoutC.screenWidth * 100,
      color: Color(layoutC.colorPalette['biru1']!),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: layoutC.screenHeight * 5.6,
            ),
            Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              height: layoutC.screenHeight * 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Color(layoutC.colorPalette['biru2']!).withOpacity(0.5),
                    radius: layoutC.screenHeight * 3.5,
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[200],
                      size: layoutC.screenHeight * 4,
                    ),
                  ),
                  SizedBox(
                    width: layoutC.screenWidth * 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profileC.name.value,
                        style: TextStyle(
                            color: Color(layoutC.colorPalette['biru4']!),
                            fontSize: layoutC.screenHeight * 2.5),
                      ),
                      Text(
                        profileC.email.value,
                        style: TextStyle(
                            color: Color(layoutC.colorPalette['biru4']!)
                                .withOpacity(0.8),
                            fontSize: layoutC.screenHeight * 1.5),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: layoutC.screenHeight * 4,
            ),
            Text(
              'ringkasan_tugas'.tr,
              style: TextStyle(
                  fontSize: layoutC.screenHeight * 3.5,
                  color: Color(
                    layoutC.colorPalette['biru4']!,
                  ),
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: layoutC.screenHeight * 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: layoutC.screenHeight * 15,
                    width: layoutC.screenWidth * 45,
                    decoration: BoxDecoration(
                        color: Color(layoutC.colorPalette['biru2']!),
                        borderRadius:
                            BorderRadius.circular(layoutC.screenHeight * 2)),
                  ),
                  Container(
                    height: layoutC.screenHeight * 15,
                    width: layoutC.screenWidth * 45,
                    decoration: BoxDecoration(
                        color: Color(layoutC.colorPalette['biru2']!),
                        borderRadius:
                            BorderRadius.circular(layoutC.screenHeight * 2)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: layoutC.screenHeight * 3),
              padding: EdgeInsets.all(layoutC.screenHeight * 2),
              height: layoutC.screenHeight * 30,
              decoration: BoxDecoration(
                color: Color(layoutC.colorPalette['biru2']!),
                borderRadius: BorderRadius.circular(layoutC.screenHeight * 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'klasifikasi_tugas'.tr,
                        style: TextStyle(
                            color: Color(layoutC.colorPalette['biru1']!),
                            fontSize: layoutC.screenHeight * 3,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: layoutC.screenHeight * 3,
                  ),
                  PieChart(
                    dataMap: profileC.dataMapPie,
                    animationDuration: const Duration(milliseconds: 800),
                    chartLegendSpacing: layoutC.screenWidth * 20,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    colorList: profileC.colorListPie,
                    initialAngleInDegree: 0,
                    chartType: ChartType.ring,
                    ringStrokeWidth: layoutC.screenHeight * 4,
                    centerText: "Task",
                    legendOptions: const LegendOptions(
                      showLegendsInRow: false,
                      legendPosition: LegendPosition.right,
                      showLegends: true,
                      legendShape: BoxShape.circle,
                      legendTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValueBackground: true,
                      showChartValues: true,
                      showChartValuesInPercentage: false,
                      showChartValuesOutside: false,
                      decimalPlaces: 1,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'pengaturan'.tr,
                style: TextStyle(
                  fontSize: layoutC.screenHeight * 2,
                  color: Color(layoutC.colorPalette['biru4']!),
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: Color(layoutC.colorPalette['biru4']!),
              ),
              onTap: () => Get.toNamed(Routes.settingPage),
            ),
            ListTile(
              title: Text(
                'about'.tr,
                style: TextStyle(
                  fontSize: layoutC.screenHeight * 2,
                  color: Color(layoutC.colorPalette['biru4']!),
                ),
              ),
              leading: Icon(
                Icons.info,
                color: Color(layoutC.colorPalette['biru4']!),
              ),
            ),
            ListTile(
              title: Text(
                'logout'.tr,
                style: TextStyle(
                  fontSize: layoutC.screenHeight * 2,
                  color: Color(layoutC.colorPalette['biru4']!),
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Color(layoutC.colorPalette['biru4']!),
              ),
              onTap: () {
                DialogWidget.dialogAlert(
                  'logout'.tr,
                  'yakin_keluar'.tr,
                  'yes'.tr,
                  'no'.tr,
                  () {
                    controller.currentIndex.value =0;
                    loginC.email.clear();
                    loginC.password.clear();
                    Get.back();
                    loginC.logout();
                  },
                  () {
                    Get.back();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
