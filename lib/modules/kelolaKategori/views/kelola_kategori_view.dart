import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/home/controllers/dashboard_controller.dart';
import 'package:manajemen_tugas/widgets/listile.dart';

class KelolaKategoriPage extends StatelessWidget {
  KelolaKategoriPage({super.key});
  final layoutC = Get.find<LayoutController>();
  final dashC = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(layoutC.colorPalette['biru1']!),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Color(layoutC.colorPalette['biru4']!),
          ),
        ),
        backgroundColor: Color(layoutC.colorPalette['biru1']!),
        elevation: 0,
        title: Text(
          'kelola_kategori'.tr,
          style: TextStyle(
            fontSize: layoutC.screenHeight * 2.5,
            color: Color(layoutC.colorPalette['biru4']!),
          ),
        ),
      ),
      body: Container(
        height: layoutC.screenHeight * 100,
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: dashC.categoryNames.length - 1,
                    itemBuilder: (context, index) {
                      return ListTileWidget.listtileCategory(
                          dashC.categoryNames[index + 1],
                          dashC.categoryNames.length,
                          layoutC.screenHeight * 2.3,
                          layoutC.screenHeight * 2.5,
                          Color(layoutC.colorPalette['biru4']!),
                          () {
                            dashC.editCategory(index, dashC.categoryNames[index+1]);
                          }, () {
                        dashC.deleteCategory(index);
                      });
                    },
                  )),
            ),
            Text(
              'hapus_kategori_seret'.tr,
              style: TextStyle(
                  color: Color(
                    layoutC.colorPalette['biru4']!,
                  ),
                  fontSize: layoutC.screenHeight * 2),
            ),
            SizedBox(
              height: layoutC.screenHeight * 3,
            ),
            ListTile(
              tileColor: Color(layoutC.colorPalette['biru2']!),
              leading: Icon(
                Icons.add,
                size: layoutC.screenHeight * 3,
                color: Color(layoutC.colorPalette['biru4']!),
              ),
              title: Text(
                'tambah_kategori'.tr,
                style: TextStyle(
                    color: Color(
                      layoutC.colorPalette['biru4']!,
                    ),
                    fontSize: layoutC.screenHeight * 2.5),
              ),
              onTap: () => dashC.showDialogAddCategory(),
            )
          ],
        ),
      ),
    );
  }
}
