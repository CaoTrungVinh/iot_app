import 'package:dio/dio.dart';
import 'network.dart';

Dio dio = new Dio();

Future set_warning_temp(int warning) async {
  final String paturl = url + 'set_warning_temp';
  dynamic data = {'warning_id': warning};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
