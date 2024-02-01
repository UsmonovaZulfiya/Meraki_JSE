import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/input_widget.dart';
import 'package:untitled/dto/pet.dart';
import 'package:untitled/service/database.dart';
import '../../dto/user.dart';

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
    id: '',
    name: '',
    age: 0,
    breed: '',
    gender: '',
    petType: '',
    photoURL: '',
    medicalInfo: '',
    addInfo: '',
  );

  Future<void> _addPet() async {
    try {
      final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;

      DatabaseService? dbService;

      if (userUid != null) {
        dbService = DatabaseService(uid: userUid);
      }

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
        id: ' ',
        name: nameController.text,
        age: int.parse(ageController.text),
        breed: breedController.text,
        gender: gender,
        petType: petType,
        photoURL: 'https://img.freepik.com/free-photo/cute-animals-group-white-background_23-2150038562.jpg', // Replace with actual image URL
        medicalInfo: medicalInfoController.text,
        addInfo: additionalInfoController.text,
      );

      await dbService?.addPetData(pet);

      Navigator.pushNamed(context, '/my_pets_page');
    } catch (e) {
      print(e.toString());
    }
  }

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
                  //TODO: implement photo adding and storing in firebase storage
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(pet.photoURL),
                  // ),
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
                decoration: const InputDecoration(
                  labelText: 'Pet Type',
                  border: OutlineInputBorder(),
                ),
                value: petType.isNotEmpty ? petType : null, // Ensure this matches an item or is null
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
                hint: Text('Select a pet type'), // Displayed if the current value is null
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
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                value: gender.isNotEmpty ? gender : null, // Ensure this matches an item or is null
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
                hint: Text('Select a gender'), // Displayed if the current value is null
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
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      _addPet();
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
