// Importing necessary packages
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Formatter for date in the format 'Year-Month-Day'
final formatter = DateFormat.yMd();

// UUID generator instance for unique identification
const uuid = Uuid();

// Enum to represent different categories of expenses
enum Category { food, travel, leisure, work }

// Mapping of categories to their respective icons
const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.local_movies,
  Category.work: Icons.work,
};

// Class to represent an Expense
class Expense {
  // Constructor for the Expense class
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Assigning a unique ID to each expense using UUID

  final String id; // Unique identifier for the expense
  final String title; // Title or description of the expense
  final double amount; // Amount of the expense
  final DateTime date; // Date of the expense
  final Category category; // Category of the expense

  // Getter to retrieve the formatted date of the expense
  String get formattedDate {
    return formatter.format(date);
  }
}

// Class to represent a bucket or group of expenses for a specific category
class ExpenseBucket {
  // Constructor for the ExpenseBucket class
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Constructor to create an ExpenseBucket for a specific category
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList(); // Filtering expenses based on the given category

  final Category category; // Category of the bucket
  final List<Expense> expenses; // List of expenses in the bucket

  // Getter to calculate the total amount of all expenses in the bucket
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
