import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart'; // Import the file where MealDetailsScreen is defined

class MealSearchDelegate extends SearchDelegate {
  final List<Meal> meals;

  MealSearchDelegate(this.meals);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = meals.where((meal) => meal.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final meal = results[index];
        return ListTile(
          title: Text(meal.title),
          // Add other meal details if needed
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = meals.where((meal) => meal.title.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final meal = suggestions[index];
        return ListTile(
          title: Text(meal.title),
          // Add other meal details if needed
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MealDetailsScreen(meal: meal),
              ),
            );
          },
        );
      },
    );
  }
}
