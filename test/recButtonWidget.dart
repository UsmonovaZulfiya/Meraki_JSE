import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/widgets/rec_button_widget.dart'; // Import your recButton file

void main() {
  group('recButton Tests', () {
    // Test to ensure the button displays the provided text
    testWidgets('Displays the button text', (WidgetTester tester) async {
      const buttonText = 'Click Me';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: recButton(
              buttonText: buttonText,
              onPressed: () {},
            ),
          ),
        ),
      );

      // Verify that the button text is displayed
      expect(find.text(buttonText), findsOneWidget);
    });

    // Test to check if tapping the button triggers the onPressed callback
    testWidgets('onPressed callback is triggered on tap', (WidgetTester tester) async {
      bool callbackTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: recButton(
              buttonText: 'Test Button',
              onPressed: () {
                callbackTriggered = true;
              },
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Verify that the onPressed callback was called
      expect(callbackTriggered, isTrue);
    });
  });
}
