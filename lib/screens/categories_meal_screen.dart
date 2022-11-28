import 'package:eight_project/models/Category.dart';
import 'package:eight_project/screens/meal_detail_screen.dart';
import 'package:eight_project/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:eight_project/dummy_data.dart';

import '../models/meal.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/mealList';
  final List<Meal> availableMeals;

  const CategoriesMealScreen({Key? key, required this.availableMeals}) : super(key: key);

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  late List<Meal> categoryMeals;
  late String categoryTitle;
  var loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (loadedInitData == false) {
      final args = ModalRoute.of(context)!.settings.arguments as Category;
      categoryTitle = args.title;
      categoryMeals = widget.availableMeals
          .where((element) => element.categories.contains(args.id))
          .toList();
      super.didChangeDependencies();
      loadedInitData = true;
    }
  }

  void removeMeal(mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, MealDetailScreen.routeName,
                    arguments: categoryMeals[index].id)
                .then((value) {
              removeMeal(value);
            });
          },
          child: MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          ),
        ),
      ),
    );
  }
}
