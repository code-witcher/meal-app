import 'package:flutter/material.dart';

import '../models/meals.dart';

class MealDetailsWidget extends StatelessWidget {
  const MealDetailsWidget(this._meal, {Key? key}) : super(key: key);

  final Meal _meal;

  Widget buildListView(BuildContext context, List<String> titles, int length,){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
            height: 300,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemCount: length,
              itemBuilder: (ctx, i) => ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  child: Text(
                    '#${i + 1}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                title: Text(
                  titles[i],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final steps = _meal.steps.join('\n\n1- ');

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
            height: 300,
            child: CircleAvatar(
              radius: 200,
              backgroundImage: NetworkImage(
                _meal.imageUrl,
              ),
            ),
          ),
          const SizedBox(height: 20,),
          buildListView(context, _meal.ingredients, _meal.ingredients.length),
          buildListView(context, _meal.steps, _meal.steps.length),
        ],
      ),
    );
  }
}
