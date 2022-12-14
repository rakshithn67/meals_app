import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoriesItem({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.7),
            color,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
