import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/oxygen_fan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_Oxygen_Fan {

  static List<Oxygen_Fan_Model> parseOxy(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Oxygen_Fan_Model> get = list.map((model) => Oxygen_Fan_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Oxygen_Fan_Model>> fetchOxy({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    int id_toolkit = prefs.getInt("id_oxygen_fan");
    final String urls = url + 'oxygen_fan?id=' + '$id_toolkit';
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseOxy, response.body);
    } else {
      return null;
    }
  }
}