// To parse this JSON data, do
//
//     final studentDetailsResponse = studentDetailsResponseFromJson(jsonString);

import 'dart:convert';

StudentDetailsResponse studentDetailsResponseFromJson(String str) => StudentDetailsResponse.fromJson(json.decode(str));

String studentDetailsResponseToJson(StudentDetailsResponse data) => json.encode(data.toJson());

class StudentDetailsResponse {
  int? age;
  String? email;
  int? id;
  String? name;

  StudentDetailsResponse({
    this.age,
    this.email,
    this.id,
    this.name,
  });

  factory StudentDetailsResponse.fromJson(Map<String, dynamic> json) => StudentDetailsResponse(
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
