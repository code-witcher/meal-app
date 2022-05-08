import 'package:flutter/material.dart';
import 'package:meals_challenge/models/meals.dart';
import 'package:meals_challenge/widgets/meals_widge.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  static const routeName = '/meals-screen';

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final List<Meal> diplayedMeals = availableMeals.where((meal) {
      return meal.categories.contains(arguments['id']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['title'].toString()),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => MealsWidget(diplayedMeals[i]),
        itemCount: diplayedMeals.length,
      ),
    );
  }
}
