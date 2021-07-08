import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/lamp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_Lamp {

  static List<Lamp_Model> parseLamp(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Lamp_Model> get = list.map((model) => Lamp_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Lamp_Model>> fetchLamp({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    int id_control = prefs.getInt("id_lamp");
    final String urls = url + 'lamp?id=' + '$id_control';
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseLamp, response.body);
    } else {
      return null;
    }
  }
}