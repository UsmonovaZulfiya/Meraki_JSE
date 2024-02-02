import 'package:untitled/widgets/pet_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PetCard Tests', () {
    // Test to ensure all pet details are displayed correctly
    testWidgets('Displays pet image, name, breed, age, and gender', (WidgetTester tester) async {
      const testImage = 'https://example.com/test.jpg';
      const testName = 'Buddy';
      const testBreed = 'Golden Retriever';
      const testAge = 3;
      const testGender = 'Male';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              image: testImage,
              name: testName,
              breed: testBreed,
              age: testAge,
              gender: testGender,
            ),
          ),
        ),
      );

      // Verify that the image, name, breed, age, and gender are displayed
      expect(find.text(testName), findsOneWidget);
      expect(find.text(testBreed), findsOneWidget);
      expect(find.text('$testAge years'), findsOneWidget);
      expect(find.text(testGender), findsOneWidget);

      // Verify the presence of an image widget
      expect(find.byType(Image), findsWidgets);
    });
  });
}
