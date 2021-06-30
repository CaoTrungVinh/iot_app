import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:iot/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    // return prefs.getString("login_details") != null ? true : false;
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
}
