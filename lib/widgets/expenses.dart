import 'package:expense_tracker/widgets/AddExpenseModalBottomSheet.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
        title: "Cinema",
        amount: 6.50,
        date: DateTime.now(),
        category: ExpenseCategory.leisure),
    Expense(
        title: "Course",
        amount: 19.99,
        date: DateTime.now(),
        category: ExpenseCategory.work),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        actions: [
          IconButton(
              onPressed: addExpenseItem,
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Column(
        children: [
          ExpensesList(expenses: expenses)
        ],
      ),
    );
  }

  void addExpenseItem() {
    showModalBottomSheet(context: context, builder: (ctx) => const AddExpenseModalBottomSheet());
  }
}
