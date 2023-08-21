// ignore_for_file: unnecessary_null_comparison

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:manajemen_tugas/data/services/task_service.dart';
import 'package:manajemen_tugas/modules/calendar/views/calendar_view.dart';
import 'package:manajemen_tugas/modules/home/views/dashboard_view.dart';
import 'package:manajemen_tugas/modules/profile/views/profile_view.dart';
import 'package:manajemen_tugas/widgets/button.dart';
import 'package:manajemen_tugas/widgets/texfield.dart';

class HomeController extends GetxController {
  // final dashC = Get.find<DashboardController>();
  var currentIndex = 0.obs;
  var previousIndex = RxInt(0);
  var isAnimating = false.obs;
  var selectedDate = Rx<DateTime>(DateTime.now());
  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  TextEditingController inputTask = TextEditingController();
  RxString kategori = "".obs;

  void changePage(int index) {
    previousIndex.value = currentIndex.value;
    currentIndex.value = index;
  }

  void addTask(Color backgroundColor, List<String> items) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFieldWidget.formTextField(
                'masukkan_tugas'.tr, 'masukkan_tugas'.tr, inputTask),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 180,
                  child: DropdownSearch<String>(
                    selectedItem: 'all'.tr,
                    clearButtonProps: const ClearButtonProps(
                      isVisible: false,
                    ),
                    popupProps: const PopupProps.menu(
                      constraints: BoxConstraints(maxHeight: 200),
                      showSelectedItems: true,
                    ),
                    items: items,
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'kategori'.tr,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 98, 97, 100),
                            fontSize: 10),
                      ),
                    ),
                    onChanged: (value) {
                      kategori.value = value!;
                      print(kategori.value);
                    },
                  ),
                ),
                Row(
                  children: [
                    Obx(() => Text(
                          dateFormat.format(selectedDate.value),
                          style: const TextStyle(
                              color: Color(0xFF113F67), fontSize: 14),
                        )),
                    IconButton(
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: Get.context!,
                            initialDate: selectedDate.value,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != selectedDate.value) {
                            selectedDate.value = picked;
                            print(selectedDate.value);
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Color(0xFF113F67),
                          size: 20,
                        )),
                  ],
                ),
              ],
            ),
            ButtonWidget.submitButton(
              8,
              16,
              16,
              'submit'.tr,
              const Color(0xFF113F67),
              () {
                var box = GetStorage();
                if (box.read('dataUser') != null) {
                  var data = box.read('dataUser') as Map<String, dynamic>;
                  TaskService().addTask(data['id'], inputTask.text, kategori.value, selectedDate.value.toString()).then((value){
                    // final newTask = TaskModel.FromJSON(value.body['data']);
                    // dashC.listTask.insert(0, newTask);
                    // dashC.listTask.refresh();
                  });
                }
                selectedDate.value = DateTime.now();
                Get.back();
              },
            ),
          ],
        ),
      ),
      exitBottomSheetDuration: const Duration(milliseconds: 100),
    ).then((value){
      inputTask.clear();
     selectedDate.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    currentIndex.value = 0;
    super.onClose();
  }
}

Widget getPage(int index) {
  switch (index) {
    case 0:
      return DashboardPage();
    case 1:
      return CalendarPage();
    case 2:
      return ProfilePage();
    default:
      return DashboardPage();
  }
}
