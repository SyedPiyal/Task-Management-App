
class SignUpModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? photo;

  SignUpModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.photo,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    mobile: json["mobile"],
    password: json["password"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "mobile": mobile,
    "password": password,
    "photo": photo,
  };
}
