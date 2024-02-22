// To parse this JSON data, do
//
//     final registrationAllResponse = registrationAllResponseFromJson(jsonString);

import 'dart:convert';

RegistrationAllResponse registrationAllResponseFromJson(String str) => RegistrationAllResponse.fromJson(json.decode(str));

String registrationAllResponseToJson(RegistrationAllResponse data) => json.encode(data.toJson());

class RegistrationAllResponse {
  List<RegistrationAll>? registrations;

  RegistrationAllResponse({
    this.registrations,
  });

  factory RegistrationAllResponse.fromJson(Map<String, dynamic> json) => RegistrationAllResponse(
    registrations: json["registrations"] == null ? [] : List<RegistrationAll>.from(json["registrations"]!.map((x) => RegistrationAll.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "registrations": registrations == null ? [] : List<dynamic>.from(registrations!.map((x) => x.toJson())),
  };
}

class RegistrationAll {
  int? id;
  int? student;
  int? subject;

  RegistrationAll({
    this.id,
    this.student,
    this.subject,
  });

  factory RegistrationAll.fromJson(Map<String, dynamic> json) => RegistrationAll(
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
