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

Future postDataPhWarning(double min, double max) async {
  final String paturl = url + 'warningph';
  dynamic data = {'ph_min': min, 'ph_max': max};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future postPumpIn_On_Off(int control, String description, String created_at) async {
  final String paturl = url + 'on_off_pumpin';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future postPumpOut_On_Off(int control, String description, String created_at) async {
  final String paturl = url + 'on_off_pumpout';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future postLamp_On_Off(int control, String description, String created_at) async {
  final String paturl = url + 'on_off_lamp';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future postOxygen_fan_On_Off(int control, String description, String created_at) async {
  final String paturl = url + 'on_off_oxygen_fan';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future Timer_Device_PumpIn_On_Off(int control, String description, String created_at, String timer_on, String timer_off) async {
  final String paturl = url + 'timer_on_off_pumpin';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at, 'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future Timer_Device_PumpOut_On_Off(int control, String description, String created_at, String timer_on, String timer_off) async {
  final String paturl = url + 'timer_on_off_pumpout';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at, 'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future Timer_Device_Lamp_On_Off(int control, String description, String created_at, String timer_on, String timer_off) async {
  final String paturl = url + 'timer_on_off_lamp';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at, 'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future Timer_Device_Oxygen_Fan_On_Off(int control, String description, String created_at, String timer_on, String timer_off) async {
  final String paturl = url + 'timer_on_off_oxygen_fan';
  dynamic data = {'control': control, 'description': description, 'created_at': created_at, 'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.post(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

