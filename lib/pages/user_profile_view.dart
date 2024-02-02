import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/user_card_widget.dart';

import '../dto/user.dart';
import '../service/database.dart';

class UserProfilePage extends StatelessWidget {
  final String firstName = 'John';
  final String lastName = 'Doe';// Replace with actual user name
  final String userEmail = 'john.doe@example.com'; // Replace with actual user email
  final String phoneNumber = '+1 123-456-7890'; // Replace with actual user phone number

  @override
  Widget build(BuildContext context) {
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;
    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: userUid != null
          ? FutureBuilder<Map<String, dynamic>?>(
        future: dbService?.fetchUserData(userUid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final userData = snapshot.data!;
              // Use userData to populate your UserCard and other profile data
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserCard(
                      firstName: userData['firstName'] ?? 'N/A',
                      lastName: userData['lastName'] ?? 'N/A',
                      userEmail: userData['email'] ?? 'N/A',
                      phoneNumber: userData['phoneNumber']?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: 12,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About Me:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                            userData['about'] ?? 'N/A',
                        ),
                  ],
                ),
                    // Other profile widgets...
                  ],
                ),

              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      )
          : Center(child: Text("No user ID found")),
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
