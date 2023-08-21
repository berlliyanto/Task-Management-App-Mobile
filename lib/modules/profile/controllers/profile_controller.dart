import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  RxString name = "".obs;
  RxString email = "".obs;

  Future<void> getProfile() async {
    final box = GetStorage();
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      name.value = data['name'];
      email.value = data['email'];
    } else {
      name.value = "Kamu Belum Login";
      email.value = "Klik Untuk Login";
    }
  }

  final Map<String, double>dataMapPie = {
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
  };

  final List<Color> colorListPie = [
    const Color.fromARGB(255, 5, 1, 236),
    const Color.fromARGB(255, 9, 62, 74),
    const Color.fromARGB(255, 12, 136, 231),
    const Color.fromARGB(255, 2, 16, 29),
  ];

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
