import 'package:flutter/material.dart';
import 'pet.dart';

class PetsListPage extends StatelessWidget {
  final List<Pet> pets = [
    Pet(name: 'Buddy', breed: 'Labrador', imageUrl: 'https://placekitten.com/200/300', animalType: 'Dog'),
    Pet(name: 'Charlie', breed: 'Beagle', imageUrl: 'https://placekitten.com/201/301', animalType: 'Dog'),
    Pet(name: 'Max', breed: 'Golden Retriever', imageUrl: 'https://placekitten.com/202/302', animalType: 'Dog'),
    Pet(name: 'Sola', breed: 'Abyssinian cat', imageUrl: 'https://placekitten.com/203/303', animalType: 'Cat'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption'),
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 7.0),
            _buildFilterSection(),
            SizedBox(height: 7.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
                            child: Image.network(
                              pets[index].imageUrl,
                              fit: BoxFit.cover,),),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pets[index].name,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                pets[index].breed,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),),],),),],),);},),),],),),);}
  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for pets...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (query) {
          // will be implemented search func
        },
      ),
    );
  }

  Widget _buildFilterSection() {
    List<Map<String, dynamic>> animalFilters = [
      {'type': 'All', 'icon': Icons.pets},
      {'type': 'Dog', 'icon': Icons.pets},
      {'type': 'Cat', 'icon': Icons.pets},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 60.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animalFilters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // will be implemented filter func
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(animalFilters[index]['icon']),
                  SizedBox(width: 8.0),
                  Text(animalFilters[index]['type']),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
