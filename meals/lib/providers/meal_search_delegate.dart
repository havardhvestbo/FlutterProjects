import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart'; // Ensure MealDetailsScreen is defined in this import

/// A delegate class for customizing meal search behavior.
class MealSearchDelegate extends SearchDelegate {
  /// List of meals to search from.
  final List<Meal> meals;

  /// Constructor to initialize with the list of [meals].
  MealSearchDelegate(this.meals);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search bar
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter the list of meals based on the search query
    final results = meals.where((meal) => meal.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final meal = results[index];
        return ListTile(
          title: Text(meal.title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal), // Navigate to meal details screen
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Provide suggestions based on the search query
    final suggestions = meals.where((meal) => meal.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final meal = suggestions[index];
        return ListTile(
          title: Text(meal.title),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal), // Navigate to meal details screen
              ),
            );
          },
        );
      },
    );
  }
}
