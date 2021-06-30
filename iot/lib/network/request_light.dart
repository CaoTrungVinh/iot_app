import 'dart:convert';
import 'package:iot/model/light_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import 'network.dart';

class Request_Light{
  static String urls = url + 'datalight';

  static List<Light_Model> parseLight(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Light_Model> get =
        list.map((model) => Light_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Light_Model>> fetchLight({int page = 1}) async {
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseLight, response.body);
    } else {
      return null;
    }
  }
}
