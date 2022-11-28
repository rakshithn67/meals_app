import 'package:flutter/material.dart';

class StepsItem extends StatelessWidget {
  final int selectedMealSteps;
  final List<String> selectedMealStepText;

  const StepsItem({Key? key, required this.selectedMealSteps, required this.selectedMealStepText}) : super(key: key);

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
        itemCount: selectedMealSteps,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text('#${index + 1}'),
              ),
              title: Text(
                selectedMealStepText[index],
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
