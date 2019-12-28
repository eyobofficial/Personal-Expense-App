import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final Function addCallback;
  final Function raiseError;
  final bool isError;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionForm({this.addCallback, this.isError, this.raiseError});

  void submitTransaction() {
    try {
      final title = titleController.text;
      final amount = double.parse(amountController.text);
      addCallback(title, amount);
    } catch (e) {
      raiseError();
    }
  }

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
                onSubmitted: (_) => submitTransaction()
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
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitTransaction()
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: isError
                  ? Text(
                      'Please provide a valid values.',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.left,
                    )
                  : Text(''),
            ),

            // Add Button
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: FlatButton(
                onPressed: submitTransaction,
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
