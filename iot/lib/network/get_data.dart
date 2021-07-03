import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

Dio dio = new Dio();

Future getPond() async {
  final prefs = await SharedPreferences.getInstance();
  int id_user = prefs.getInt("id_user");
  final String pathUrl = url + 'pond?user=' + '$id_user';
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions option) async {
    var headers = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    };
    option.headers.addAll(headers);
    return option.data;
  }));
  Response response = await dio.get(pathUrl);
  return response.data;
}
