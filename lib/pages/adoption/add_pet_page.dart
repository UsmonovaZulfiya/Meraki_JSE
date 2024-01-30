import 'package:flutter/material.dart';
import 'package:untitled/widgets/input_widget.dart';

class Pet {
  String name;
  int age;
  String breed;
  String gender;
  String petType;
  String petPhoto;
  Map<String, String> medicalInfo;
  String additionalInfo;

  Pet({
    required this.name,
    required this.age,
    required this.breed,
    required this.gender,
    required this.petType,
    required this.petPhoto,
    required this.medicalInfo,
    required this.additionalInfo,
  });
}

class AdoptionInputPage extends StatefulWidget {
  @override
  _AdoptionInputPageState createState() => _AdoptionInputPageState();
}

class _AdoptionInputPageState extends State<AdoptionInputPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController medicalInfoController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();

  String gender = '';
  String petType = '';

  Pet pet = Pet(
    name: '',
    age: 0,
    breed: '',
    gender: '',
    petType: '',
    petPhoto: '',
    medicalInfo: {},
    additionalInfo: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Adoption'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular image placeholder
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.grey),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pet.petPhoto),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Input field for pet name below the image
              InputWidget(
                label: 'Pet Name',
                controller: nameController,
              ),

              SizedBox(height: 16),

              // Space for displaying the pet's name
              Text(
                pet.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),

              SizedBox(height: 16),

              // Input field for pet age
              InputWidget(
                label: 'Age',
                controller: ageController,
              ),

              SizedBox(height: 16),

              // Dropdown field for pet type
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Pet Type',
                  border: OutlineInputBorder(),
                ),
                value: petType,
                items: ['Dog', 'Cat', 'Bird', 'Others'].map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    petType = value ?? '';
                  });
                },
              ),

              SizedBox(height: 16),

              // Input field for breed
              InputWidget(
                label: 'Breed',
                controller: breedController,
              ),

              SizedBox(height: 16),

              // Dropdown field for gender
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                value: gender,
                items: ['Male', 'Female'].map((String gen) {
                  return DropdownMenuItem<String>(
                    value: gen,
                    child: Text(gen),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    gender = value ?? '';
                  });
                },
              ),

              SizedBox(height: 16),

              // Input field for medical information
              InputWidget(
                label: 'Medical Info',
                controller: medicalInfoController,
              ),

              SizedBox(height: 16),

              // Input field for additional information
              InputWidget(
                label: 'Additional Info (Optional)',
                controller: additionalInfoController,
              ),

              SizedBox(height: 16),

              // Buttons
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement logic for cancel button
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement logic for add pet button

                      // Input validation
                      if (nameController.text.isEmpty ||
                          ageController.text.isEmpty ||
                          breedController.text.isEmpty ||
                          medicalInfoController.text.isEmpty ||
                          petType.isEmpty ||
                          gender.isEmpty) {
                        // Display an error message or handle it as appropriate
                        print('Please fill in all required fields.');
                        return;
                      }

                      // Save data to the Pet object
                      pet = Pet(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        breed: breedController.text,
                        gender: gender,
                        petType: petType,
                        petPhoto: '', // Replace with actual image URL
                        medicalInfo: {
                          'info': medicalInfoController.text,
                        },
                        additionalInfo: additionalInfoController.text,
                      );

                      // Do something with the pet data (e.g., save to database)
                      // For now, just print the pet details
                      //print('Pet Details: ${pet.name}, ${pet.age}, ${pet.breed}, ${pet.gender}, ${pet.petType}, ${pet.petPhoto}, ${pet.medicalInfo}');
                      Navigator.pushNamed(context, '/my_pets_page');
                    },
                    child: Text('Add Pet'),
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
