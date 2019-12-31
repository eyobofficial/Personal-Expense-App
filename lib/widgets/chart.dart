import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    // Return a map of last week's transactions
    return List.generate(7, (int index) {
      var totalAmount = 0.0;
      final weekDate = DateTime.now().subtract(Duration(days: index));

      for (Transaction transaction in recentTransactions) {
        if (transaction.date.day == weekDate.day &&
            transaction.date.month == weekDate.month &&
            transaction.date.year == weekDate.year) {
          totalAmount += transaction.amount;
        }
      }
      return {'day': DateFormat.E().format(weekDate)[0], 'amount': totalAmount};
    });
  }

  double get totalSpending {
    // Return total weekly spending
    return groupedTransactions.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.0,
      child: Card(
        margin: EdgeInsets.all(12),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactions.map((trx) {
              return Flexible(
                fit: FlexFit.tight,
                child: Column(
                  children: <Widget>[
                    ChartBar(trx, totalSpending),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
