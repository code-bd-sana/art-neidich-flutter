import 'dart:convert';

class ReportResponse {
  bool? success;
  String? message;
  Data? data;
  int? code;

  ReportResponse({this.success, this.message, this.data, this.code});

  ReportResponse copyWith({
    bool? success,
    String? message,
    Data? data,
    int? code,
  }) => ReportResponse(
    success: success ?? this.success,
    message: message ?? this.message,
    data: data ?? this.data,
    code: code ?? this.code,
  );

  factory ReportResponse.fromRawJson(String str) =>
      ReportResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportResponse.fromJson(Map<String, dynamic> json) => ReportResponse(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
    "code": code,
  };
}

class Data {
  String? id;
  Inspector? inspector;
  Job? job;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<DataImage>? images;

  Data({
    this.id,
    this.inspector,
    this.job,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  Data copyWith({
    String? id,
    Inspector? inspector,
    Job? job,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<DataImage>? images,
  }) => Data(
    id: id ?? this.id,
    inspector: inspector ?? this.inspector,
    job: job ?? this.job,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    images: images ?? this.images,
  );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    inspector: json["inspector"] == null
        ? null
        : Inspector.fromJson(json["inspector"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
    status: json["status"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    images: json["images"] == null
        ? []
        : List<DataImage>.from(
            json["images"]!.map((x) => DataImage.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "inspector": inspector?.toJson(),
    "job": job?.toJson(),
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class DataImage {
  String? imageLabel;
  List<ImageImage>? images;

  DataImage({this.imageLabel, this.images});

  DataImage copyWith({String? imageLabel, List<ImageImage>? images}) =>
      DataImage(
        imageLabel: imageLabel ?? this.imageLabel,
        images: images ?? this.images,
      );

  factory DataImage.fromRawJson(String str) =>
      DataImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataImage.fromJson(Map<String, dynamic> json) => DataImage(
    imageLabel: json["imageLabel"],
    images: json["images"] == null
        ? []
        : List<ImageImage>.from(
            json["images"]!.map((x) => ImageImage.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "imageLabel": imageLabel,
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class ImageImage {
  String? fileName;
  String? url;
  String? key;
  String? alt;
  String? mimeType;
  int? size;
  String? noteForAdmin;

  ImageImage({
    this.fileName,
    this.url,
    this.key,
    this.alt,
    this.mimeType,
    this.size,
    this.noteForAdmin,
  });

  ImageImage copyWith({
    String? fileName,
    String? url,
    String? key,
    String? alt,
    String? mimeType,
    int? size,
    String? noteForAdmin,
  }) => ImageImage(
    fileName: fileName ?? this.fileName,
    url: url ?? this.url,
    key: key ?? this.key,
    alt: alt ?? this.alt,
    mimeType: mimeType ?? this.mimeType,
    size: size ?? this.size,
    noteForAdmin: noteForAdmin ?? this.noteForAdmin,
  );

  factory ImageImage.fromRawJson(String str) =>
      ImageImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageImage.fromJson(Map<String, dynamic> json) => ImageImage(
    fileName: json["fileName"],
    url: json["url"],
    key: json["key"],
    alt: json["alt"],
    mimeType: json["mimeType"],
    size: json["size"],
    noteForAdmin: json["noteForAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "fileName": fileName,
    "url": url,
    "key": key,
    "alt": alt,
    "mimeType": mimeType,
    "size": size,
    "noteForAdmin": noteForAdmin,
  };
}

class Inspector {
  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;

  Inspector({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
  });

  Inspector copyWith({
    String? id,
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
  }) => Inspector(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    role: role ?? this.role,
  );

  factory Inspector.fromRawJson(String str) =>
      Inspector.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Inspector.fromJson(Map<String, dynamic> json) => Inspector(
    id: json["_id"],
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "role": role,
  };
}

class Job {
  Inspector? createdBy;
  String? id;
  String? orderId;
  String? streetAddress;
  String? developmentName;
  String? siteContactName;
  String? siteContactPhone;
  String? siteContactEmail;
  DateTime? dueDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  LastUpdatedBy? lastUpdatedBy;

  Job({
    this.createdBy,
    this.id,
    this.orderId,
    this.streetAddress,
    this.developmentName,
    this.siteContactName,
    this.siteContactPhone,
    this.siteContactEmail,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
    this.lastUpdatedBy,
  });

  Job copyWith({
    Inspector? createdBy,
    String? id,
    String? orderId,
    String? streetAddress,
    String? developmentName,
    String? siteContactName,
    String? siteContactPhone,
    String? siteContactEmail,
    DateTime? dueDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    LastUpdatedBy? lastUpdatedBy,
  }) => Job(
    createdBy: createdBy ?? this.createdBy,
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    streetAddress: streetAddress ?? this.streetAddress,
    developmentName: developmentName ?? this.developmentName,
    siteContactName: siteContactName ?? this.siteContactName,
    siteContactPhone: siteContactPhone ?? this.siteContactPhone,
    siteContactEmail: siteContactEmail ?? this.siteContactEmail,
    dueDate: dueDate ?? this.dueDate,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
  );

  factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    createdBy: json["createdBy"] == null
        ? null
        : Inspector.fromJson(json["createdBy"]),
    id: json["_id"],
    orderId: json["orderId"],
    streetAddress: json["streetAddress"],
    developmentName: json["developmentName"],
    siteContactName: json["siteContactName"],
    siteContactPhone: json["siteContactPhone"],
    siteContactEmail: json["siteContactEmail"],
    dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
    lastUpdatedBy: json["lastUpdatedBy"] == null
        ? null
        : LastUpdatedBy.fromJson(json["lastUpdatedBy"]),
  );

  Map<String, dynamic> toJson() => {
    "createdBy": createdBy?.toJson(),
    "_id": id,
    "orderId": orderId,
    "streetAddress": streetAddress,
    "developmentName": developmentName,
    "siteContactName": siteContactName,
    "siteContactPhone": siteContactPhone,
    "siteContactEmail": siteContactEmail,
    "dueDate": dueDate?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "lastUpdatedBy": lastUpdatedBy?.toJson(),
  };
}

class LastUpdatedBy {
  String? role;

  LastUpdatedBy({this.role});

  LastUpdatedBy copyWith({String? role}) =>
      LastUpdatedBy(role: role ?? this.role);

  factory LastUpdatedBy.fromRawJson(String str) =>
      LastUpdatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LastUpdatedBy.fromJson(Map<String, dynamic> json) =>
      LastUpdatedBy(role: json["role"]);

  Map<String, dynamic> toJson() => {"role": role};
}
