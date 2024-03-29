import 'dart:convert';

LoginResponseModel loginResponseFormJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  String accessToken;
  String tokenType;
  String expiresAt;
  User user;

  LoginResponseModel(
      {this.accessToken, this.tokenType, this.expiresAt, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_at'] = this.expiresAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String email;
  String name;
  String birthday;
  String phone;
  String gender;
  String address;
  int roleId;

  User(
      {this.id,
        this.email,
        this.name,
        this.birthday,
        this.phone,
        this.gender,
        this.address,
        this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    birthday = json['birthday'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['role_id'] = this.roleId;
    return data;
  }
}


