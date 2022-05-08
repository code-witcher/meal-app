import 'package:flutter/material.dart';

import 'package:meals_challenge/models/dummy_data.dart';
import 'package:meals_challenge/widgets/meal_details_widget.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(this.toggleMeals, this.isFavorite, {Key? key})
      : super(key: key);

  static const routeName = '/meal-details-screen';

  final Function toggleMeals;

  final Function isFavorite;

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final meal = DUMMY_MEALS.firstWhere((meal) {
      return mealId == meal.id;
    });

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(meal.title),
      ),
      body: MealDetailsWidget(meal),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleMeals(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
