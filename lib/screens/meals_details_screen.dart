import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });

  final MealModel meal;
  // final void Function(MealModel meal) onToggleFavorite;

  // IconData favIcon = Icons.star_outline;
  @override
  // for listening to providers we need to include an extra parameter in the build() method
  // It's Widget ref property, however it is automatically globaly available in case of ConsumerStatefulWidget
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              // We should not use ref.watch() inside a onPressed or onTap
              // Instead we should use ref.read() (read data once on tap of button)
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteMealStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Meal added to Favorites'
                      : 'Meal removed from Favorites')));

              // // widget.onToggleFavorite(widget.meal);
              // setState(() {
              //   if (favIcon == Icons.star_outline) {
              //     favIcon = Icons.star;
              //   } else {
              //     favIcon = Icons.star_outline;
              //   }
              // });
            },
            icon: Icon(Icons.star),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image of the meal
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 14,
            ),
            // Ingredients
            Text('Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 14,
            ),
            for (final ingredients in meal.ingredients)
              Text(ingredients,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(
              height: 24,
            ),
            Text('Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 14,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                child: Text(steps,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface)),
              ),
          ],
        ),
      ),
    );
  }
}
