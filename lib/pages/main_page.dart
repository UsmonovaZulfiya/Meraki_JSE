import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/service/authentication_service.dart';
import 'slide_page.dart';
import 'package:untitled/dto/pet.dart';

class MainScreen extends StatefulWidget {

  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Category> categories = [
    Category(name: 'Dogs', color: Colors.green),
    Category(name: 'Cats', color: Colors.red),
    Category(name: 'Other Pets', color: Colors.yellow),
  ];

  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      // This block will be executed when the back button is pressed.
      if (Navigator.of(context).canPop()) {
        // If there are any routes to pop, pop them.
        return true;
      } else {
        // If there are no routes to pop, exit the app.
        await SystemNavigator.pop();
        return false;
      }
    },
    child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async{

            await _auth.sign_out();
            Navigator.of(context).pushReplacementNamed('/welcome');
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
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

    ));
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
            style: const TextStyle(
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
            trailing: const CircleAvatar(
              backgroundColor: Colors.black,
            ),
          );
        },

      ),
    );
  }
}

