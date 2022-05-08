import 'package:flutter/material.dart';
import 'package:meals_challenge/screens/categories_screen.dart';
import 'package:meals_challenge/screens/settings_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  void navigateToFilters(BuildContext context, String routeName){
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).accentColor,
      child: Column(
        children: [
          Container(
            height: 120,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cook Up!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            width: double.infinity,
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () => navigateToFilters(context, '/'),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () => navigateToFilters(context, SettingsScreen.routeName),
          ),
        ],
      ),
    );
  }
}
