import 'package:flutter_native_interaction/models/Login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Login unit test', () async {
    // Act
    Login login = Login.fromJson(data);
    // Assert
    expect(login.user.phone, "0910101010");
  }); 
}

Map<String, dynamic> data = {
  "id": 13,
  "token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxM30sImlhdCI6MTYwNjY2NTkyNywiZXhwIjoxNjkzMDY1OTI3fQ.vqCU62FokpC7TkmSrzPpwBGclHLY9l7o2GicepUsfMI",
  "User": {"id": 13, "phone": "0910101010"}
};
