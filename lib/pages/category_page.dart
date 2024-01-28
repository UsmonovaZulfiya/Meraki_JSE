import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CareDetailsPage extends StatelessWidget {
  final String animalType;

  CareDetailsPage({required this.animalType});

  final Map<String, IconData> categoryIcons = {
    'Nutrition & Sleep': Icons.fastfood,
    'Veterinarian visits': Icons.local_hospital,
    'Physical activities': Icons.fitness_center,
    'Training': Icons.school,
    'Pet toys': Icons.toys,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to take care of $animalType'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8.0),
        children: categoryIcons.entries.map((entry) {
          return _buildCategoryCard(context, entry.key, entry.value, animalType);
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, String animalType) {
    return Card(
      child: InkWell(
        onTap: () {
          _onCategoryTap(context, title, animalType);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40.0),
            SizedBox(height: 20),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _onCategoryTap(BuildContext context, String title, String animalType) {
    final route = MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('Details for $title')),
      ),
    );
    Navigator.push(context, route);
  }
}
