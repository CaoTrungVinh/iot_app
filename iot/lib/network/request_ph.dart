import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/ph_model.dart';

class Request_Ph {
  static const String url = 'http://192.168.43.156/iot/public/api/dataph';

  static List<PH_Model> parsePh(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<PH_Model> get = list.map((model) => PH_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<PH_Model>> fetchPh({int page = 1}) async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parsePh, response.body);
    } else {
      return null;
    }
  }
}