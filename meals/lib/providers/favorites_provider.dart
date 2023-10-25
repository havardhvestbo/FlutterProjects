import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

/// Manages the state of favorite meals.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  /// Initializes the list of favorite meals as empty.
  FavoriteMealsNotifier() : super([]);

  /// Toggles the favorite status of a meal.
  ///
  /// If the meal is already in favorites, it's removed. If not, it's added.
  /// Returns `true` if the meal is now in favorites, and `false` otherwise.
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

/// Provider to access and manipulate favorite meals.
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
