import 'package:flutter/material.dart';

class AddExpenseModalBottomSheet extends StatefulWidget {
  const AddExpenseModalBottomSheet({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddExpenseModalBottomSheetState();
  }

}

class _AddExpenseModalBottomSheetState extends State<AddExpenseModalBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (userInput) {
              print(userInput);
            },
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text(
                "Title"
              )
            ),
          ),
          ElevatedButton(
              onPressed: () {

          },
              child: const Text("Save new expense"))
        ],
      ),
    );
  }

}