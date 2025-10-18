import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/features/auth/widgets/registration_form.dart';

void main() {
  testWidgets('Registration form validation test', (WidgetTester tester) async {
    await tester.pumpWidget(const RegistrationForm());

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final confirmField = find.byKey(const Key('confirmPasswordField'));
    final submitButton = find.byKey(const Key('submitButton'));

    await tester.enterText(emailField, 'wrongEmail');
    await tester.enterText(passwordField, '123');
    await tester.enterText(confirmField, '321');
    await tester.tap(submitButton);
    await tester.pump();

    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.textContaining('Password'), findsWidgets);

    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'Abcd1234!');
    await tester.enterText(confirmField, 'Abcd1234!');
    await tester.tap(submitButton);
    await tester.pump();

    expect(find.text('Form is valid!'), findsOneWidget);
});
}