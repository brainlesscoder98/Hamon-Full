// To parse this JSON data, do
//
//     final studentsResponse = studentsResponseFromJson(jsonString);

import 'dart:convert';

StudentsResponse studentsResponseFromJson(String str) => StudentsResponse.fromJson(json.decode(str));

String studentsResponseToJson(StudentsResponse data) => json.encode(data.toJson());

class StudentsResponse {
  List<Student>? students;

  StudentsResponse({
    this.students,
  });

  factory StudentsResponse.fromJson(Map<String, dynamic> json) => StudentsResponse(
    students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
  };
}

class Student {
  int? age;
  String? email;
  int? id;
  String? name;

  Student({
    this.age,
    this.email,
    this.id,
    this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    age: json["age"],
    email: json["email"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "email": email,
    "id": id,
    "name": name,
  };
}
