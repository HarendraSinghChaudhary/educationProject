

// To parse this JSON data, do
//
//     final darkCourseDetailModel = darkCourseDetailModelFromJson(jsonString);

import 'dart:convert';

DarkCourseDetailModel darkCourseDetailModelFromJson(String str) => DarkCourseDetailModel.fromJson(json.decode(str));

String darkCourseDetailModelToJson(DarkCourseDetailModel data) => json.encode(data.toJson());

class DarkCourseDetailModel {
    DarkCourseDetailModel({
        this.id,
        this.title,
        this.shortDescrition,
        this.description,
        this.image,
        this.status,
        this.moduleTitle,
        this.hotCourses,
        this.allmodule,
    });

    String? id;
    String? title;
    String? shortDescrition;
    String? description;
    String? image;
    bool? status;
    String? moduleTitle;
    bool? hotCourses;
    List<Allmodule>? allmodule;

    factory DarkCourseDetailModel.fromJson(Map<String, dynamic> json) => DarkCourseDetailModel(
        id: json["_id"],
        title: json["title"],
        shortDescrition: json["shortDescrition"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        moduleTitle: json["moduleTitle"],
        
        hotCourses: json["hotCourses"],
        allmodule: List<Allmodule>.from(json["allmodule"].map((x) => Allmodule.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "shortDescrition": shortDescrition,
        "description": description,
        "image": image,
        "status": status,
        "moduleTitle": moduleTitle,
        
        "hotCourses": hotCourses,
        "allmodule": List<dynamic>.from(allmodule!.map((x) => x.toJson())),
    };
}

class Allmodule {
    Allmodule({
        this.studayMaterial,
        this.id,
        this.moduletitle,
        this.courseId,
        this.status,
    });

    int? studayMaterial;
    String? id;
    String? moduletitle;
    String? courseId;
    bool? status;

    factory Allmodule.fromJson(Map<String, dynamic> json) => Allmodule(
        studayMaterial: json["StudayMaterial"],
        id: json["_id"],
        moduletitle: json["moduletitle"],
        courseId: json["courseId"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "StudayMaterial": studayMaterial,
        "_id": id,
        "moduletitle": moduletitle,
        "courseId": courseId,
        "status": status,
    };
}
