import 'package:http/http.dart' as http;
import 'package:iot/model/login_model.dart';
import 'package:iot/network/shared_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network.dart';

class APIServices {
  static var client = http.Client();

  static String apiURL = url + 'auth/login';
  static String apiURLForgot = url + 'auth/forgotPass';
  static String apiURLChangePass = url + 'auth/changePassword';
  static String apiURLUpdate_Profile = url + 'auth/updateProfile';

  static Future<bool> loginCustomer(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(apiURL, headers: requestHeaders, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      LoginResponseModel responseModel = loginResponseFormJson(jsonString);
      SharedService.setLoginDetails(responseModel);
      print('200');
      return response.statusCode == 200 ? true : false;
    }
    print('199');
    return false;
  }

  static Future<bool> forgotCustomer(String email) async {
    var response = await client.post(apiURLForgot, body: {"email": email});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> changePassCustomer(String currentPass, String newPass, String passConfirm) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accToken");
    Map<String, String> requestHeaders = {
      "Authorization": "Bearer " + accessToken,
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(apiURLChangePass, headers: requestHeaders, body: {
      "currentPassword": currentPass,
      "newPassword": newPass,
      "newPasswordConfirm": passConfirm
    });
    print("Bearer " + accessToken + "END");
    if (response.statusCode == 200) {
      print(response.statusCode);
      print('200');
      return true;
    }
    print('500');
    print(currentPass);
    return false;
  }

  static Future<bool> updateProfile(String name, String phone, String gender, String birthday, String address) async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accToken");
    Map<String, String> requestHeaders = {
      "Authorization": "Bearer " + accessToken,
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(apiURLUpdate_Profile, headers: requestHeaders, body: {
      "name": name,
      "phone": phone,
      "birthday": birthday,
      "gender": gender,
      "address": address,
    });
    print(name + "," + phone +","+ response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      prefs.setString("name", name);
      prefs.setInt("phone", int.parse(phone));
      prefs.setString("birthday", birthday);
      prefs.setString("gender", gender);
      prefs.setString("address", address);
      print('200');
      return true;
    }
    print('500');
    return false;
  }

}
