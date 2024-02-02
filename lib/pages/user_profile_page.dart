import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/service/authentication_service.dart';
import 'package:untitled/widgets/user_card_widget.dart';

import '../dto/user.dart';
import '../service/database.dart';


class UserProfilePage extends StatelessWidget {
  final String firstName = 'John';
  final String lastName = 'Doe';// Replace with actual user name
  final String userEmail = 'john.doe@example.com'; // Replace with actual user email
  final String phoneNumber = '+1 123-456-7890'; // Replace with actual user phone number

  final AuthService authService = AuthService();

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
              // You need to replace firstName, lastName, userEmail, phoneNumber
              // with actual data from userData
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserCard(
                      firstName: userData['firstName'] ?? 'N/A', // Replace with actual data
                      lastName: userData['lastName'] ?? 'N/A', // Replace with actual data
                      userEmail: userData['email'] ?? 'N/A', // Replace with actual data
                      phoneNumber: userData['phoneNumber'].toString() ?? 'N/A', // Replace with actual data
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Me:',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        Text(userData['about'] ?? 'N/A'),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    // Buttons Row
                    buildButtonsRow(context),
                    SizedBox(height: 16.0),
                    // Buttons List View
                    buildButtonsListView(context),
                  ],
                ),
              );
            } else {
              return Text("No data available");
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
          : Center(child: Text("No user ID found")),
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
          Navigator.pushNamed(context, '/edit_page');
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
    onPressed: () {Navigator.pushNamed(context, '/my_requests_page');},
      //TODO: correct the navigation here
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
