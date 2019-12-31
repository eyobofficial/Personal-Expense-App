import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function deleteCallback;

  TransactionCard(this.transaction, {@required this.deleteCallback});

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: FittedBox(
                  child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(transaction.formattedDate),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteCallback(transaction.id),
            ),
          ),
        ),
      );
}
