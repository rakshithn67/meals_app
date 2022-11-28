import 'package:eight_project/dummy_data.dart';
import 'package:eight_project/widgets/ingredients_item_list.dart';
import 'package:eight_project/widgets/ingredients_steps_item_list.dart';

import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-Detail';
  final Function toggleHandler;
  final Function favoriteHandler;

  const MealDetailScreen(
      {Key? key, required this.toggleHandler, required this.favoriteHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            IngredientItem(
              selectedMealType: selectedMeal.ingredients.length,
              selectedMealText: selectedMeal.ingredients,
            ),

            // Container(
            //   margin: const EdgeInsets.all(10),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   height: 150,
            //   width: 300,
            //   child: ListView.builder(
            //     itemCount: selectedMeal.ingredients.length,
            //     itemBuilder: (context, index) => Card(
            //       color: Colors.amber,
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             vertical: 5, horizontal: 10),
            //         child: Text(selectedMeal.ingredients[index]),
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Steps',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            StepsItem(
                selectedMealSteps: selectedMeal.steps.length,
                selectedMealStepText: selectedMeal.steps),
            // Container(
            //   margin: const EdgeInsets.all(10),
            //   padding: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   height: 150,
            //   width: 300,
            //   child: ListView.builder(
            //     itemCount: selectedMeal.steps.length,
            //     itemBuilder: (context, index) => Column(
            //       children: [
            //         ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.pink,
            //             child: Text('#$index'),
            //           ),
            //           title: Text(
            //             selectedMeal.steps[index],
            //             style: Theme.of(context).textTheme.bodyText2,
            //           ),
            //         ),
            //         const Divider(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleHandler(mealId),
        child: Icon(
          favoriteHandler(mealId)
              ? Icons.favorite
              : Icons.favorite_border_outlined,
        ),
      ),
    );
  }
}
