import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/screens/meals_details_screen.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    // required this.onToggleFavorite,
  });

  final String? title;
  final List<MealModel> meals;
  // final void Function(MealModel meal) onToggleFavorite;

  void _selectMeal(BuildContext context, MealModel meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetailsScreen(
              meal: meal,
              // onToggleFavorite: onToggleFavorite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    // if there are no meals available
    Widget content = Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Uh oh ... nothing here!',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Try selecting a different category!',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        )
      ],
    ));

// if meals are available
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
                meal: meals[index],
                onSelectMeal: (meal) => _selectMeal(context, meal),
              ));
    }

    if (title == null) {
      return content;
    }
    // A Widget which will act as a screen should return a Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
