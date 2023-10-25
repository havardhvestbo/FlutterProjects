import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

/// Provides access to the list of available meals.
///
/// The data is fetched from a predefined dummy data set.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
