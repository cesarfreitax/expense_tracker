import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) => Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.7),
                margin: Theme.of(context).cardTheme.margin,
                child: Icon(
                  Icons.delete,
                        color: Theme.of(context).colorScheme.onError,
                ),
              ),
              onDismissed: (direction) => {onRemoveExpense(expenses[index])},
              key: ValueKey(expenses[index]),
              child: ExpenseItem(expenses[index]))),
    );
  }
}
