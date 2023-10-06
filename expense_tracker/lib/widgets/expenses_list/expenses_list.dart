// Importing necessary widgets and models
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

// A stateless widget to represent a list of expenses
class ExpensesList extends StatelessWidget {
  // Constructor for the ExpensesList widget
  const ExpensesList({
    super.key,
    required this.expenses, // List of expenses to be displayed
    required this.onRemoveExpense, // Callback function to handle removal of an expense
  });

  // List of expenses to be displayed
  final List<Expense> expenses;

  // Callback function to handle removal of an expense
  final void Function(Expense expense) onRemoveExpense;

  // The build method to describe the part of the user interface represented by this widget
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, // Number of items in the list
      itemBuilder: (ctx, index) => Dismissible(
        // Allows the list item to be swiped away to dismiss
        key: ValueKey(expenses[index].id), // Unique key based on expense id
        background: Container(
          // Background color when item is being swiped
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          // Callback when item is swiped away
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]), // Display the expense item
      ),
    );
  }
}
