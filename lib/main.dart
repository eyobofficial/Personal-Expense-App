import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';

void main() => runApp(XpenseApp());

class XpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  }

  void _openFormModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpense App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openFormModalSheet(context),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Chart(),
          TransactionList(_transactions.reversed.toList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openFormModalSheet(context),
      ),
    );
  }
}
