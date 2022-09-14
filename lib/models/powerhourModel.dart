// To parse this JSON data, do
//
//     final powerHoursModel = powerHoursModelFromJson(jsonString);

import 'dart:convert';

PowerHoursModel powerHoursModelFromJson(String str) => PowerHoursModel.fromJson(json.decode(str));

String powerHoursModelToJson(PowerHoursModel data) => json.encode(data.toJson());

class PowerHoursModel {
    PowerHoursModel({
        this.msg,
        this.status,
        this.data,
    });

    String? msg;
    bool? status;
    List<Datum>? data;

    factory PowerHoursModel.fromJson(Map<String, dynamic> json) => PowerHoursModel(
        msg: json["msg"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.powerHouseTitle,
        this.image,
        this.startTime,
        this.endTime,
        this.data,
        this.joinUrl,
        this.video,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.type,
    });

    String? id;
    String? powerHouseTitle;
    String? image;
    String? startTime;
    String? endTime;
    String? data;
    String? joinUrl;
    String? video;
    String? description;
    bool? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? type;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        powerHouseTitle: json["PowerHouseTitle"],
        image: json["Image"],
        startTime: json["startTime"],
        endTime: json["EndTime"],
        data: json["Data"],
        joinUrl: json["JoinUrl"],
        video: json["Video"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "PowerHouseTitle": powerHouseTitle,
        "Image": image,
        "startTime": startTime,
        "EndTime": endTime,
        "Data": data,
        "JoinUrl": joinUrl,
        "Video": video,
        "description": description,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "type": type,
    };
}
