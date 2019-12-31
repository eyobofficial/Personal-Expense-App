import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final Map<String, Object> dailyTransaction;
  final double weeklyTotal;

  ChartBar(this.dailyTransaction, this.weeklyTotal);

  double get spendingPercentage {
    // Get the ratio of daily spending to the weekly total spending
    if (weeklyTotal == 0) return 0.0;
    return (dailyTransaction['amount'] as double) / weeklyTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text(
            "\$${(dailyTransaction['amount'] as double).toStringAsFixed(0)}",
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: 12,
          height: 80,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Text(dailyTransaction['day']),
      ],
    );
  }
}
