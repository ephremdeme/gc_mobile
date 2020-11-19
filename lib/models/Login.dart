import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/models/User.dart';

class Login {
  final int id;
  final String token;
  final User user;

  Login({
    this.id,
    @required this.token,
    this.user
  });

  factory Login.fromJson(Map<String, dynamic> data) {
    return Login(
      id: data['id'],
      token: data['token'],
      user: User.fromJson(data["User"])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "token": token,
      "User": user.toJson()
    };
  }
}
