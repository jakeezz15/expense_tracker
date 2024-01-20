import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
  }

  // disposing the unneeded controller after the modal is closed
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // VALID APPROACH FOR GETTiNG THE INPUT
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          // onChanged: _saveTitleInput,
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(label: Text('Title')),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                    label: Text('Amount'), prefixText: '\$ '),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Selected Date'),
                IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month))
              ],
            ))
          ],
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Expense')),
          ],
        ),
      ]),
    );
  }
}
