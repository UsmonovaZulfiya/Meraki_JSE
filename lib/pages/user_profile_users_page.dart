import 'package:flutter/material.dart';
import 'package:untitled/widgets/user_card_widget.dart';

class UserProfilePage extends StatelessWidget {
  final String photoUrl = 'https://cdn2.iconfinder.com/data/icons/veterinary-12/512/Veterinary_Icons-16-512.png'; // Replace with actual photo URL
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
              photoUrl: photoUrl,
              userName: userName,
              userEmail: userEmail,
              phoneNumber: phoneNumber,
            ),

            SizedBox(height: 16.0),

            // About Section
            buildAboutSection(),
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
}
