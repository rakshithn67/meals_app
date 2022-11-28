

enum Complexity {
  hard,
  simple,
  challenging,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  String id;
  String title;
  List<String> categories;
  String imageUrl;
  int duration;
  List<String> ingredients;
  List<String> steps;
  Complexity complexity;
  Affordability affordability;
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  Meal(
      {required this.id,
      required this.title,
      required this.categories,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.complexity,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}
