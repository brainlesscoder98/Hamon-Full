// To parse this JSON data, do
//
//     final registrationSuccessResponse = registrationSuccessResponseFromJson(jsonString);

import 'dart:convert';

RegistrationSuccessResponse registrationSuccessResponseFromJson(String str) => RegistrationSuccessResponse.fromJson(json.decode(str));

String registrationSuccessResponseToJson(RegistrationSuccessResponse data) => json.encode(data.toJson());

class RegistrationSuccessResponse {
  Registration? registration;

  RegistrationSuccessResponse({
    this.registration,
  });

  factory RegistrationSuccessResponse.fromJson(Map<String, dynamic> json) => RegistrationSuccessResponse(
    registration: json["registration"] == null ? null : Registration.fromJson(json["registration"]),
  );

  Map<String, dynamic> toJson() => {
    "registration": registration?.toJson(),
  };
}

class Registration {
  int? id;
  int? student;
  int? subject;

  Registration({
    this.id,
    this.student,
    this.subject,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
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
