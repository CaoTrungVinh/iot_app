import 'dart:convert';
import 'package:iot/model/light_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class Request_Light {
  static const String url = 'http://192.168.43.156/iot/public/api/datalight';

  static List<Light_Model> parseLight(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Light_Model> get =
        list.map((model) => Light_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Light_Model>> fetchLight({int page = 1}) async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parseLight, response.body);
    } else {
      return null;
    }
  }
}
