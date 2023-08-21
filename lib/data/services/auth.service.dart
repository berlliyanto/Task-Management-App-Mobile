// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetConnect {
  String url = "http://192.168.1.11:3000/api/";
  Future<Response> login(String email, String password) async {
    var response = await post(
      "${url}login",
      {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      return response;
    }
  }

  Future<Response> register(
      String email, String password, String name, String phone) {
    final body = jsonEncode(
        {'name': name, 'password': password, 'email': email, 'phone': phone});
    var response = post("${url}register", body);
    print(response);
    return response;
  }

  Future<Response> changePassword(String id, String password) {
    final box = GetStorage();
    final data = box.read('dataUser') as Map<String, dynamic>;
    final body = jsonEncode({'password': password});
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${data['token']}'
    };
    var response = post("${url}user/$id", body, headers: headers);
    return response;
  }
}
