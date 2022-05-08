import 'package:flutter/material.dart';
import 'package:meals_challenge/models/dummy_data.dart';
import 'package:meals_challenge/models/filters_vars.dart';
import 'package:meals_challenge/screens/categories_screen.dart';
import 'package:meals_challenge/screens/meal_details_screen.dart';
import 'package:meals_challenge/screens/meals_screen.dart';
import 'package:meals_challenge/screens/settings_screen.dart';
import 'package:meals_challenge/screens/tabs_screen.dart';
import './models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> filtteredMeals = DUMMY_MEALS;

  FiltersVars filt = FiltersVars(
    gluten: false,
    lactose: false,
    vegan: false,
    vegetarian: false,
  );

  void saveFilters(FiltersVars filtters) {
    setState(() {
      filt = filtters;
      filtteredMeals = DUMMY_MEALS.where((meal) {
        if (filt.gluten && !meal.isGlutenFree) {
          return false;
        }
        if (filt.lactose && !meal.isLactoseFree) {
          return false;
        }
        if (filt.vegan && !meal.isVegan) {
          return false;
        }
        if (filt.vegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List<Meal> favoriteMeals = [];

  void toogleMeals(String mealId) {
    int exestingIndex = favoriteMeals.indexWhere((meal) => mealId == meal.id);

    if (exestingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(exestingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool isFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        accentColor: Colors.teal.shade400,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.blueGrey.shade900,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: TabsScreen(favoriteMeals),
      routes: {
        MealsScreen.routeName: (context) => MealsScreen(filtteredMeals),
        SettingsScreen.routeName: (context) => SettingsScreen(saveFilters, filt),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        MealDetailsScreen.routeName: (context) =>
            MealDetailsScreen(toogleMeals, isFavorite),
      },
    );
  }
}
