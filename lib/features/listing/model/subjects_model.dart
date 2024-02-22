// To parse this JSON data, do
//
//     final subjectsResponse = subjectsResponseFromJson(jsonString);

import 'dart:convert';

SubjectsResponse subjectsResponseFromJson(String str) => SubjectsResponse.fromJson(json.decode(str));

String subjectsResponseToJson(SubjectsResponse data) => json.encode(data.toJson());

class SubjectsResponse {
  List<Subject>? subjects;

  SubjectsResponse({
    this.subjects,
  });

  factory SubjectsResponse.fromJson(Map<String, dynamic> json) => SubjectsResponse(
    subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
  };
}

class Subject {
  int? credits;
  int? id;
  String? name;
  String? teacher;

  Subject({
    this.credits,
    this.id,
    this.name,
    this.teacher,
  });

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
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
