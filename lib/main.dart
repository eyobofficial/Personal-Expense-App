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
      title: 'Xpensify',
      theme: ThemeData(
        primarySwatch: Colors.teal,
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
  // TODO: Retrieve data from SQLite database
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
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't03',
      title: 'Bottled Water',
      amount: 12.99,
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      id: 't04',
      title: 'Juice',
      amount: 35.50,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't05',
      title: 'Mobile Card',
      amount: 50.00,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    var lastWeek = DateTime.now().subtract(Duration(days: 7),);
    return _transactions.where((trx) => trx.date.isAfter(lastWeek)).toList();
  }

  void _addTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now()
            .toString(), // TODO: Temporary solution to make the ID unique
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
        title: Text('Xpensify'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openFormModalSheet(context),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Chart(_recentTransactions),
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
