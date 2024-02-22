// To parse this JSON data, do
//
//     final subjectDetailsModel = subjectDetailsModelFromJson(jsonString);

import 'dart:convert';

SubjectDetailsModel subjectDetailsModelFromJson(String str) => SubjectDetailsModel.fromJson(json.decode(str));

String subjectDetailsModelToJson(SubjectDetailsModel data) => json.encode(data.toJson());

class SubjectDetailsModel {
  int? id;
  String? layout;
  String? name;
  int? size;
  int? subject;

  SubjectDetailsModel({
    this.id,
    this.layout,
    this.name,
    this.size,
    this.subject,
  });

  factory SubjectDetailsModel.fromJson(Map<String, dynamic> json) => SubjectDetailsModel(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
    "subject": subject,
  };
}
