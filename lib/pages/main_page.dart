import 'package:flutter/material.dart';
import 'slide_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Categories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(name: 'Dogs', color: Colors.green),
    Category(name: 'Cats', color: Colors.red),
    Category(name: 'Other Pets', color: Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Code to go back
            Navigator.of(context).pop();
          },
        ),
        title: Text('Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SlidePage()),
              );
              },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryItem(
            category: categories[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetsListPage(category: categories[index].name),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  String name;
  Color color;

  Category({required this.name, required this.color});
}

class PetsListPage extends StatelessWidget {
  final String category;

  PetsListPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Pet> pets = List.generate(
      10,
          (index) => Pet(name: 'Pet $index', breed: 'Breed $index', age: 'Age $index'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text ('$category list'),
      ),

      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(pets[index].name),
            subtitle: Text('${pets
            [index].breed} | ${pets[index].age}'),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
            ),
          );
        },

      ),
    );
  }
}

class Pet {
  String name;
  String breed;
  String age;

  Pet({required this.name, required this.breed, required this.age});
}