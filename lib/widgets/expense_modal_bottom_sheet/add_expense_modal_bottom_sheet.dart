import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_modal_bottom_sheet/expense_title_widget.dart';
import 'package:flutter/material.dart';

class AddExpenseModalBottomSheet extends StatefulWidget {
  const AddExpenseModalBottomSheet({super.key, required this.addNewExpense});

  final void Function(Expense) addNewExpense;

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseModalBottomSheetState();
  }
}

class _AddExpenseModalBottomSheetState
    extends State<AddExpenseModalBottomSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? selectedDate;

  void openDatePicker() async {
    final DateTime currentDate = DateTime.now();
    final DateTime firstDate =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day);

    final DateTime? selectedDateFromDatePicker = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: currentDate);

    setState(() {
      selectedDate = selectedDateFromDatePicker;
    });
  }

  ExpenseCategory selectedCategory = ExpenseCategory.leisure;

  void submitExpenseItem() {
    final bool titleIsInvalid = _titleController.text.trim().isEmpty;
    final double? amount = double.tryParse(_amountController.text);
    final bool amountIsInvalid = amount == null || amount <= 0;
    final bool dateIsInvalid = selectedDate == null;
    final bool formIsInvalid =
        titleIsInvalid || amountIsInvalid || dateIsInvalid;

    if (formIsInvalid) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Form is invalid!"),
                content: const Text(
                    "Please make sure you passed a valid input for title, amount and date.."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('OK'))
                ],
              ));
      return;
    }

    widget.addNewExpense(Expense(title: _titleController.text, amount: amount, date: selectedDate!, category: selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
      child: Column(
        children: [
          ExpenseTitleWidget(titleController: _titleController),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', label: Text("Amount")),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(selectedDate == null
                        ? 'No selected date'
                        : formatter.format(selectedDate!)),
                    IconButton(
                        onPressed: openDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: ExpenseCategory.values
                      .map(
                        (categoryItem) => DropdownMenuItem(
                            value: categoryItem,
                            child: Text(categoryItem.name.toUpperCase())),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedCategory = value;
                      });
                    }
                  }),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: submitExpenseItem,
                        child: const Text("Save new expense")),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
