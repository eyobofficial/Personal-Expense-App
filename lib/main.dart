import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './widgets/user_transactions.dart';

void main() => runApp(XpenseApp());

class XpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpense - Personal Expense App',
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xpense App'),
        // backgroundColor: Colors.amber,
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Chart(),
          UserTransactions()
        ],
      ),
    );
  }
}
