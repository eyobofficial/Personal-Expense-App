import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final Function addCallback;

  TransactionForm(this.addCallback);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitTransaction() {
    final title = titleController.text;
    final amountText = amountController.text;

    if (title.isNotEmpty && amountText.isNotEmpty) {
      try {
        final amount = double.parse(amountText);
        widget.addCallback(title, amount);
        Navigator.of(context).pop();

        // Clear controllers
        titleController.clear();
        amountController.clear();
      } catch (e) {
        print('Error Occured. Handle error here...');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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

          // Add Button
          Padding(
            padding: const EdgeInsets.only(top: 24, right: 12),
            child: RaisedButton(
              onPressed: submitTransaction,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
