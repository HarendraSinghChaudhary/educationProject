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
        this.upcoming,
        this.passed,
    });

    String? msg;
    bool? status;
    List<AllDatum>? upcoming;
    List<AllDatum>? passed;

    factory PowerHoursModel.fromJson(Map<String, dynamic> json) => PowerHoursModel(
        msg: json["msg"],
        status: json["status"],
        upcoming: List<AllDatum>.from(json["upcoming"].map((x) => AllDatum.fromJson(x))),
        passed: List<AllDatum>.from(json["passed"].map((x) => AllDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "status": status,
        "upcoming": List<dynamic>.from(upcoming!.map((x) => x.toJson())),
        "passed": List<dynamic>.from(passed!.map((x) => x.toJson())),
    };
}

class AllDatum {
    AllDatum({
        this.id,
        this.powerHoursTitle,
        this.startTime,
        this.endTime,
        this.joinUrl,
        this.description,
        this.image,
        this.video,
    });

    String? id;
    String? powerHoursTitle;
    DateTime? startTime;
    DateTime? endTime;
    String? joinUrl;
    String? description;
    String? image;
    String? video;

    factory AllDatum.fromJson(Map<String, dynamic> json) => AllDatum(
        id: json["_id"],
        powerHoursTitle: json["PowerHoursTitle"],
        startTime: DateTime.parse(json["startTime"]),
        endTime: DateTime.parse(json["EndTime"]),
        joinUrl: json["JoinUrl"],
        description: json["description"],
        image: json["Image"],
        video: json["Video"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "PowerHoursTitle": powerHoursTitle,
        "startTime": startTime!.toIso8601String(),
        "EndTime": endTime!.toIso8601String(),
        "JoinUrl": joinUrl,
        "description": description,
        "Image": image,
        "Video": video,
    };
}
