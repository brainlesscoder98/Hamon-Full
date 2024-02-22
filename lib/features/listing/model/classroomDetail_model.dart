// To parse this JSON data, do
//
//     final classroomDetailsModel = classroomDetailsModelFromJson(jsonString);

import 'dart:convert';

ClassroomDetailsModel classroomDetailsModelFromJson(String str) => ClassroomDetailsModel.fromJson(json.decode(str));

String classroomDetailsModelToJson(ClassroomDetailsModel data) => json.encode(data.toJson());

class ClassroomDetailsModel {
  int? id;
  String? layout;
  String? name;
  int? size;
  int? subject;

  ClassroomDetailsModel({
    this.id,
    this.layout,
    this.name,
    this.size,
    this.subject,
  });

  factory ClassroomDetailsModel.fromJson(Map<String, dynamic> json) => ClassroomDetailsModel(
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
