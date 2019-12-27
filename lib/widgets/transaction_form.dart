import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {
  final Function addTransactionCallback;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionForm(this.addTransactionCallback);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Title Input
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 12,
              ),
              child: TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
              ),
            ),

            // Amount Input
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 3,
                horizontal: 12,
              ),
              child: TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController
                ),
            ),

            // Add Button
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: FlatButton(
                onPressed: () {
                  final title = titleController.text;
                  final amount = double.parse(amountController.text);
                  addTransactionCallback(title, amount);
                },
                textColor: Colors.purple,
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
