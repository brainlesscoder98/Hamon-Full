// To parse this JSON data, do
//
//     final classroomResponse = classroomResponseFromJson(jsonString);

import 'dart:convert';

ClassroomResponse classroomResponseFromJson(String str) => ClassroomResponse.fromJson(json.decode(str));

String classroomResponseToJson(ClassroomResponse data) => json.encode(data.toJson());

class ClassroomResponse {
  List<Classroom>? classrooms;

  ClassroomResponse({
    this.classrooms,
  });

  factory ClassroomResponse.fromJson(Map<String, dynamic> json) => ClassroomResponse(
    classrooms: json["classrooms"] == null ? [] : List<Classroom>.from(json["classrooms"]!.map((x) => Classroom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": classrooms == null ? [] : List<dynamic>.from(classrooms!.map((x) => x.toJson())),
  };
}

class Classroom {
  int? id;
  String? layout;
  String? name;
  int? size;

  Classroom({
    this.id,
    this.layout,
    this.name,
    this.size,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}
