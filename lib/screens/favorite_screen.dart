import 'package:flutter/material.dart';

import '../widgets/meals_widge.dart';
import '../models/meals.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen(this.favoritesMeals, { Key? key }) : super(key: key);

  final List<Meal> favoritesMeals;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}


class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.favoritesMeals.isEmpty? Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('No favorite meals yet - Try adding some!', 
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,),
      ),
    ):  ListView.builder(
        itemBuilder: (ctx, i) => MealsWidget(widget.favoritesMeals[i]),
        itemCount: widget.favoritesMeals.length,
      );
  }
}