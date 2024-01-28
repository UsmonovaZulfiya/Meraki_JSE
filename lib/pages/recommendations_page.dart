import 'package:flutter/material.dart';
import 'category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care Recommendations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendationsPage(),
    );
  }
}

class RecommendationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommendations for pets'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          _buildCategoryCard(context, 'Recommendations for Dogs', 'dogs'),
          _buildCategoryCard(context, 'Recommendations for Cats', 'cats'),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String animalType) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CareDetailsPage(animalType: animalType),
            ),
          );
        },
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}