
class CreateTaskModel {
  String? title;
  String? description;
  String? status;

  CreateTaskModel({
    this.title,
    this.description,
    this.status,
  });

  factory CreateTaskModel.fromJson(Map<String, dynamic> json) => CreateTaskModel(
    title: json["title"],
    description: json["description"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "status": status,
  };
}
