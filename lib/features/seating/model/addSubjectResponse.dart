// To parse this JSON data, do
//
//     final addSubjectSuccessResponse = addSubjectSuccessResponseFromJson(jsonString);

import 'dart:convert';

AddSubjectSuccessResponse addSubjectSuccessResponseFromJson(String str) => AddSubjectSuccessResponse.fromJson(json.decode(str));

String addSubjectSuccessResponseToJson(AddSubjectSuccessResponse data) => json.encode(data.toJson());

class AddSubjectSuccessResponse {
  int? id;
  String? layout;
  String? name;
  int? size;
  int? subject;

  AddSubjectSuccessResponse({
    this.id,
    this.layout,
    this.name,
    this.size,
    this.subject,
  });

  factory AddSubjectSuccessResponse.fromJson(Map<String, dynamic> json) => AddSubjectSuccessResponse(
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
