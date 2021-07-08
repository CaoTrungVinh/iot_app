import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/pump_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_PumpIn {

  static List<PumpIn_Model> parsePumpIn(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<PumpIn_Model> get = list.map((model) => PumpIn_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<PumpIn_Model>> fetchPumpIn({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    int id_control = prefs.getInt("id_pump_in");
    final String urls = url + 'pump_in?id=' + '$id_control';
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parsePumpIn, response.body);
    } else {
      return null;
    }
  }
}