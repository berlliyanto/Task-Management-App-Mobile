import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:manajemen_tugas/assets/layout/layout_controller.dart';
import 'package:manajemen_tugas/modules/home/controllers/home_controller.dart';
import 'package:manajemen_tugas/modules/login/controllers/login_controller.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';
import 'package:manajemen_tugas/routes/app_routes.dart';
import 'package:manajemen_tugas/routes/page_not_found.dart';
import 'package:manajemen_tugas/utils/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final layoutC = Get.put(LayoutController());
  final homeC = Get.put(HomeController());
  final loginC = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.pageRoute,
      initialRoute: Routes.loginPage,
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 800),
      translations: TranslationApp(),
      locale: const Locale('en'),
      unknownRoute: GetPage(name: '/404', page: () => const PageNotFound()),
    );
  }
}
