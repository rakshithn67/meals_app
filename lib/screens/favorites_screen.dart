import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMealHandler;

  const FavoriteScreen({Key? key, required this.favoritesMealHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoritesMealHandler.isEmpty) {
      return const Center(
        child: Text('You have no  favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoritesMealHandler.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, MealDetailScreen.routeName,
                arguments: favoritesMealHandler[index].id)
                .then((value) {
              //removeMeal(value);
            });
          },
          child: MealItem(
            id: favoritesMealHandler[index].id,
            imageUrl: favoritesMealHandler[index].imageUrl,
            title: favoritesMealHandler[index].title,
            duration: favoritesMealHandler[index].duration,
            complexity: favoritesMealHandler[index].complexity,
            affordability: favoritesMealHandler[index].affordability,
          ),
        ),
      ) ;
    }
  }
}
