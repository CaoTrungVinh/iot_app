import 'package:dio/dio.dart';
import 'network.dart';

Dio dio = new Dio();

Future postDataTempWarning(double min, double max) async {
  final String paturl = url + 'warningtemp';
  dynamic data = {'temperature_min': min, 'temperature_max': max};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}