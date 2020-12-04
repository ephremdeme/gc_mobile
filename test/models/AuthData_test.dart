import 'package:flutter_native_interaction/models/AuthData.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AuthData to json test', () async {
    // Act
    AuthData.fromJson(data);

  // Assert
    // expect(AuthData(login: ), matcher)
  });
}

Map<String, dynamic> data = {
  "login": {
    "id": 13,
    "token":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxM30sImlhdCI6MTYwNjY2NTkyNywiZXhwIjoxNjkzMDY1OTI3fQ.vqCU62FokpC7TkmSrzPpwBGclHLY9l7o2GicepUsfMI",
    "User": {"id": 13, "phone": "0910101010"}
  }
};
