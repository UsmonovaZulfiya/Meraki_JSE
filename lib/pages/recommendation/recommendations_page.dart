import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'category_page.dart';

class RecommendationsPage extends StatefulWidget {
  const RecommendationsPage({super.key});

  State<RecommendationsPage> createState() => _RecommendationsPageState();}


  class _RecommendationsPageState extends State<RecommendationsPage> {
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
  buildCategoryCard(context, 'Recommendations for Dogs', 'dogs'),
  buildCategoryCard(context, 'Recommendations for Cats', 'cats'),
  ],
  ),
  );
  }

  Widget buildCategoryCard(BuildContext context, String title, String animalType) {
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