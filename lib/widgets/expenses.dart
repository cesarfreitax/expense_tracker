import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expense_modal_bottom_sheet/add_expense_modal_bottom_sheet.dart';
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
  final List<Expense> expenses = [];

  void addNewExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final int expenseIndex = expenses.indexOf(expense);

    setState(() {
      expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Expense removed!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              expenses.insert(expenseIndex, expense);
            });
          },
        )));
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bool isPortraitMode = mediaQuery.size.height > mediaQuery.size.width;

    final Widget mainContent = expenses.isEmpty
        ? const Center(child: Text('Expenses list is empty.'))
        : ExpensesList(expenses: expenses, onRemoveExpense: removeExpense);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        actions: [
          IconButton(onPressed: addExpenseItem, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: isPortraitMode
            ? Column(
                children: [
                  Chart(expenses: expenses),
                  Expanded(child: mainContent)
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Chart(expenses: expenses),
                  ),
                  Expanded(child: mainContent)
                ],
              ),
      ),
    );
  }

  void addExpenseItem() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) =>
            AddExpenseModalBottomSheet(addNewExpense: addNewExpense));
  }
}
