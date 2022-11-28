import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return 'Simple';
        break;
      case Complexity.hard:
        return 'Hard';
        break;
      case Complexity.challenging:
        return 'Challenging';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.pricey:
        return 'Pricey';
        break;
      case Affordability.luxurious:
        return 'Luxurious';
        break;
      case Affordability.affordable:
        return 'Affordable';
        break;
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  width: 300,
                  color: Colors.black54,
                  child: Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                    ),
                    Text(
                      '$duration min',
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.work,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      complexityText,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      affordabilityText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
