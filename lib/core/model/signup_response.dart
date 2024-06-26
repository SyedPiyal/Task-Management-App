

class SignupResponse {
  String? status;
  Data? data;

  SignupResponse({
    this.status,
    this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? photo;
  DateTime? createdDate;
  String? id;

  Data({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.photo,
    this.createdDate,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    password: json["password"],
    photo: json["photo"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "password": password,
    "photo": photo,
    "createdDate": createdDate?.toIso8601String(),
    "_id": id,
  };
}
