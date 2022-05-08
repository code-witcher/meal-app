import 'package:flutter/material.dart';
import 'package:meals_challenge/screens/meal_details_screen.dart';

import '../models/meals.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget(this.currentMeal, {Key? key}) : super(key: key);

  final Meal currentMeal;

  String affordability(){
    switch(currentMeal.affordability) {
      case Affordability.affordable:
      return 'Affordable';
      case Affordability.pricey:
        return 'Pricey';
      case Affordability.luxurious:
        return 'Luxurious';
      default:
      return 'Unknown';
    }
  }

  String complexity(){
    switch(currentMeal.complexity){
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
      return 'Unknown';
    }
  }

  void navigateMealDetails(BuildContext context, String mealId){
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: mealId,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 360,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          PositionedDirectional(
            top: 80,
            child: InkWell(
              onTap: () => navigateMealDetails(context, currentMeal.id),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 130, left: 20, right: 20, bottom: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentMeal.title,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 36,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '${currentMeal.duration} min',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.work,
                                  size: 36,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  complexity(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.attach_money,
                              size: 36,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              affordability(),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => navigateMealDetails(context, currentMeal.id),
            child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(currentMeal.imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
