import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/widgets/input_widget.dart'; // Import your InputWidget file

void main() {
  group('InputWidget Tests', () {
    // Test to ensure the label is displayed correctly
    testWidgets('Displays the label', (WidgetTester tester) async {
      const testLabel = 'Test Label';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputWidget(
              label: testLabel,
              controller: TextEditingController(),
            ),
          ),
        ),
      );

      // Verify that the label is displayed
      expect(find.text(testLabel), findsOneWidget);
    });

    // Test to check if the TextField is readOnly when specified
    testWidgets('TextField should be readOnly when specified', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputWidget(
              label: 'Read Only Test',
              controller: TextEditingController(),
              readOnly: true,
            ),
          ),
        ),
      );

      // Attempt to tap the TextField to bring up the keyboard
      await tester.tap(find.byType(TextField));
      await tester.pump();

      // Verify that the keyboard is not shown for a read-only TextField
      expect(find.byType(EditableText), findsNothing);
    });

    // Test to check if the onTap callback is called when the TextField is tapped
    testWidgets('onTap callback is triggered on tap', (WidgetTester tester) async {
      bool tapCallbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InputWidget(
              label: 'Tap Test',
              controller: TextEditingController(),
              onTap: () {
                tapCallbackCalled = true;
              },
            ),
          ),
        ),
      );

      // Tap the TextField
      await tester.tap(find.byType(TextField));
      await tester.pump();

      // Verify that the onTap callback was called
      expect(tapCallbackCalled, isTrue);
    });
  });
}
