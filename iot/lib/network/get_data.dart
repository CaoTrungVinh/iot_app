import 'package:dio/dio.dart';
import 'network.dart';

Dio dio = new Dio();

Future getDataTempAll() async {
  final String pathUrl = url + 'datatemp';
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