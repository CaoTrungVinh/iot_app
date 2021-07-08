import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/ph_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network.dart';

class Request_Ph {

  static List<PH_Model> parsePh(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<PH_Model> get = list.map((model) => PH_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<PH_Model>> fetchPh({int page = 1}) async {
    final prefs = await SharedPreferences.getInstance();
    int id_toolkit = prefs.getInt("id_ph");
    final String urls = url + 'ph?id=' + '$id_toolkit';

    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parsePh, response.body);
    } else {
      return null;
    }
  }
}