// To parse this JSON data, do
//
//     final registrationErrorResponse = registrationErrorResponseFromJson(jsonString);

import 'dart:convert';

RegistrationErrorResponse registrationErrorResponseFromJson(String str) => RegistrationErrorResponse.fromJson(json.decode(str));

String registrationErrorResponseToJson(RegistrationErrorResponse data) => json.encode(data.toJson());

class RegistrationErrorResponse {
  String? error;

  RegistrationErrorResponse({
    this.error,
  });

  factory RegistrationErrorResponse.fromJson(Map<String, dynamic> json) => RegistrationErrorResponse(
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
  };
}
