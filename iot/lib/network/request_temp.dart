import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/temp_model.dart';

import 'network.dart';

class Request_Temp {
  static String urls = url + 'datatemp';

  static List<Temp_Model> parseTemp(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Temp_Model> get = list.map((model) => Temp_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Temp_Model>> fetchTemp({int page = 1}) async {
    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseTemp, response.body);
    } else {
      return null;
    }
  }
}