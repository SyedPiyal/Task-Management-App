
class SignupModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile;
  String? password;
  String? photo;

  SignupModel({
    this.email,
    this.firstName,
    this.lastName,
    this.mobile,
    this.password,
    this.photo,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
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
