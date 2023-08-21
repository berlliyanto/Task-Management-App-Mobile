import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manajemen_tugas/data/models/task_model.dart';
import 'package:manajemen_tugas/data/services/task_service.dart';
import 'package:manajemen_tugas/widgets/texfield.dart';

class DashboardController extends GetxController with StateMixin<List<TaskModel>> {
  //VARIABEL
  late Timer timer;
  TextEditingController kategori = TextEditingController();
  late TextEditingController editkategori;
  RxDouble depthNeumorphic = 10.0.obs;
  ScrollController scrollController = ScrollController();
  var selectedCategoryIndex = 0.obs;
  var isMenuVisible = false.obs;
  List<String> categoryNames = [
    "All",
  ].obs;
  RxList<TaskModel> listTask = <TaskModel>[].obs;

  //Tambah Kategori Baru
  void showDialogAddCategory() {
    Get.defaultDialog(
      title: 'buat_kategori_baru'.tr,
      content: TextFieldWidget.formTextField(
          'masukkan_kategori_baru'.tr, 'masukkan_kategori_baru'.tr, kategori),
      onConfirm: () {
        categoryNames.add(kategori.text);
        kategori.clear();
        Get.back();
      },
      onCancel: () {},
    );
  }

  //Hapus Kategori
  void deleteCategory(int index) {
    if (index >= 0 && index < categoryNames.length) {
      categoryNames.removeAt(index + 1);
      print('Element at index $index removed.');
    } else {
      print('Invalid index.');
    }
  }

  //Edit Kategori
  void editCategory(int index, String currentCategory) {
    editkategori.text = currentCategory;
    Get.defaultDialog(
      title: 'edit_kategori'.tr,
      content: TextFieldWidget.formTextField('masukkan_kategori_baru'.tr,
          'masukkan_kategori_baru'.tr, editkategori),
      onConfirm: () {
        if (index >= 0 && index < categoryNames.length) {
          categoryNames[index + 1] = editkategori.text; 
          print('Element at index $index edited.');
        } else {
          print('Invalid index.');
        }
        Get.back();
      },
      onCancel: () {},
    );
  }

  //Get User Task
  void getUserTask() {
    try {
      var box = GetStorage();
      if (box.read('dataUser') != null) {
        var data = box.read('dataUser') as Map<String, dynamic>;
        TaskService().getTaskUser(data['id']).then((value){
          final responseData = value.body['data'];
          if (responseData is List) {
            listTask.assignAll(responseData.map((taskData) => TaskModel.FromJSON(taskData)));
            change(listTask, status: RxStatus.success());
          } else {
            change(null, status: RxStatus.empty());
          }
        });
      }
    } catch (e) {
      change(null,status: RxStatus.empty());
    }
  }

  //FUNCTION Layout
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  void scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels == 0) {
        depthNeumorphic.value = -10;
        print(scrollController.position.pixels);
      } else {
        depthNeumorphic.value = 10;
        print(scrollController.position.pixels);
      }
    }
  }

  void toggleMenu() {
    isMenuVisible.value = !isMenuVisible.value;
  }

  //LIFECYCLE
  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    editkategori = TextEditingController();
    scrollController.addListener(scrollListener);
    getUserTask();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      getUserTask();
     });
    super.onInit();
  }

  @override
  void dispose() {
    editkategori.clear();
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    if(timer.isActive) timer.cancel();
    super.dispose();
  }
}
