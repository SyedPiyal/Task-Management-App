// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? status;
  String? token;
  Data? data;

  Login({
    this.status,
    this.token,
    this.data,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    status: json["status"],
    token: json["token"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "token": token,
    "data": data?.toJson(),
  };
}

class Data {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? photo;

  Data({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.photo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "photo": photo,
  };
}
