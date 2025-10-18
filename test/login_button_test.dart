import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/features/auth/widgets/login_button.dart'; 

void main() {
  testWidgets('Login button displays text and triggers callback on tap', (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginButton(
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);

    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(wasPressed, true);
});
}