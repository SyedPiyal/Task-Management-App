
class DeleteTaskResponse {
  String? status;
  Data? data;

  DeleteTaskResponse({
    this.status,
    this.data,
  });

  factory DeleteTaskResponse.fromJson(Map<String, dynamic> json) => DeleteTaskResponse(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  bool? acknowledged;
  int? deletedCount;

  Data({
    this.acknowledged,
    this.deletedCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    acknowledged: json["acknowledged"],
    deletedCount: json["deletedCount"],
  );

  Map<String, dynamic> toJson() => {
    "acknowledged": acknowledged,
    "deletedCount": deletedCount,
  };
}
