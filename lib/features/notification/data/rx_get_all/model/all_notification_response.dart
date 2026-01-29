import 'dart:convert';

class GetAllNotificationResponse {
  bool? success;
  String? message;
  List<Datum>? data;
  MetaData? metaData;
  int? code;

  GetAllNotificationResponse({
    this.success,
    this.message,
    this.data,
    this.metaData,
    this.code,
  });

  GetAllNotificationResponse copyWith({
    bool? success,
    String? message,
    List<Datum>? data,
    MetaData? metaData,
    int? code,
  }) => GetAllNotificationResponse(
    success: success ?? this.success,
    message: message ?? this.message,
    data: data ?? this.data,
    metaData: metaData ?? this.metaData,
    code: code ?? this.code,
  );

  factory GetAllNotificationResponse.fromRawJson(String str) =>
      GetAllNotificationResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAllNotificationResponse.fromJson(Map<String, dynamic> json) =>
      GetAllNotificationResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        metaData: json["metaData"] == null
            ? null
            : MetaData.fromJson(json["metaData"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
    "metaData": metaData?.toJson(),
    "code": code,
  };
}

class Datum {
  String? id;
  String? title;
  String? body;
  Data? data;
  String? type;
  dynamic authorId;
  List<String>? recipients;
  List<dynamic>? deviceTokens;
  String? status;
  List<dynamic>? readBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Result? result;
  DateTime? sentAt;

  Datum({
    this.id,
    this.title,
    this.body,
    this.data,
    this.type,
    this.authorId,
    this.recipients,
    this.deviceTokens,
    this.status,
    this.readBy,
    this.createdAt,
    this.updatedAt,
    this.result,
    this.sentAt,
  });

  Datum copyWith({
    String? id,
    String? title,
    String? body,
    Data? data,
    String? type,
    dynamic authorId,
    List<String>? recipients,
    List<dynamic>? deviceTokens,
    String? status,
    List<dynamic>? readBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    Result? result,
    DateTime? sentAt,
  }) => Datum(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    data: data ?? this.data,
    type: type ?? this.type,
    authorId: authorId ?? this.authorId,
    recipients: recipients ?? this.recipients,
    deviceTokens: deviceTokens ?? this.deviceTokens,
    status: status ?? this.status,
    readBy: readBy ?? this.readBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    result: result ?? this.result,
    sentAt: sentAt ?? this.sentAt,
  );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    title: json["title"],
    body: json["body"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    type: json["type"],
    authorId: json["authorId"],
    recipients: json["recipients"] == null
        ? []
        : List<String>.from(json["recipients"]!.map((x) => x)),
    deviceTokens: json["deviceTokens"] == null
        ? []
        : List<dynamic>.from(json["deviceTokens"]!.map((x) => x)),
    status: json["status"],
    readBy: json["readBy"] == null
        ? []
        : List<dynamic>.from(json["readBy"]!.map((x) => x)),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    sentAt: json["sentAt"] == null ? null : DateTime.parse(json["sentAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "body": body,
    "data": data?.toJson(),
    "type": type,
    "authorId": authorId,
    "recipients": recipients == null
        ? []
        : List<dynamic>.from(recipients!.map((x) => x)),
    "deviceTokens": deviceTokens == null
        ? []
        : List<dynamic>.from(deviceTokens!.map((x) => x)),
    "status": status,
    "readBy": readBy == null ? [] : List<dynamic>.from(readBy!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "result": result?.toJson(),
    "sentAt": sentAt?.toIso8601String(),
  };
}

class Data {
  String? userId;
  String? action;

  Data({this.userId, this.action});

  Data copyWith({String? userId, String? action}) =>
      Data(userId: userId ?? this.userId, action: action ?? this.action);

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(userId: json["userId"], action: json["action"]);

  Map<String, dynamic> toJson() => {"userId": userId, "action": action};
}

class Result {
  String? warning;

  Result({this.warning});

  Result copyWith({String? warning}) =>
      Result(warning: warning ?? this.warning);

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) =>
      Result(warning: json["warning"]);

  Map<String, dynamic> toJson() => {"warning": warning};
}

class MetaData {
  int? page;
  int? limit;
  int? totalNotifications;
  int? totalPage;

  MetaData({this.page, this.limit, this.totalNotifications, this.totalPage});

  MetaData copyWith({
    int? page,
    int? limit,
    int? totalNotifications,
    int? totalPage,
  }) => MetaData(
    page: page ?? this.page,
    limit: limit ?? this.limit,
    totalNotifications: totalNotifications ?? this.totalNotifications,
    totalPage: totalPage ?? this.totalPage,
  );

  factory MetaData.fromRawJson(String str) =>
      MetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    page: json["page"],
    limit: json["limit"],
    totalNotifications: json["totalNotifications"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalNotifications": totalNotifications,
    "totalPage": totalPage,
  };
}
