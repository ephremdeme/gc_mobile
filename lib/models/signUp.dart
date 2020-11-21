import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/models/User.dart';

class SignUp {
  final int id;
  final String token;
  final User user;

  SignUp({
    this.id,
    @required this.token,
    this.user
  });

  factory SignUp.fromJson(Map<String, dynamic> data) {
    return SignUp(
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
