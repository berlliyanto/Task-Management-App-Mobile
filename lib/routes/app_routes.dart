import 'package:get/get.dart';
import 'package:manajemen_tugas/modules/home/views/home_view.dart';
import 'package:manajemen_tugas/modules/kelolaKategori/views/kelola_kategori_view.dart';
import 'package:manajemen_tugas/modules/login/views/login_view.dart';
import 'package:manajemen_tugas/modules/register/bindings/register_binding.dart';
import 'package:manajemen_tugas/modules/register/views/register_view.dart';
import 'package:manajemen_tugas/modules/setting/bindings/setting_binding.dart';
import 'package:manajemen_tugas/modules/setting/views/setting_view.dart';
import 'package:manajemen_tugas/modules/ubahsandi/bindings/ubahsandi_binding.dart';
import 'package:manajemen_tugas/modules/ubahsandi/views/ubahsandi_view.dart';
import 'package:manajemen_tugas/routes/app_pages.dart';

class AppPage {
  static final pageRoute = [
    GetPage(name: Routes.loginPage, page: ()=> LoginPage()),
    GetPage(name: Routes.registerPage, page: ()=>RegisterPage(), binding: RegisterBinding()),
    GetPage(name: Routes.homePage, page: ()=>HomePage()),
    GetPage(name: Routes.settingPage, page: ()=>SettingPage(), binding: SettingBinding()),
    GetPage(name: Routes.ubahsandiPage, page: ()=>UbahSandiPage(), binding: UbahSandiBinding()),
    GetPage(name: Routes.kelolakategoriPage, page: ()=>KelolaKategoriPage()),
  ];
}