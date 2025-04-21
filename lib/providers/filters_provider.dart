import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  // defining the initial state
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  // defining methods to manipulate the state in a immutable way (Not editing)

  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    // state[filter] = isActive; //  not Allowed => mutating/editing state
    // instead we create a new map
    state = {
      ...state, // copies the existing map and it's key-value pairs defined before
      filter:
          isActive, // Picks the filter and replace the value  (values are passed to the setFilter() function)
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});
