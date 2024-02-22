// To parse this JSON data, do
//
//     final subjectDetailsResponse = subjectDetailsResponseFromJson(jsonString);

import 'dart:convert';

SubjectDetailsResponse subjectDetailsResponseFromJson(String str) => SubjectDetailsResponse.fromJson(json.decode(str));

String subjectDetailsResponseToJson(SubjectDetailsResponse data) => json.encode(data.toJson());

class SubjectDetailsResponse {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  SubjectDetailsResponse({
    this.credits,
    this.id,
    this.name,
    this.teacher,
  });

  factory SubjectDetailsResponse.fromJson(Map<String, dynamic> json) => SubjectDetailsResponse(
    credits: json["credits"],
    id: json["id"],
    name: json["name"],
    teacher: json["teacher"],
  );

  Map<String, dynamic> toJson() => {
    "credits": credits,
    "id": id,
    "name": name,
    "teacher": teacher,
  };
}
