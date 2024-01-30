import 'package:flutter/material.dart';

class PetProfileWidget extends StatelessWidget {
  final String petName;
  final String breed;
  final String gender;
  final String photoUrl; // Assuming the photo is loaded from a URL

  PetProfileWidget({
    required this.petName,
    required this.breed,
    required this.gender,
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pet Photo
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(photoUrl),
              ),
            ),
          ),
          SizedBox(width: 16.0), // Add some space between photo and text

          // Pet Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  petName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Breed: $breed',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Gender: $gender',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
