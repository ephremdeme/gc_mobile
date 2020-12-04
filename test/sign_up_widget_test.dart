import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Sign up widget test", (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var textField = find.byType(TextField);
    
    // Assert
    expect(textField, findsWidgets);
  });
}
