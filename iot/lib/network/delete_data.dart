import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

Dio dio = new Dio();

Future delete_token() async {
  final prefs = await SharedPreferences.getInstance();
  String tokens = prefs.getString("token_fcm");

  final String paturl = url + 'delete_fcm';
  dynamic data = {'token_fcm': tokens};
  var response = await dio.delete(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}