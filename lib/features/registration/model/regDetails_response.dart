// To parse this JSON data, do
//
//     final regDetailsResponse = regDetailsResponseFromJson(jsonString);

import 'dart:convert';

RegDetailsResponse regDetailsResponseFromJson(String str) => RegDetailsResponse.fromJson(json.decode(str));

String regDetailsResponseToJson(RegDetailsResponse data) => json.encode(data.toJson());

class RegDetailsResponse {
  int? id;
  int? student;
  int? subject;

  RegDetailsResponse({
    this.id,
    this.student,
    this.subject,
  });

  factory RegDetailsResponse.fromJson(Map<String, dynamic> json) => RegDetailsResponse(
    id: json["id"],
    student: json["student"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student,
    "subject": subject,
  };
}
