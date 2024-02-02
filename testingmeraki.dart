import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/lib/pages/authentication/login_page.dart';

void main() {
  testWidgets('Login Screen UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify the presence of the username and password fields.
    expect(find.byKey(Key('usernameField')), findsOneWidget);
    expect(find.byKey(Key('passwordField')), findsOneWidget);

    // Verify the presence of the login button.
    expect(find.byKey(Key('loginButton')), findsOneWidget);
  });

  testWidgets('Login Screen Validation Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Attempt to login without entering any credentials.
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pump();

    // Verify that the login failed due to missing credentials.
    expect(
        find.text('Please enter both username and password.'), findsOneWidget);

    // Enter valid username and password.
    await tester.enterText(find.byKey(Key('usernameField')), 'john_doe');
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');

    // Attempt to login again.
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pump();

    // Verify that the login is successful.
    expect(find.text('Login successful!'), findsOneWidget);
  });
}