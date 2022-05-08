import 'package:flutter/material.dart';
import 'package:meals_challenge/models/dummy_data.dart';
import 'package:meals_challenge/screens/categories_screen.dart';
import 'package:meals_challenge/screens/favorite_screen.dart';
import 'package:meals_challenge/widgets/drawer_widget.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int index = 0;

  late List<Map<String, Object>> diplayedPage;

  @override
  void initState() {
    
    diplayedPage = [
    {
      'title': 'Meals-Challenge',
      'page': const CategoriesScreen(),
    },
    {
      'title': 'Favorite Meals',
      'page': FavoriteScreen(widget.favoriteMeals),
    },
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meals-Challenge',
        ),
      ),
      drawer: DrawerWidget(),
      body: diplayedPage[index]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newVlaue) {
          setState(() {
            index = newVlaue;
          });
        },
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.category,
            ),
            label: 'Categories',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.star,
            ),
            label: 'Favorites',
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
