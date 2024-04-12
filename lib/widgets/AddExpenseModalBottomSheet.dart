import 'package:flutter/material.dart';

class AddExpenseModalBottomSheet extends StatefulWidget {
  const AddExpenseModalBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseModalBottomSheetState();
  }

}

class _AddExpenseModalBottomSheetState extends State<AddExpenseModalBottomSheet> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "Title"
              )
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: const InputDecoration(
              label: Text(
                "Amount"
              )
            ),
          ),
          Row(
            children: [
              const Spacer(),
              TextButton(onPressed: () {}, child: const Text("Cancel")),
              const SizedBox(width: 8),
              ElevatedButton(
                  onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
              },
                  child: const Text("Save new expense")),
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
