import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/pump_out_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_PumpOut {

  static List<PumpOut_Model> parsePumpOut(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<PumpOut_Model> get = list.map((model) => PumpOut_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<PumpOut_Model>> fetchPumpOut({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    int id_control = prefs.getInt("id_pump_out");
    final String urls = url + 'pump_out?id=' + '$id_control';
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parsePumpOut, response.body);
    } else {
      return null;
    }
  }
}