import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/input_widget.dart';
import 'package:untitled/dto/pet.dart';
import 'package:untitled/service/database.dart';
import '../../dto/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AdoptionInputPage extends StatefulWidget {
  const AdoptionInputPage({super.key});

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
    photoURL:
        'https://img.freepik.com/free-photo/cute-animals-group-white-background_23-2150038562.jpg',
    medicalInfo: '',
    addInfo: '',
  );

  Future<void> _captureAndUploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      File imageFile = File(image.path);
      setState(() {
        _petImage = imageFile;
      });
      // Now wait for the upload to complete before proceeding
      String? imageUrl = await _uploadImageToFirebase(imageFile);
      if (imageUrl != null) {
        setState(() {
          _imageUrl = imageUrl;
        });
      } else {
        print("Failed to upload image");
      }
    } else {
      print("No image selected");
    }
  }

  Future<String?> _uploadImageToFirebase(File imageFile) async {
    try {
      String filePath =
          'pets/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}';
      // Use refFromURL to specify your Firebase Storage bucket explicitly
      final ref = FirebaseStorage.instance
          .refFromURL('gs://petadoption-158ed.appspot.com')
          .child(filePath);
      final result = await ref.putFile(imageFile);
      final imageUrl = await result.ref.getDownloadURL();
      return imageUrl; // URL of the uploaded image
    } catch (e) {
      return null;
    }
  }

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
        photoURL:
            'https://img.freepik.com/free-photo/cute-animals-group-white-background_23-2150038562.jpg',
        // Replace with actual image URL
        //photoURL: imageUrl,
        medicalInfo: medicalInfoController.text,
        addInfo: additionalInfoController.text,
      );

      await dbService?.addPetData(pet);

      Navigator.pushNamed(context, '/my_pets_page');
    } catch (e) {
      print(e.toString());
    }
  }

  File? _petImage; // To temporarily store the picked image file
  String _imageUrl = ''; // To store the uploaded image URL

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
                child: GestureDetector(
                  onTap: _captureAndUploadImage,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.grey),
                      image: _petImage != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(_petImage!),
                            )
                          : null,
                    ),
                    child: _petImage == null
                        ? Icon(Icons.add_a_photo)
                        : null, // Only show icon if no image is selected
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
                decoration: const InputDecoration(
                  labelText: 'Pet Type',
                  border: OutlineInputBorder(),
                ),
                value: petType.isNotEmpty ? petType : null,
                // Ensure this matches an item or is null
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
                hint: Text(
                    'Select a pet type'), // Displayed if the current value is null
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
                value: gender.isNotEmpty ? gender : null,
                // Ensure this matches an item or is null
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
                hint: Text(
                    'Select a gender'), // Displayed if the current value is null
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
                      // Make sure to check if _imageUrl is set
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
