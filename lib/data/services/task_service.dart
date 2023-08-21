import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TaskService extends GetConnect{
  String url = "http://192.168.1.11:3000/api/";
  var box = GetStorage();
  

  Future<Response> addTask(String owner, String title, String category, String tenggatWaktu){
    var data = box.read('dataUser')as Map<String,dynamic>;
    var body = jsonEncode({
      'owner': owner,
      'title': title,
      'category': category,
      'tenggatWaktu': tenggatWaktu,
      'waktuSelesai': ""
    });
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': "Basic ${data['token']}"
    };
    var response = post("${url}task", body, headers: headers);
    return response;
  }

  Future<Response> getTaskUser(String idOwner){
    var data = box.read('dataUser')as Map<String,dynamic>;
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': "Basic ${data['token']}"
    };
    var response = get("${url}task/$idOwner", headers: headers);
    return response;
  }

  Future<Response> updateTaskUser(String id, String waktuSelesai, bool completed){
    var data = box.read('dataUser') as Map<String, dynamic>;
    var body = jsonEncode({
      'completed': completed,
      'waktuSelesai': waktuSelesai
    });
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': "Basic ${data['token']}"
    };
    var response = put("${url}task/$id", body, headers: headers);
    return response;
  }
}