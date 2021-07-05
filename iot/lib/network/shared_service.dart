import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iot/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    // return prefs.getString("login_details") != null ? true : false;
    print(prefs.getInt("id_user"));
    return prefs.getInt("login_details") == 1 ? true : false;
  }

  // static Future<LoginResponseModel> loginDetails() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("login_details") != null
  //       ? LoginResponseModel.fromJson(
  //           jsonDecode(
  //             prefs.getString("login_details"),
  //           ),
  //         )
  //       : null;
  // }

  static Future<void> setLoginDetails(LoginResponseModel responseModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (responseModel != null){
      prefs.setInt("login_details", 1);
      prefs.setInt("id_user", responseModel.user.id);
      print(responseModel.user.id);
    }else{
      prefs.setInt("login_details", 0);
    }
    // prefs.setString("login_details",responseModel != null
    //         ? jsonEncode(
    //       responseModel.toJson(),
    //     )
    //         : null);

  }

  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("login_details", 0);
    // await setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed('/login');
  }

  static Future<void> setToolkit(int temp, int ph, int light) async {
    final prefs = await SharedPreferences.getInstance();
      prefs.setInt("id_temp", temp);
      prefs.setInt("id_ph", ph);
      prefs.setInt("id_light", light);
      print(prefs.getInt("id_temp"));
      print(prefs.getInt("id_ph"));
      print(prefs.getInt("id_light"));
  }

  static Future<void> setControl(int pump_in, int pump_out, int lamp, int oxygen_fan) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("id_pump_in", pump_in);
    prefs.setInt("id_pump_out", pump_out);
    prefs.setInt("id_lamp", lamp);
    prefs.setInt("id_oxygen_fan", oxygen_fan);
    print(prefs.getInt("id_pump_in"));
    print(prefs.getInt("id_pump_out"));
    print(prefs.getInt("id_lamp"));
    print(prefs.getInt("id_oxygen_fan"));
  }
}
