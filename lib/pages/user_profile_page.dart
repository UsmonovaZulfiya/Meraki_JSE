import 'package:flutter/material.dart';
import 'package:untitled/widgets/user_card_widget.dart';

class UserProfilePage extends StatelessWidget {
  final String userPhotoUrl = 'user_photo_url'; // Replace with actual photo URL
  final String userName = 'John Doe'; // Replace with actual user name
  final String userEmail = 'john.doe@example.com'; // Replace with actual user email
  final String phoneNumber = '+1 123-456-7890'; // Replace with actual user phone number

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Card
            UserCard(
              photoUrl: userPhotoUrl,
              userName: userName,
              userEmail: userEmail,
              phoneNumber: phoneNumber,
            ),

            SizedBox(height: 16.0),

            // About Section
            buildAboutSection(),

            SizedBox(height: 16.0),

            // Buttons Row
            buildButtonsRow(context),

            SizedBox(height: 16.0),

            // Buttons List View
            buildButtonsListView(),
          ],
        ),
      ),
    );
  }

  Widget buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me:',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        SizedBox(height: 8.0),
        Text(
          'Lorem ipsum dolor sit amet.',
        ),
      ],
    );
  }

  Widget buildButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildElevatedButton('Log Out', () {
          // Implement log out logic
          // Navigate to the welcome page
          Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
        }),
        buildElevatedButton('Edit Profile', () {
          // Implement edit profile logic
        }),
      ],
    );
  }

  Widget buildButtonsListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildElevatedButton('My Pets', () {
          // Implement my pets logic
        }),
        buildElevatedButton('My Requests', () {
          // Implement my requests logic
        }),
      ],
    );
  }

  Widget buildElevatedButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
