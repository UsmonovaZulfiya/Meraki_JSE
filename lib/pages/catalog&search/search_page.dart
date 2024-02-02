import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/pet_card_widget.dart';
import 'package:untitled/pages/adoption/pet_details_view_user.dart';

import '../../dto/pet.dart';
import '../../dto/user.dart';
import '../../service/database.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _PetSearchPageState createState() => _PetSearchPageState();
}

class _PetSearchPageState extends State<SearchPage> {
  String searchQuery = '';
  List<Pet> pets = [];

  late DatabaseService dbService;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? userUid = Provider.of<MyUser?>(context, listen: false)?.uid;
    if (userUid != null) {
      dbService = DatabaseService(uid: userUid);
    }
  }

  void performSearch(String query) async {
    List<Pet>? searchResults = await dbService.fetchPetsByBreed(query);
    if (searchResults != null) {
      setState(() {
        pets = searchResults;
      });
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
          onChanged: (value) => performSearch(value),
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
      body: pets.isEmpty
          ? Center(child: Text('No pets found.'))
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (1 / 1.2),
        ),
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetProfilePageView(petId: pet.id),
                ),
              );
            },
            child: PetCard(
              image: pet.photoURL ?? '', // Handle null URL
              name: pet.name,
              breed: pet.breed,
              age: pet.age, // Convert age to String if necessary
              gender: pet.gender,
            ),
          );
        },
      ),
    );
  }
}
