import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

Dio dio = new Dio();

Future token_fcm() async {
  final prefs = await SharedPreferences.getInstance();
  int user = prefs.getInt("id_user");
  String tokens = prefs.getString("token_fcm");
  final String paturl = url + 'token_fcm';
  dynamic data = {'id_user': user, 'token_fcm': tokens};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}