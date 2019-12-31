import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_detail.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteCallback;

  TransactionList(this.transactions, {@required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                SizedBox(
                  height: 24,
                ),
                Text(
                  'No transactions yet.',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 240,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, idx) => TransactionCard(
                transactions[idx],
                deleteCallback: deleteCallback,
              ),
              itemCount: transactions.length,
            ),
    );
  }
}
