import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/pond_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class Request_Pond {
  // static String urls = url + 'datatemp';

  static List<Pond_Model> parsePond(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Pond_Model> get = list.map((model) => Pond_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Pond_Model>> fetchPond() async {
    final prefs = await SharedPreferences.getInstance();
    int id_user = prefs.getInt("id_user");
    final String urls = url + 'pond?user=' + '$id_user';
    // final String urls = url + 'pond?user=4';

    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parsePond, response.body);
    } else {
      return null;
    }
  }
}