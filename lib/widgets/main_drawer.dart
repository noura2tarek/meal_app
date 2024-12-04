import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 40.0,
              ),
              const SizedBox(width: 20.0),
              Text(
                'Cooking Up',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            //Navigator.of(context).pop();
            onSelectScreen('meals');
          },
          leading: Icon(
            Icons.restaurant,
            size: 26.0,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
        ListTile(
          onTap: () {
            onSelectScreen('filters');
          },
          leading: Icon(Icons.settings, size: 26.0),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
      ]),
    );
  }
}
