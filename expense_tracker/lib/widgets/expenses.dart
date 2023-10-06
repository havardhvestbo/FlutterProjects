// Importing necessary widgets and models
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

// A stateful widget to represent the main expenses screen
class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  // Sample list of registered expenses
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  // Function to open the overlay for adding a new expense
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  // Function to add a new expense to the list
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  // Function to remove an expense from the list
  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    // Show a snackbar notification for the removal
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text('${expense.title} removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  // Variable to track the sorting order
  bool _isSortedByNewest = true;

  // Function to sort expenses by date
  void _sortExpensesByDate() {
    setState(() {
      if (_isSortedByNewest) {
        _registeredExpenses.sort((a, b) => a.date.compareTo(b.date));
      } else {
        _registeredExpenses.sort((a, b) => b.date.compareTo(a.date));
      }
      _isSortedByNewest = !_isSortedByNewest;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Default content when there are no expenses
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    // Update the content if there are expenses
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
            tooltip: 'Add Expense',
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          if (_registeredExpenses.isNotEmpty) ...[
            ElevatedButton(
              onPressed: _sortExpensesByDate,
              child: Text(_isSortedByNewest
                  ? 'Sort Oldest First'
                  : 'Sort Newest First'),
            ),
            Expanded(
              child: mainContent,
            ),
          ] else
            Expanded(
              child: mainContent,
            ),
        ],
      ),
    );
  }
}
