
class TaskListResponse {
  String? status;
  List<TaskData>? data;

  TaskListResponse({
    this.status,
    this.data,
  });

  factory TaskListResponse.fromJson(Map<String, dynamic> json) => TaskListResponse(
    status: json["status"],
    data: json["data"] == null ? [] : List<TaskData>.from(json["data"]!.map((x) => TaskData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TaskData {
  String? id;
  String? title;
  String? description;
  String? status;
  String? createdDate;

  TaskData({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdDate,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
    id: json["_id"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    createdDate: json["createdDate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "description": description,
    "status": status,
    "createdDate": createdDate,
  };
}
