import 'package:flutter/material.dart';
import 'package:untitled/widgets/pet_card_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _PetSearchPageState createState() => _PetSearchPageState();
}

class _PetSearchPageState extends State<SearchPage> {
  String searchQuery = '';

  void performSearch(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  List<Map<String, dynamic>> pets = [
    {
      'image': 'https://example.com/pet1.jpg',
      'name': 'Max',
      'breed': 'Bulldog',
      'age': 3,
      'gender': 'Male',
    },
  ];

  List<Map<String, dynamic>> get filteredPets {
    if (searchQuery.isEmpty) {
      return pets;
    } else {
      return pets.where((pet) => pet['breed'].toLowerCase().contains(searchQuery.toLowerCase())).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter breed',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              performSearch(searchQuery);
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (1 / 1.2),
        ),
        itemCount: filteredPets.length,
        itemBuilder: (context, index) {
          final pet = filteredPets[index];
          return PetCard(
            image: pet['image'],
            name: pet['name'],
            breed: pet['breed'],
            age: pet['age'],
            gender: pet['gender'],
          );
        },
      ),
    );
  }
}

