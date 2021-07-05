import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/toolkit_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_Toolkit {
  // static String urls = url + 'datatemp';

  static List<Toolkit_Model> parseToolkit(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Toolkit_Model> get = list.map((model) => Toolkit_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Toolkit_Model>> fetchToolkit(int toolkit) async {
    // final prefs = await SharedPreferences.getInstance();
    // int id_user = prefs.getInt("id_user");
    final String urls = url + 'toolkit?pond=' + '$toolkit';

    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseToolkit, response.body);
    } else {
      return null;
    }
  }
}