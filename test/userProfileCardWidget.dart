import 'package:untitled/widgets/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserCard Tests', () {
    // Test to ensure all user details are displayed correctly
    testWidgets('Displays user photo, name, email, and phone number', (WidgetTester tester) async {
      const testFirstName = 'John';
      const testLastName = 'Doe';
      const testEmail = 'john.doe@example.com';
      const testPhoneNumber = '123-456-7890';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserCard(
              firstName: testFirstName,
              lastName: testLastName,
              userEmail: testEmail,
              phoneNumber: testPhoneNumber,
            ),
          ),
        ),
      );

      // Verify that the name, email, and phone number are displayed
      expect(find.text(testFirstName + " " + testLastName), findsOneWidget);
      expect(find.text(testEmail), findsOneWidget);
      expect(find.text(testPhoneNumber), findsOneWidget);

      // Verify the presence of an image widget and that it uses the hardcoded URL
      final Image image = tester.widget(find.byType(Image)) as Image;
      final NetworkImage networkImage = image.image as NetworkImage;
      expect(networkImage.url, 'https://cdn2.iconfinder.com/data/icons/veterinary-12/512/Veterinary_Icons-16-512.png');
    });
  });
}
