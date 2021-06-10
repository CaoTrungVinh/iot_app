import 'package:dio/dio.dart';
import 'network.dart';

Dio dio = new Dio();

Future getDataTempLast() async {
  final String pathUrl = url + 'datatemplast';
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

Future getDataPhLast() async {
  final String pathUrl = url + 'dataphlast';
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

Future getDataLightLast() async {
  final String pathUrl = url + 'datalightlast';
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

Future getDataTempSafeLast() async {
  final String pathUrl = url + 'temp_safe';
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

Future getDataPhSafeLast() async {
  final String pathUrl = url + 'ph_safe';
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

Future getPumpIn() async {
  final String pathUrl = url + 'get_pump_in';
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

Future getPumpOut() async {
  final String pathUrl = url + 'get_pump_out';
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

Future getLamp() async {
  final String pathUrl = url + 'get_lamp';
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

Future get_oxygen_fan() async {
  final String pathUrl = url + 'get_oxygen_fan';
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