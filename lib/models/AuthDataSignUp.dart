import 'package:flutter_native_interaction/models/signUp.dart';

class AuthDataSignUp {
  final SignUp signUp;

  AuthDataSignUp({
    this.signUp
  });

  factory AuthDataSignUp.fromJson(Map<String, dynamic> data) {
    return AuthDataSignUp(
      signUp: SignUp.fromJson(data["createUser"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "createUser": signUp.toJson(), 
    };
  }
}
