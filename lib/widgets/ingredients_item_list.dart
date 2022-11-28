import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final int selectedMealType;
  final List<String> selectedMealText;

  const IngredientItem({
    Key? key,
    required this.selectedMealType,
    required this.selectedMealText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 300,
      child: ListView.builder(
        itemCount: selectedMealType,
        itemBuilder: (context, index) => Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(selectedMealText[index]),
          ),
        ),
      ),
    );
  }
}
