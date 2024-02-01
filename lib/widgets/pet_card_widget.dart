import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String image;
  final String name;
  final String breed;
  final int age;
  final String gender;
  final bool requestSent;
  final bool requestAccepted;

  PetCard({
    required this.image,
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    this.requestSent = false,
    this.requestAccepted = false,
  });

  // Conditional Status
  Widget buildStatus() {
    if (requestSent) {
      return Text('Status: Sent');
    } else if (requestAccepted) {
      return Text('Status: Accepted');
    } else {
      return Container(); // Empty container if no status to display
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Pet Image
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),

          // Pet Information
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
                SizedBox(height: 2.0),
                Text('$breed'),
                Text('$age years'),
                Text('$gender'),
              ],
            ),
          ),

          // Display Status
          buildStatus(),
        ],
      ),
    );
  }
}
