import 'package:flutter/material.dart';
import 'package:meals_challenge/models/dummy_data.dart';
import 'package:meals_challenge/widgets/category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  static const routeName = '/category-screen';

  final categories = dummyCategories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) => CategoriesWidget(
        categoryItem: categories[i],
      ),
      itemCount: categories.length,
    );
  }
}
