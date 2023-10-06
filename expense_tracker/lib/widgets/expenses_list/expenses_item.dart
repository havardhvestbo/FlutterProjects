// Importing necessary Flutter material design library
import 'package:flutter/material.dart';

// Importing the Expense model
import 'package:expense_tracker/models/expense.dart';

// A stateless widget to represent an individual expense item
class ExpenseItem extends StatelessWidget {
  // Constructor for the ExpenseItem widget
  const ExpenseItem(this.expense, {super.key});

  // The expense data to be displayed
  final Expense expense;

  // The build method to describe the part of the user interface represented by this widget
  @override
  Widget build(BuildContext context) {
    return Card(
      // Wrap the content inside a card for better visual distinction
      child: Padding(
        // Add padding around the content
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          // Align content to the start
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the title of the expense
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4), // Add a little vertical spacing
            Row(
              children: [
                // Display the amount of the expense
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(), // Push the next content to the end
                Row(
                  children: [
                    // Display the icon corresponding to the expense category
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8), // Add a little horizontal spacing
                    // Display the formatted date of the expense
                    Text(expense.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
