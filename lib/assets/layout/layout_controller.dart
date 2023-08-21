import 'package:get/get.dart';

class LayoutController extends GetxController{
  //RESPONSIVE LAYOUT
  double get screenWidth => Get.width / 100;
  double get screenHeight => Get.height / 100;
  bool get isSmallScreen => screenWidth < 600;

 final Map<String, int> colorPalette = {
    'biru1': 0xFFF3F9FB,
    'biru2': 0xFF87C0CD,
    'biru3': 0xFF226597,
    'biru4': 0xFF113F67,
  };

  void updateColor(){
    update();
  }
}