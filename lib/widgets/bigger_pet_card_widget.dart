import 'package:flutter/material.dart';

class BiggerPetCard extends StatelessWidget {
  final String image;
  final String petType;
  final VoidCallback onPressed;

  BiggerPetCard({
    required this.image,
    required this.petType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Pet Image
            Container(
              height: 100.0, // Set your desired height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
              ),
            ),

            // Pet Type
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    petType,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
