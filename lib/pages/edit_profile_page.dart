import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dto/user.dart';
import '../service/database.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  // Fetch the current user's UID

  @override
  void initState() {
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;
    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }
    super.initState();
    if (userUid != null) {
      dbService?.fetchUserData(userUid);
    }
  }

  // Fetch user data from Firestore and populate the text fields

  @override
  Widget build(BuildContext context) {
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;
    DatabaseService? dbService;

    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InputWidget(
                label: 'First Name',
                controller: firstNameController,
              ),
              InputWidget(
                label: 'Last Name',
                controller: lastNameController,
              ),
              InputWidget(
                label: 'Phone Number',
                controller: phoneNumberController,
              ),
              InputWidget(
                label: 'About Yourself',
                controller: aboutController,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate back without saving changes
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Update user data with the values from the input fields, if changed
                        if (userUid != null) {
                          await DatabaseService(uid: userUid!)
                              .updateUserProfileData(
                            userUid!,
                            firstNameController.text,
                            lastNameController.text,
                            phoneNumberController.text,
                            aboutController.text,
                          );
                          // Optionally show a success message or navigate away
                          Navigator.pop(
                              context); // Go back to the user profile page
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final void Function()? onTap;

  InputWidget({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            // Add this decoration
            hintText: "Enter " + label + " if you want to change",
            // Use the hintText
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
