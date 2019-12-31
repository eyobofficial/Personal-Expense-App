import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function addCallback;

  TransactionForm(this.addCallback);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitTransaction() {
    final title = _titleController.text;
    final amountText = _amountController.text;

    if (title.isNotEmpty && amountText.isNotEmpty && _selectedDate != null) {
      try {
        final amount = double.parse(amountText);
        widget.addCallback(title, amount, _selectedDate);
        Navigator.of(context).pop();

        // Clear controllers
        _titleController.clear();
        _amountController.clear();
      } catch (e) {
        print('Error Occured. Handle error here...');
      }
    }
  }

  void _openDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) return;
      setState(() => _selectedDate = date);
    });
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
                controller: _titleController,
                onSubmitted: (_) => _submitTransaction()),
          ),

          // Amount Input
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 12,
            ),
            child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitTransaction()),
          ),

          // Date
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _selectedDate == null ? '(No date selected)' : 'Transaction Date: ${DateFormat.yMd().format(_selectedDate)}',
                  style: TextStyle(color: Colors.grey),
                ),
                FlatButton(
                  onPressed: _openDatePicker,
                  child: Text(
                    'Choose date',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Add Button
          Padding(
            padding: const EdgeInsets.only(top: 24, right: 12),
            child: RaisedButton(
              onPressed: _submitTransaction,
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
