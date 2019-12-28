import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_form.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  bool _isError = false;
  final List<Transaction> _transactions = [
    Transaction(
      id: 't01',
      title: 'Latte',
      amount: 32.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't02',
      title: 'Coffee Beans',
      amount: 76.99,
      date: DateTime(2019, 6, 30),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now()
            .toString(), // Temporary solution to make the ID unique
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() => _transactions.add(newTransaction));
    _isError = false;
  }

  void _raiseError() => setState(() => _isError = true);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(
          addCallback: _addTransaction,
          isError: _isError,
          raiseError: _raiseError,
        ),
        TransactionList(_transactions.reversed.toList()),
      ],
    );
  }
}
