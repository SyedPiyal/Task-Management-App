class UserData {
  String? status;
  String? token;
  Data? data;

  UserData({
    this.status,
    this.token,
    this.data,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
