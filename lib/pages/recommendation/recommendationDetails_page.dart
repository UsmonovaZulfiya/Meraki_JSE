import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendationsPage extends StatelessWidget {
  final String category;

  RecommendationsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final content = getContentForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('How to take care of $category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }

  String getContentForCategory(String category) {
    return 'Content for $category';
  }
}


