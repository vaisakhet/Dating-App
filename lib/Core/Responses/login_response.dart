// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String refresh;
  String access;
  int customerId;
  String completedPage;

  LoginResponse({
    required this.refresh,
    required this.access,
    required this.customerId,
    required this.completedPage,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        refresh: json["refresh"],
        access: json["access"],
        customerId: json["customer_id"],
        completedPage: json["completed_page"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "customer_id": customerId,
        "completed_page": completedPage,
      };
}
