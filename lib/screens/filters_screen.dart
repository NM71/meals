import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs_screen.dart';
// import 'package:meals/widgets/main_drawer.dart';

// enum Filters {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });

  // final Map<Filters, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  // Local state variables for filters
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filters.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filters.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filters.vegetarian]!;
    _veganFilterSet = activeFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // Uncomment if want to use the drawer
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          ref.read(filtersProvider.notifier).setFilters({
            Filters.glutenFree: _glutenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegetarian: _vegetarianFilterSet,
            Filters.vegan: _veganFilterSet,
          });
          // if (didPop) return;
          // Navigator.of(context).pop();
        },
        child: Column(
          children: [
            // Gluten-Free Filter
            SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),

            // Lactose-Free Filter
            SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),

            // Vegetarian Filter
            SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),

            // Vegan Filter
            SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22)),
          ],
        ),
      ),
    );
  }
}
