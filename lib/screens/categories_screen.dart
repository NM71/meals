import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

// for custom (explicit) animations we need to convert stateless to stateful widget
// We have to add animation to the state object
// Because behind the scenes, an animation sets the state and updates the UI all the time as long as the animation is running

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    // required this.onToggleFavorite,
    required this.availableMeals,
  });

  // final void Function(MealModel meal) onToggleFavorite;
  final List<MealModel> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // For animation
  // 'late' keyword means that the variable will be initialized later when it will be used for the first time
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // Animation controller is set before the build method is called
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      // We always animate b/w two values
      // The animation will start from 0 and end at 1
      lowerBound: 0, // This is the default value
      upperBound: 1, // This is the default value
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

// Select Category method for Navigation
  void _selectCategory(BuildContext context, CategoryModel category) {
    // Filtering meals related to a category
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              // onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            // using map
            // availableCategories
            //     .map((category) => CategoryGridItem(category: category))
            //     .toList()

            // using for-in loop
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
        // This function here in builder will execute for every tick of animation (like 60 times per second here)
        builder: (context, child) => Padding(
              padding: EdgeInsets.only(
                top: 100 - _animationController.value * 100,
              ),
              child: child,
            ));
  }
}
