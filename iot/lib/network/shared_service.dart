import 'package:flutter/cupertino.dart';
import 'package:iot/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    // return prefs.getString("login_details") != null ? true : false;
    print(prefs.getInt("id_user"));
    print(prefs.getInt("id_user"));
    return prefs.getInt("login_details") == 1 ? true : false;
  }


  static Future<void> setLoginDetails(LoginResponseModel responseModel) async {
    final prefs = await SharedPreferences.getInstance();
    if (responseModel != null){
      prefs.setInt("login_details", 1);
      prefs.setInt("id_user", responseModel.user.id);
      prefs.setString("email", responseModel.user.email);
      prefs.setString("name", responseModel.user.name);
      prefs.setInt("phone", int.parse(responseModel.user.phone));
      prefs.setString("birthday", responseModel.user.birthday);
      prefs.setString("gender", responseModel.user.gender);
      prefs.setString("address", responseModel.user.address);
      prefs.setString("accToken", responseModel.accessToken);
      print(responseModel.user.id);
      print(responseModel.user.email);
      print(responseModel.user.name);
      print(responseModel.user.phone);
      print(responseModel.user.birthday);
      print(responseModel.user.gender);
      print(responseModel.user.address);
    }else{
      prefs.setInt("login_details", 0);
    }
  }

  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("login_details", 0);
    // await setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
