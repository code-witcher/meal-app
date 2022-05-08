import 'package:flutter/material.dart';
import 'package:meals_challenge/models/category.dart';
import 'package:meals_challenge/screens/meals_screen.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key, required this.categoryItem})
      : super(key: key);

  final Category categoryItem;

  void _selectCategory(BuildContext ctx) {

    Navigator.of(ctx).pushNamed(
      MealsScreen.routeName,
      arguments: {'id': categoryItem.id, 'title': categoryItem.title,}
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Container(
        height: 160,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PositionedDirectional(
              end: 20,
              start: 30,
              child: Container(
                height: 150,
                child: Card(
                  color: categoryItem.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 6,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      categoryItem.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: 1,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(categoryItem.imageUrl),
              ),
            ),
            PositionedDirectional(
              end: 8,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => _selectCategory(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
