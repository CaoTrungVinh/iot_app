import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:iot/model/control_model.dart';
import 'network.dart';

class Request_Control {
  // static String urls = url + 'datatemp';

  static List<Control_Model> parseControl(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Control_Model> get = list.map((model) => Control_Model.fromJson(model)).toList();
    return get;
  }

  static Future<List<Control_Model>> fetchControl(int control) async {
    final String urls = url + 'control?pond=' + '$control';

    final response = await http.get('$urls');
    if (response.statusCode == 200) {
      return compute(parseControl, response.body);
    } else {
      return null;
    }
  }
}