import 'package:flutter/material.dart';
import 'package:untitled/service/authentication_service.dart';
import 'package:untitled/widgets/user_card_widget.dart';


class UserProfilePage extends StatelessWidget {
  final String userPhotoUrl = 'https://cdn2.iconfinder.com/data/icons/veterinary-12/512/Veterinary_Icons-16-512.png'; // Replace with actual photo URL
  final String userName = 'John Doe'; // Replace with actual user name
  final String userEmail = 'john.doe@example.com'; // Replace with actual user email
  final String phoneNumber = '+1 123-456-7890'; // Replace with actual user phone number

  final AuthService authService = AuthService();

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
            buildButtonsListView(context),
          ],
        ),
      ),
    );
  }

  Widget buildAboutSection() {
    return const Column(
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
        buildElevatedButton('Log Out', () async {
          try {
            await authService.signOut();
            Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
          } catch (e) {
            // Handle the error or display a message to the user
          }
        }),
        buildElevatedButton('Edit Profile', () {
          // Implement edit profile logic
        }),
      ],
    );
  }

  Widget buildButtonsListView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      ElevatedButton(
      onPressed: () {Navigator.pushNamed(context, '/my_pets_page');},
      child: Text('My pets'),
    ),

    ElevatedButton(
    onPressed: () {Navigator.pushNamed(context, '/welcome');},
    child: Text('My requests'),
    ),
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
