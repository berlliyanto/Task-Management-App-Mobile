import 'package:get/get.dart';

class TranslationApp extends Translations{
  @override
  // Map<String, Map<String, String>> get keys => throw UnimplementedError();
  // 'title': 'Hello %s lagi %s', // %s adalah Arguments
  Map<String, Map<String, String>> get keys => {
    'en' :{
      //Login
      'rememberMe': 'Remember Me',
      'login': 'Login',
      'pertanyaan_gak_punya_akun': 'Dont Have Account?',
      'register': 'Register',
      'password': 'Password',
      'insert_email': 'Insert Email',
      'insert_password': 'Insert Password',
      'insert_phone': 'Insert Phone Number',
      'insert_name': 'Insert Name',
      //Alert
      'not_email': 'Email is Not Valid!',
      'email_password_salah': 'Email or Password is Incorrect!',
      'field_empty': 'All Field Must Be Filled!',
      'terjadi_kesalahan': 'Something Wrong',
      'password_tidak_sesuai': 'Password Not Correct',
      'konfirmasi_password': 'Please Confirm Password Correctly',
      'gunakan_password_berbeda': 'Please Use New Password',
      'sukses': 'Success',
      'password_berhasil_diubah': 'Password Changed Succesfully',
      //Register
      'daftarkan_akun': 'Register New Account!',
      'name': 'Name',
      'phone': 'Number Phone',
      'pertanyaan_punya_akun': 'Already Have an Account?',
      //NavigasiBar
      'home': 'Home',
      'task': 'Tasks',
      'calendar': 'Calendar',
      'profile': 'Profile',
      //Dialog
      'yes': 'Yes',
      'no': 'No',
      'logout': 'Logout',
      'yakin_keluar': 'Are You Sure Want To Logout?',
      //Halaman Profile
      'ringkasan_tugas': 'Task Summary',
      'klasifikasi_tugas': 'Task Classification',
      'pengaturan': 'Settings',
      'about': 'About',
      //Halaman Pengaturan
      'ubah_password': 'Change Password',
      'ubah_bahasa': 'Change Languange',
      'bahasa': 'Languange',
      //Bahasa
      'indonesia': 'Indonesian',
      'inggris': 'English',
      //Ubah Sandi
      'current_pw': 'Current Password',
      'new_pw': 'New Password',
      'confirm_pw': 'Confirm Password',
      'done': 'Done',
      //Tambah Tugas
      'masukkan_tugas': 'Input New Task',
      'pilih_kategori': 'Choose Category',
      'kategori': 'Category',
      'submit': 'Submit',
      //Menu Kategori
      'kelola_kategori': 'Manage Category',
      'telusuri': 'Search',
      'all': 'All',
      //Kelola Kategori
      'hapus_kategori_seret': 'Slide Left to Delete Category',
      'tambah_kategori': 'Add New Category',
      'masukkan_kategori_baru': 'Insert New Category',
      'buat_kategori_baru': 'Create New Category',
      'ubah_kategori': 'Edit Category',
    },
    'id' :{
      //Login
      'rememberMe': 'Ingat Saya',
      'login': 'Masuk',
      'pertanyaan_gak_punya_akun': 'Belum Punya Akun?',
      'register': 'Mendaftar',
      'password': 'Kata Sandi',
      'insert_email': 'Masukkan Email',
      'insert_password': 'Masukkan Kata Sandi',
      'insert_phone': 'Masukkan Nomor Ponsel',
      'insert_name': 'Masukkan Nama',
      //Alert
      'not_email': 'Email Tidak Valid!',
      'email_password_salah': 'Email atau Password Salah!',
      'field_empty': 'Semua Data Harus Diisi!',
      'terjadi_kesalahan': 'Terjadi Kesalahan',
      'password_tidak_sesuai': 'Kata Sandi Tidak Sesuai',
      'konfirmasi_password': 'Mohon Konfirmasi Kata Sandi Dengan Benar',
      'gunakan_password_berbeda': 'Gunakan Kata Sandi Yang Baru',
      'sukses': 'Sukses',
      'password_berhasil_diubah': 'Kata Sandi Berhasil Diubah',
      //Register
      'daftarkan_akun': 'Daftarkan Akun Baru!',
      'name': 'Nama',
      'phone': 'Nomor Ponsel',
      'pertanyaan_punya_akun': 'Sudah Memiliki Akun?',
      //NavigasiBar
      'home': 'Rumah',
      'task': 'Tugas',
      'calendar': 'Kalender',
      'profile': 'Profil',
      //Dialog
      'yes': 'Ya',
      'no': 'Tidak',
      'logout': 'Keluar',
      'yakin_keluar': 'Anda Yakin Mau Keluar?',
      //Halaman Profile
      'ringkasan_tugas': 'Ringkasan Tugas',
      'klasifikasi_tugas': 'Klasifikasi Tugas',
      'pengaturan': 'Pengaturan',
      'about': 'Tentang',
      //Halaman Pengaturan
      'ubah_password': 'Ganti Kata Sandi',
      'ubah_bahasa': 'Ganti Bahasa',
      'bahasa': 'Bahasa',
      //Bahasa
      'indonesia': 'Indonesia',
      'inggris': 'Inggris',
      //Ubah Sandi
      'current_pw': 'Kata Sandi Sekarang',
      'new_pw': 'Kata Sandi Baru',
      'confirm_pw': 'Konfirmasi Kata Sandi',
      'done': 'Selesai',
      //Tambah Tugas
      'masukkan_tugas': 'Masukkan Tugas Baru',
      'pilih_kategori': 'Pilih Kategori',
      'kategori': 'Kategori',
      'submit': 'Simpan',
      //Menu Kategori
      'kelola_kategori': 'Kelola Kategori',
      'telusuri': 'Telusuri',
      'all': 'Semua',
      //Kelola Kategori
      'hapus_kategori_seret': 'Geser Ke Kiri Kategori Untuk Hapus',
      'tambah_kategori': 'Tambah Kategori Baru',
      'masukkan_kategori_baru': 'Masukkan Kategori Baru',
      'buat_kategori_baru': 'Buat Kategori Baru',
      'ubah_kategori': 'Ubah Kategori',
    },
  };

}