import 'package:eight_project/models/Category.dart';
import 'package:eight_project/screens/categories_meal_screen.dart';
import 'package:eight_project/widgets/categories_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Category> dummyCategories = [
    Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      color: Colors.red,
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
    ),
    Category(
      id: 'c4',
      title: 'German',
      color: Colors.amber,
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      color: Colors.blue,
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
    ),
    Category(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
    ),
    Category(
      id: 'c10',
      title: 'Summer',
      color: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: dummyCategories.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) => InkWell(
        splashColor: Colors.pink,
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.pushNamed(
            context,
            CategoriesMealScreen.routeName,
            arguments: Category(
              id: dummyCategories[index].id,
              title: dummyCategories[index].title,
            ),
          );
        },
        child: CategoriesItem(
          title: dummyCategories[index].title,
          color: dummyCategories[index].color,
        ),
      ),
    );
  }
}
