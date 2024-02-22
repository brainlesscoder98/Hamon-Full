// To parse this JSON data, do
//
//     final deleteResponse = deleteResponseFromJson(jsonString);

import 'dart:convert';

DeleteResponse deleteResponseFromJson(String str) => DeleteResponse.fromJson(json.decode(str));

String deleteResponseToJson(DeleteResponse data) => json.encode(data.toJson());

class DeleteResponse {
  String? message;

  DeleteResponse({
    this.message,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) => DeleteResponse(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
