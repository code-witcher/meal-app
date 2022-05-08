import 'package:flutter/material.dart';
import 'package:meals_challenge/models/filters_vars.dart';
import 'package:meals_challenge/widgets/drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen(this.saveFilters, this.selectedFilter, {Key? key})
      : super(key: key);

  static const routeName = '/settings-screen';

  final Function saveFilters;
  final FiltersVars selectedFilter;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool glutenFree = false;
  bool lactoseFree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  void initState() {
    super.initState();
    glutenFree = widget.selectedFilter.gluten;
    lactoseFree = widget.selectedFilter.lactose;
    vegan = widget.selectedFilter.vegan;
    vegetarian = widget.selectedFilter.vegetarian;
  }

  Widget buildSwitchListTile(
      {required String title,
      required String subTitle,
      required bool currentValue,
      required Function(bool) onTap}) {
    return Column(
      children: [
        SwitchListTile(
          value: currentValue,
          onChanged: onTap,
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            subTitle,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilters(FiltersVars(
                  gluten: glutenFree,
                  lactose: lactoseFree,
                  vegan: vegan,
                  vegetarian: vegetarian,
                ));
                Navigator.of(context).pushReplacementNamed('/');
              },
              icon: const Icon(Icons.check))
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Text(
              'Filtter Your Meals!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          buildSwitchListTile(
              title: 'Gluten-Free',
              subTitle: 'include only free gluten meals.',
              currentValue: glutenFree,
              onTap: (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
          buildSwitchListTile(
              title: 'Lactose-Free',
              subTitle: 'include only free lactose meals.',
              currentValue: lactoseFree,
              onTap: (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
          buildSwitchListTile(
              title: 'Vegetarian',
              subTitle: 'include only vegetarian meals.',
              currentValue: vegetarian,
              onTap: (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
          buildSwitchListTile(
              title: 'Vegan',
              subTitle: 'include only vegan meals.',
              currentValue: vegan,
              onTap: (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
        ],
      ),
    );
  }
}
