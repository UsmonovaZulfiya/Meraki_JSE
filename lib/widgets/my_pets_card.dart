import 'package:flutter/material.dart';

class MyPetsCard extends StatelessWidget {
  final String imageUrl;
  final String petName;

  MyPetsCard({required this.imageUrl, required this.petName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
    {
      // Navigate to the My Pets page on tap
      onPressed:
          () {
        Navigator.pushNamed(context, '/my_pets_page');
      };
      child:
      Container(
        width: 150, // Adjust the width as needed
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                petName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  //textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

