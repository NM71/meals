import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsNotifier() : super([]);
  // This '[]' passed into super() is the data we will store in the StateNotifier
  // and eventually in the StateNotifierProvider

// The methods we define in this class will be used to manipulate the data (state)
// We are not allowed to edit existing value in the memory, we can only replace it (create a new one)

// We cannot call methods like add/remove on the [] passed to super(),
// Infact we have to use a globally available 'state' to replace a value
// This 'state' property is made available by StateNotifier Class and it hold our data which is the [] passed to super()
  bool toggleFavoriteMealStatus(MealModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      // if id of meal in 'state' is not equal to id of meal passed to the function,
      // remove the favorite, else add to favorite
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealModel>>((ref) {
  return FavoriteMealsNotifier();
});
