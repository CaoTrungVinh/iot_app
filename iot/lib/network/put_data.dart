import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

Dio dio = new Dio();

Future setAutoTemp(int id, int auto_control) async {
  final prefs = await SharedPreferences.getInstance();
  final String paturl = url + 'setAutoTemp?id=' + '$id';

  dynamic data = {'auto_control': auto_control};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
Future setAutoPh(int id, int auto_control) async {
  final prefs = await SharedPreferences.getInstance();
  final String paturl = url + 'setAutoPh?id=' + '$id';

  dynamic data = {'auto_control': auto_control};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
Future setAutoLight(int id, int auto_control) async {
  final prefs = await SharedPreferences.getInstance();
  final String paturl = url + 'setAutoLight?id=' + '$id';

  dynamic data = {'auto_control': auto_control};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setTempWarning(double min, double max) async {
  final prefs = await SharedPreferences.getInstance();
  int id_toolkit = prefs.getInt("id_temp");
  final String paturl = url + 'setWarningTemp?id=' + '$id_toolkit';

  dynamic data = {'temperature_min': min, 'temperature_max': max};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setPhWarning(double min, double max) async {
  final prefs = await SharedPreferences.getInstance();
  int id_toolkit = prefs.getInt("id_ph");
  final String paturl = url + 'setWarningPh?id=' + '$id_toolkit';

  dynamic data = {'ph_min': min, 'ph_max': max};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setTempWarning_OnOff(int warning) async {
  final prefs = await SharedPreferences.getInstance();
  int id_toolkit = prefs.getInt("id_temp");
  final String paturl = url + 'setWarningTemp_onoff?id=' + '$id_toolkit';

  dynamic data = {'warning': warning};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setPhWarning_OnOff(int warning) async {
  final prefs = await SharedPreferences.getInstance();
  int id_toolkit = prefs.getInt("id_ph");
  final String paturl = url + 'setWarningPh_onoff?id=' + '$id_toolkit';

  dynamic data = {'warning': warning};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setLightWarning_OnOff(int warning) async {
  final prefs = await SharedPreferences.getInstance();
  int id_toolkit = prefs.getInt("id_light");
  final String paturl = url + 'setWarningLight_onoff?id=' + '$id_toolkit';

  dynamic data = {'warning': warning};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setPumpIn_OnOff(int status) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_pump_in");
  final String paturl = url + 'setPumpIn_onoff?id=' + '$id_control';

  dynamic data = {'status': status};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setPumpOut_OnOff(int status) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_pump_out");
  final String paturl = url + 'setPumpOut_onoff?id=' + '$id_control';

  dynamic data = {'status': status};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setLamp_OnOff(int status) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_lamp");
  final String paturl = url + 'setLamp_onoff?id=' + '$id_control';

  dynamic data = {'status': status};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future setOxygen_OnOff(int status) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_oxygen_fan");
  final String paturl = url + 'setOxygen_fan_onoff?id=' + '$id_control';

  dynamic data = {'status': status};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}

Future set_timer_pump_in(String timer_on,String timer_off) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_pump_in");
  final String paturl = url + 'set_timer_pump_in?id=' + '$id_control';

  dynamic data = {'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
Future set_timer_pump_out(String timer_on,String timer_off) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_pump_out");
  final String paturl = url + 'set_timer_pump_out?id=' + '$id_control';

  dynamic data = {'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
Future set_timer_lamp(String timer_on,String timer_off) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_lamp");
  final String paturl = url + 'set_timer_lamp?id=' + '$id_control';

  dynamic data = {'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}
Future set_timer_oxygen_fan(String timer_on,String timer_off) async {
  final prefs = await SharedPreferences.getInstance();
  int id_control = prefs.getInt("id_oxygen_fan");
  final String paturl = url + 'set_timer_oxygen_fan?id=' + '$id_control';

  dynamic data = {'timer_on': timer_on, 'timer_off': timer_off};
  var response = await dio.put(paturl,
      data: data,
      options: Options(
          headers: {'Content-type': 'application/json; charset=UTF-8'}));
  return response.data;
}