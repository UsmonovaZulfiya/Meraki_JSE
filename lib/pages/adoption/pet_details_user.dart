import 'package:flutter/material.dart';
import 'package:untitled/widgets/input_widget.dart';
import 'package:untitled/widgets/pet_profile_widget.dart';
import 'package:untitled/widgets/user_card_widget.dart';
import 'add_pet_page.dart';

class Pet {
  String name;
  int age;
  String breed;
  String gender;
  String petType;
  String petPhoto;
  Map<String, String> medicalInfo;
  String additionalInfo;
  User user;

  Pet({
    required this.name,
    required this.age,
    required this.breed,
    required this.gender,
    required this.petType,
    required this.petPhoto,
    required this.medicalInfo,
    required this.additionalInfo,
    required this.user,
  });
}
class User {
  String userName;
  String userEmail;
  String phoneNumber;
  String photoUrl;

  User({
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.photoUrl,
  });
}

class AdoptionInputPage extends StatefulWidget {
  // This constructor can be used to pass the pet information from the backend
  const AdoptionInputPage({Key? key, required this.pet, required this.user}) : super(key: key);

  final Pet pet;
  final User user;

  @override
  _AdoptionInputPageState createState() => _AdoptionInputPageState();
}

class _AdoptionInputPageState extends State<AdoptionInputPage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController breedController;
  late TextEditingController medicalInfoController;
  late TextEditingController additionalInfoController;

  String gender = '';
  String petType = '';


  @override
  void initState() {
    super.initState();
    // Initialize controllers and set the pet data if available
    nameController = TextEditingController(text: widget.pet.name);
    ageController = TextEditingController(text: widget.pet.age.toString());
    breedController = TextEditingController(text: widget.pet.breed);
    medicalInfoController = TextEditingController(text: widget.pet.medicalInfo['info']);
    additionalInfoController = TextEditingController(text: widget.pet.additionalInfo);
    gender = widget.pet.gender;
    petType = widget.pet.petType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // PetProfileWidget
              PetProfileWidget(
                petName: widget.pet.name,
                breed: widget.pet.breed,
                gender: widget.pet.gender,
                photoUrl: widget.pet.petPhoto,
              ),

              SizedBox(height: 16),

              // Medical Background Info
              Container(
                color: Colors.blue, // Set the background color for medical info
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Medical Background', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 8.0),
                    Text(widget.pet.medicalInfo['info'] ?? 'N/A', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // Description (Additional Info)
              Container(
                color: Colors.green, // Set the background color for description
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 8.0),
                    Text(widget.pet.additionalInfo ?? 'N/A', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              SizedBox(height: 16),

              // UserCard
              UserCard(
                photoUrl: widget.user.photoUrl,
                userName: widget.user.userName,
                userEmail: widget.user.userEmail,
                phoneNumber: widget.user.phoneNumber,
              ),

              SizedBox(height: 16),

              // Adopt Button
              ElevatedButton(
                onPressed: () {
                  // Implement logic for adopt button
                  // Display the "Adopt accepted" text and contact information
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Adopt accepted', style: TextStyle(fontSize: 24.0)),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Connect with owner via phone or email',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text('Phone: ${widget.user.phoneNumber}'),
                            Text('Email: ${widget.user.userEmail}'),
                          ],
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Adopt'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}