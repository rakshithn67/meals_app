import 'package:eight_project/dummy_data.dart';
import 'package:eight_project/screens/categories_meal_screen.dart';
import 'package:eight_project/screens/filter_screen.dart';
import 'package:eight_project/screens/meal_detail_screen.dart';
import 'package:eight_project/screens/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = dummyMeals;
  List<Meal> favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
       
      });
    } else {
      setState(() {
        favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavoriteMeal(String mealId) {
    return favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 245, 235, 1),
        appBarTheme: AppBarTheme(
          color: Colors.pink,
          titleTextStyle: GoogleFonts.raleway(
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.raleway(
            fontSize: 17.5,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: GoogleFonts.raleway(
            fontSize: 15,
          ),
        ),
      ),
      home: TabScreen(
        favoriteMealHandler: favoriteMeals,
      ),
      routes: {
        CategoriesMealScreen.routeName: (context) =>
            CategoriesMealScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleHandler: toggleFavorite,
              favoriteHandler: isFavoriteMeal,
            ),
        FilterScreen.routeName: (context) => FilterScreen(
              filterHandler: _setFilters,
              currentFilters: _filters,
            ),
      },
    );
  }
}
