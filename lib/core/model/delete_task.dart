

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
  String? stringValue;
  String? valueType;
  String? kind;
  String? value;
  String? path;
  Reason? reason;
  String? name;
  String? message;

  Data({
    this.stringValue,
    this.valueType,
    this.kind,
    this.value,
    this.path,
    this.reason,
    this.name,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stringValue: json["stringValue"],
    valueType: json["valueType"],
    kind: json["kind"],
    value: json["value"],
    path: json["path"],
    reason: json["reason"] == null ? null : Reason.fromJson(json["reason"]),
    name: json["name"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stringValue": stringValue,
    "valueType": valueType,
    "kind": kind,
    "value": value,
    "path": path,
    "reason": reason?.toJson(),
    "name": name,
    "message": message,
  };
}

class Reason {
  Reason();

  factory Reason.fromJson(Map<String, dynamic> json) => Reason(
  );

  Map<String, dynamic> toJson() => {
  };
}
