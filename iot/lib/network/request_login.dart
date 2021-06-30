import 'package:http/http.dart' as http;
import 'package:iot/model/login_model.dart';
import 'package:iot/network/shared_service.dart';
import 'network.dart';

class APIServices{
  static var client = http.Client();
  // static String apiURL = "http://192.168.1.150/iot_server/iot/public/api/auth/login";
  static String apiURL = url + 'auth/login';

  static Future<bool> loginCustomer(String email, String password) async{
    Map<String, String> requestHeaders = {
      'Content-type': 'application/x-www-form-urlencoded'
    };
    var response = await client.post(apiURL,
    headers: requestHeaders,
    body: {
      "email":email,
      "password": password,
    });
    if(response.statusCode == 200){
      var jsonString = response.body;
      LoginResponseModel responseModel = loginResponseFormJson(jsonString);
        SharedService.setLoginDetails(responseModel);
      print('200');
      return response.statusCode == 200 ? true : false;
    }
    print('199');
    return false;
  }


}