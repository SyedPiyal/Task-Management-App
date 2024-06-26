
class CreateTaskResponse {
  String? status;
  Data? data;

  CreateTaskResponse({
    this.status,
    this.data,
  });

  factory CreateTaskResponse.fromJson(Map<String, dynamic> json) => CreateTaskResponse(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  String? title;
  String? description;
  String? status;
  String? email;
  DateTime? createdDate;
  String? id;

  Data({
    this.title,
    this.description,
    this.status,
    this.email,
    this.createdDate,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    status: json["status"],
    email: json["email"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "status": status,
    "email": email,
    "createdDate": createdDate?.toIso8601String(),
    "_id": id,
  };
}
