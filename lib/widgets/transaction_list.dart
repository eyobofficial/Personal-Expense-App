import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            elevation: 4,
            child: Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '\$${transactions[idx].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          transactions[idx].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Container(
                        child: Text(
                          transactions[idx].formattedDate,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
