import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer_options.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
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
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
          // Meals Option
          MainDrawerOptions(
            icon: Icons.restaurant,
            text: 'Meals',
            onTap: () => onSelectScreen('meals'),
          ),

          // Filters Option
          MainDrawerOptions(
            icon: Icons.settings,
            text: 'Filters',
            onTap: () => onSelectScreen('filters'),
          ),
        ],
      ),
    );
  }
}
