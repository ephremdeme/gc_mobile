import 'package:flutter_native_interaction/models/Login.dart';

class AuthData {
  final Login login;

  AuthData({
    this.login,
  });

  factory AuthData.fromJson(Map<String, dynamic> data) {
    return AuthData(
      login: Login.fromJson(data["login"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "login": login.toJson(),
    };
  }
}
